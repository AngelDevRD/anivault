import 'package:anivault/core/statistics/stats_engine.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';

/// Construye el prompt de sistema para el Chat IA a partir de datos ya
/// calculados por [StatsEngine] y de la biblioteca del usuario.
///
/// La IA nunca calcula estadísticas: solo redacta respuestas usando los
/// números que Dart ya calculó. Este builder es la única fuente de contexto
/// que se le entrega al modelo.
class AiContextBuilder {
  const AiContextBuilder();

  /// Límite de obras listadas explícitamente para no exceder el presupuesto
  /// de tokens en bibliotecas grandes; el resumen agregado cubre el resto.
  static const _maxListedEntries = 300;

  String buildSystemPrompt(GlobalStats stats, List<MediaEntry> all) {
    final buffer = StringBuffer()
      ..writeln(
        'Eres el asistente de AniVault, una app de seguimiento de anime, '
        'manga, manhwa y manhua. Respondes SOLO con la información de la '
        'biblioteca del usuario que se te entrega abajo. Nunca inventes '
        'datos ni hagas cálculos propios: todos los números ya vienen '
        'calculados. Nunca recomiendes obras que el usuario ya completó, '
        'salvo que lo pida explícitamente. Responde en español, de forma '
        'breve y natural.',
      )
      ..writeln()
      ..writeln('## Resumen global');
    _writeSummary(buffer, stats);

    buffer.writeln();
    buffer.writeln('## Biblioteca (${all.length} obras)');
    final listed = all.take(_maxListedEntries);
    for (final e in listed) {
      buffer.writeln(_formatEntry(e));
    }
    if (all.length > _maxListedEntries) {
      buffer.writeln(
        '... y ${all.length - _maxListedEntries} obras más '
        '(usa el resumen global para preguntas agregadas sobre estas).',
      );
    }
    return buffer.toString();
  }

  void _writeSummary(StringBuffer buffer, GlobalStats stats) {
    buffer
      ..writeln('- Obras totales: ${stats.totalWorks}')
      ..writeln('- Episodios vistos: ${stats.totalEpisodes}')
      ..writeln('- Capítulos leídos: ${stats.totalChapters}')
      ..writeln('- Tiempo total: ${stats.time.compact}')
      ..writeln(
        '- Géneros favoritos: '
        '${stats.genreRanking.take(5).map((e) => e.key).join(', ')}',
      );
    for (final type in MediaType.values) {
      final g = stats.group(type);
      if (g == null || g.isEmpty) continue;
      buffer.writeln(
        '- ${type.label}: ${g.total} obras, ${g.completed} completadas, '
        'tiempo ${g.time.compact}',
      );
    }
  }

  String _formatEntry(MediaEntry e) {
    final total = e.totalUnits;
    final progress = total != null
        ? '${e.currentUnits}/$total'
        : '${e.currentUnits}';
    final rating = e.userRating != null
        ? ', tu calificación ${e.userRating!.toStringAsFixed(1)}'
        : '';
    final fav = e.favorite ? ', favorito' : '';
    return '- [${e.type.label}] ${e.title}: ${e.status.label}, '
        'progreso $progress$rating$fav';
  }
}
