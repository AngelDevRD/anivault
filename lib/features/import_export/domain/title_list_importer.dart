import 'package:anivault/features/add_media/data/media_search_repository.dart';
import 'package:anivault/features/add_media/domain/franchise_suggestions.dart';
import 'package:anivault/features/add_media/domain/media_suggestion.dart';
import 'package:anivault/features/library/data/franchise_linker.dart';
import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/services/isar_service.dart';

/// Resultado de procesar una lista de títulos pegada por el usuario.
class TitleListImportResult {
  const TitleListImportResult({
    required this.added,
    required this.duplicated,
    required this.unmatched,
  });

  /// Obras agregadas automáticamente con datos completos (AniList/Jikan).
  final int added;

  /// Títulos que ya estaban en la biblioteca (mismo id de AniList).
  final int duplicated;

  /// Títulos sin resultado de búsqueda; requieren revisión manual.
  final List<String> unmatched;
}

/// Quita numeración/viñetas de una línea de lista ("12. ", "12) ", "- ").
String cleanImportedTitle(String raw) {
  return raw
      .trim()
      .replaceFirst(RegExp(r'^\d+[.)\-]\s*'), '')
      .replaceFirst(RegExp(r'^[-*•]\s*'), '')
      .trim();
}

/// Divide el texto pegado por el usuario en títulos individuales, uno por
/// línea, descartando líneas vacías.
List<String> splitImportedTitles(String text) {
  return text
      .split('\n')
      .map(cleanImportedTitle)
      .where((t) => t.isNotEmpty)
      .toList();
}

/// Procesa una lista de títulos: por cada uno busca en AniList/Jikan y, si
/// encuentra un resultado, descarga el detalle completo y lo guarda.
/// Los títulos sin resultado quedan en [TitleListImportResult.unmatched]
/// para revisión manual (ver `import_review_page.dart`).
Future<TitleListImportResult> importTitleList({
  required List<String> titles,
  required MediaType type,
  required MediaSearchRepository repo,
  required IsarService isar,
  void Function(int done, int total)? onProgress,
}) async {
  var added = 0;
  var duplicated = 0;
  final unmatched = <String>[];

  for (var i = 0; i < titles.length; i++) {
    final title = titles[i];
    try {
      final results = await repo.search(query: title, type: type);
      if (results.isEmpty) {
        unmatched.add(title);
      } else {
        final top = results.first;
        final existing = top.source == MediaSource.anilist
            ? await isar.findByAnilistId(int.parse(top.sourceId), type)
            : null;
        if (existing != null) {
          duplicated++;
        } else {
          final result = await repo.fetchDetail(top);
          await linkFranchise(result.entry, result.relations, isar);
          result.entry.hasUnaddedRelations = (await findMissingRelated(
            result.relations,
            isar,
          )).isNotEmpty;
          await isar.upsert(result.entry);
          added++;
        }
      }
    } catch (_) {
      unmatched.add(title);
    }
    onProgress?.call(i + 1, titles.length);
  }

  return TitleListImportResult(
    added: added,
    duplicated: duplicated,
    unmatched: unmatched,
  );
}
