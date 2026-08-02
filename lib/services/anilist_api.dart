import 'package:dio/dio.dart';

import 'package:anivault/features/add_media/domain/media_relation.dart';
import 'package:anivault/features/add_media/domain/media_suggestion.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';

/// Cliente de la API GraphQL de AniList.
///
/// Búsqueda por nombre y descarga de detalle completo. Es la fuente primaria;
/// [JikanApi] actúa como respaldo si esto falla o no devuelve resultados.
class AniListApi {
  AniListApi(this._dio);

  final Dio _dio;
  static const _endpoint = 'https://graphql.anilist.co';

  static const _searchQuery = r'''
    query ($search: String, $type: MediaType) {
      Page(page: 1, perPage: 15) {
        media(search: $search, type: $type, sort: SEARCH_MATCH) {
          id
          title { romaji english native }
          coverImage { large }
          format
          status
          episodes
          chapters
          countryOfOrigin
          startDate { year }
        }
      }
    }
  ''';

  static const _detailQuery = r'''
    query ($id: Int) {
      Media(id: $id) {
        id
        idMal
        title { romaji english native }
        coverImage { large }
        bannerImage
        description(asHtml: false)
        genres
        format
        status
        countryOfOrigin
        episodes
        duration
        chapters
        volumes
        averageScore
        startDate { year }
        studios(isMain: true) { nodes { name } }
        staff(perPage: 1) { edges { role node { name { full } } } }
        relations {
          edges {
            relationType(version: 2)
            node { id }
          }
        }
      }
    }
  ''';

  /// Busca obras por nombre. Devuelve sugerencias con el tipo ya inferido.
  Future<List<MediaSuggestion>> search({
    required String query,
    required MediaType type,
  }) async {
    final res = await _post(_searchQuery, {
      'search': query,
      'type': _anilistType(type),
    });
    final media = (res['data']?['Page']?['media'] as List?) ?? const [];
    return media
        .cast<Map<String, dynamic>>()
        .map((m) => _toSuggestion(m, type))
        .toList();
  }

  /// Descarga el detalle completo y lo mapea a un [MediaEntry] nuevo
  /// (estado inicial: pendiente), junto con sus relaciones directas
  /// (secuela, precuela, película, side story...) para que
  /// `linkFranchise` decida si pertenece a una franquicia ya agregada.
  Future<({MediaEntry entry, List<MediaRelation> relations})> fetchDetail({
    required int id,
    required MediaType requestedType,
  }) async {
    final res = await _post(_detailQuery, {'id': id});
    final m = res['data']?['Media'] as Map<String, dynamic>?;
    if (m == null) {
      throw Exception('AniList: obra $id no encontrada');
    }
    return (entry: _toEntry(m, requestedType), relations: _parseRelations(m));
  }

  static List<MediaRelation> _parseRelations(Map<String, dynamic> m) {
    final edges = (m['relations']?['edges'] as List?) ?? const [];
    return edges
        .cast<Map<String, dynamic>>()
        .map((e) {
          final nodeId = e['node']?['id'] as int?;
          final relationType = e['relationType'] as String?;
          if (nodeId == null || relationType == null) return null;
          return MediaRelation(anilistId: nodeId, relationType: relationType);
        })
        .whereType<MediaRelation>()
        .toList();
  }

  // --- Internos ---

  Future<Map<String, dynamic>> _post(
    String query,
    Map<String, dynamic> variables,
  ) async {
    final res = await _dio.post<Map<String, dynamic>>(
      _endpoint,
      data: {'query': query, 'variables': variables},
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
    return res.data ?? const {};
  }

  static String _anilistType(MediaType type) =>
      type == MediaType.anime ? 'ANIME' : 'MANGA';

  /// Infiere el tipo de lectura por país de origen (JP=manga, KR=manhwa, CN=manhua).
  static MediaType _inferType(MediaType requested, String? country) {
    if (requested == MediaType.anime) return MediaType.anime;
    return switch (country) {
      'KR' => MediaType.manhwa,
      'CN' => MediaType.manhua,
      _ => MediaType.manga,
    };
  }

  static String? _pickTitle(Map<String, dynamic>? title) {
    if (title == null) return null;
    return (title['romaji'] ?? title['english'] ?? title['native']) as String?;
  }

  MediaSuggestion _toSuggestion(Map<String, dynamic> m, MediaType requested) {
    return MediaSuggestion(
      source: MediaSource.anilist,
      sourceId: (m['id'] as int).toString(),
      type: _inferType(requested, m['countryOfOrigin'] as String?),
      title: _pickTitle(m['title'] as Map<String, dynamic>?) ?? 'Sin título',
      coverImage: m['coverImage']?['large'] as String?,
      year: m['startDate']?['year'] as int?,
      format: m['format'] as String?,
      releaseStatus: m['status'] as String?,
      episodes: m['episodes'] as int?,
      chapters: m['chapters'] as int?,
    );
  }

  MediaEntry _toEntry(Map<String, dynamic> m, MediaType requested) {
    final country = m['countryOfOrigin'] as String?;
    final type = _inferType(requested, country);

    String? studioOrAuthor;
    if (type == MediaType.anime) {
      final nodes = m['studios']?['nodes'] as List?;
      if (nodes != null && nodes.isNotEmpty) {
        studioOrAuthor = nodes.first['name'] as String?;
      }
    } else {
      final edges = m['staff']?['edges'] as List?;
      if (edges != null && edges.isNotEmpty) {
        studioOrAuthor = edges.first['node']?['name']?['full'] as String?;
      }
    }

    return MediaEntry(
      type: type,
      status: MediaStatus.pending,
      anilistId: m['id'] as int,
      malId: m['idMal'] as int?,
      title: _pickTitle(m['title'] as Map<String, dynamic>?) ?? 'Sin título',
      titleOriginal: m['title']?['native'] as String?,
      titleEnglish: m['title']?['english'] as String?,
      coverImage: m['coverImage']?['large'] as String?,
      bannerImage: m['bannerImage'] as String?,
      synopsis: _cleanHtml(m['description'] as String?),
      genres: ((m['genres'] as List?) ?? const []).cast<String>(),
      studio: studioOrAuthor,
      year: m['startDate']?['year'] as int?,
      releaseStatus: m['status'] as String?,
      format: m['format'] as String?,
      countryOfOrigin: country,
      totalEpisodes: m['episodes'] as int?,
      episodeDuration: m['duration'] as int?,
      totalChapters: m['chapters'] as int?,
      totalVolumes: m['volumes'] as int?,
      averageScore: m['averageScore'] as int?,
    );
  }

  static String? _cleanHtml(String? html) {
    if (html == null) return null;
    return html
        .replaceAll(RegExp(r'<br\s*/?>'), '\n')
        .replaceAll(RegExp(r'<[^>]+>'), '')
        .trim();
  }
}
