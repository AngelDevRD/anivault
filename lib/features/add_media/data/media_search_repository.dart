import 'package:anivault/features/add_media/domain/media_relation.dart';
import 'package:anivault/features/add_media/domain/media_suggestion.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/services/anilist_api.dart';
import 'package:anivault/services/jikan_api.dart';
import 'package:anivault/services/mangadex_api.dart';

/// Orquesta la búsqueda y descarga de detalle usando AniList como fuente
/// primaria, Jikan como respaldo y MangaDex como tercer respaldo para
/// manga/manhwa/manhua (cubre titulos, incluido contenido +18, que las
/// otras dos no catalogan bien).
class MediaSearchRepository {
  MediaSearchRepository(this._anilist, this._jikan, this._mangadex);

  final AniListApi _anilist;
  final JikanApi _jikan;
  final MangaDexApi _mangadex;

  /// Busca por nombre: AniList -> Jikan -> (si no es anime) MangaDex.
  Future<List<MediaSuggestion>> search({
    required String query,
    required MediaType type,
  }) async {
    if (query.trim().length < 2) return const [];
    try {
      final results = await _anilist.search(query: query, type: type);
      if (results.isNotEmpty) return results;
    } catch (_) {
      // Silencioso: se intenta el siguiente respaldo.
    }
    try {
      final results = await _jikan.search(query: query, type: type);
      if (results.isNotEmpty) return results;
    } catch (_) {
      // Silencioso: se intenta el siguiente respaldo.
    }
    if (type == MediaType.anime) return const [];
    try {
      return await _mangadex.search(query: query, type: type);
    } catch (_) {
      return const [];
    }
  }

  /// Descarga el detalle completo de la sugerencia seleccionada, junto con
  /// sus relaciones directas si la fuente es AniList (única con un grafo
  /// de relaciones estructurado; Jikan/MangaDex devuelven relations: []).
  Future<({MediaEntry entry, List<MediaRelation> relations})> fetchDetail(
    MediaSuggestion s,
  ) async {
    switch (s.source) {
      case MediaSource.anilist:
        return _anilist.fetchDetail(
          id: int.parse(s.sourceId),
          requestedType: s.type,
        );
      case MediaSource.jikan:
        final entry = await _jikan.fetchDetail(
          malId: int.parse(s.sourceId),
          requestedType: s.type,
        );
        return (entry: entry, relations: const <MediaRelation>[]);
      case MediaSource.mangadex:
        final entry = await _mangadex.fetchDetail(
          id: s.sourceId,
          requestedType: s.type,
        );
        return (entry: entry, relations: const <MediaRelation>[]);
    }
  }
}
