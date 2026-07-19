import 'package:anivault/features/add_media/domain/media_suggestion.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/services/anilist_api.dart';
import 'package:anivault/services/jikan_api.dart';

/// Orquesta la búsqueda y descarga de detalle usando AniList como fuente
/// primaria y Jikan como respaldo.
class MediaSearchRepository {
  MediaSearchRepository(this._anilist, this._jikan);

  final AniListApi _anilist;
  final JikanApi _jikan;

  /// Busca por nombre. Intenta AniList; si falla o no devuelve nada, usa Jikan.
  Future<List<MediaSuggestion>> search({
    required String query,
    required MediaType type,
  }) async {
    if (query.trim().length < 2) return const [];
    try {
      final results = await _anilist.search(query: query, type: type);
      if (results.isNotEmpty) return results;
    } catch (_) {
      // Silencioso: se intenta el respaldo.
    }
    try {
      return await _jikan.search(query: query, type: type);
    } catch (_) {
      return const [];
    }
  }

  /// Descarga el detalle completo de la sugerencia seleccionada.
  Future<MediaEntry> fetchDetail(MediaSuggestion s) {
    return switch (s.source) {
      MediaSource.anilist => _anilist.fetchDetail(
        id: s.sourceId,
        requestedType: s.type,
      ),
      MediaSource.jikan => _jikan.fetchDetail(
        malId: s.sourceId,
        requestedType: s.type,
      ),
    };
  }
}
