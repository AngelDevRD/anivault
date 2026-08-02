import 'package:dio/dio.dart';

import 'package:anivault/features/add_media/domain/media_suggestion.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';

/// Cliente REST de MangaDex. Tercer respaldo (tras AniList y Jikan) para
/// manga/manhwa/manhua: cubre titulos que las otras dos no catalogan bien,
/// incluyendo contenido +18 (webtoons de romance/erotica).
class MangaDexApi {
  MangaDexApi(this._dio);

  final Dio _dio;
  static const _base = 'https://api.mangadex.org';
  static const _coverBase = 'https://uploads.mangadex.org/covers';

  // Sin esto, la API publica solo devuelve contenido "safe"/"suggestive".
  static const _contentRatings = ['safe', 'suggestive', 'erotica', 'pornographic'];

  Future<List<MediaSuggestion>> search({
    required String query,
    required MediaType type,
  }) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '$_base/manga',
      queryParameters: {
        'title': query,
        'limit': 15,
        'includes[]': const ['cover_art'],
        'contentRating[]': _contentRatings,
        'order[relevance]': 'desc',
      },
    );
    final data = (res.data?['data'] as List?) ?? const [];
    return data
        .cast<Map<String, dynamic>>()
        .map((m) => _toSuggestion(m, type))
        .toList();
  }

  Future<MediaEntry> fetchDetail({
    required String id,
    required MediaType requestedType,
  }) async {
    final res = await _dio.get<Map<String, dynamic>>(
      '$_base/manga/$id',
      queryParameters: {
        'includes[]': const ['cover_art', 'author'],
      },
    );
    final m = res.data?['data'] as Map<String, dynamic>?;
    if (m == null) {
      throw Exception('MangaDex: obra $id no encontrada');
    }
    return _toEntry(m, requestedType);
  }

  // --- Internos ---

  MediaSuggestion _toSuggestion(Map<String, dynamic> m, MediaType requested) {
    final attrs = m['attributes'] as Map<String, dynamic>;
    final id = m['id'] as String;
    return MediaSuggestion(
      source: MediaSource.mangadex,
      sourceId: id,
      type: _inferType(attrs['originalLanguage'] as String?),
      title: _pickTitle(attrs),
      coverImage: _coverUrl(id, m['relationships'] as List?),
      year: attrs['year'] as int?,
      format: attrs['publicationDemographic'] as String?,
      releaseStatus: attrs['status'] as String?,
      chapters: _parseChapterOrVolume(attrs['lastChapter']),
    );
  }

  MediaEntry _toEntry(Map<String, dynamic> m, MediaType requested) {
    final attrs = m['attributes'] as Map<String, dynamic>;
    final id = m['id'] as String;
    final relationships = (m['relationships'] as List?) ?? const [];
    final lang = attrs['originalLanguage'] as String?;
    final type = _inferType(lang);

    String? author;
    for (final r in relationships.cast<Map<String, dynamic>>()) {
      if (r['type'] == 'author') {
        author = r['attributes']?['name'] as String?;
        break;
      }
    }

    final tags = (attrs['tags'] as List?) ?? const [];
    final genres = tags
        .cast<Map<String, dynamic>>()
        .where((t) => t['attributes']?['group'] == 'genre')
        .map((t) => t['attributes']?['name']?['en'] as String?)
        .whereType<String>()
        .toList();

    return MediaEntry(
      type: type,
      status: MediaStatus.pending,
      title: _pickTitle(attrs),
      titleOriginal: _altTitle(attrs, lang),
      titleEnglish: _altTitle(attrs, 'en'),
      coverImage: _coverUrl(id, relationships),
      synopsis: (attrs['description'] as Map?)?['en'] as String?,
      genres: genres,
      studio: author,
      year: attrs['year'] as int?,
      releaseStatus: attrs['status'] as String?,
      countryOfOrigin: _countryFromLanguage(lang),
      totalChapters: _parseChapterOrVolume(attrs['lastChapter']),
      totalVolumes: _parseChapterOrVolume(attrs['lastVolume']),
    );
  }

  static String _pickTitle(Map<String, dynamic> attrs) {
    final title = attrs['title'] as Map<String, dynamic>?;
    if (title == null || title.isEmpty) return 'Sin título';
    return (title['en'] ?? title.values.first) as String;
  }

  /// Busca un titulo alternativo en el idioma pedido dentro de `altTitles`
  /// (lista de mapas de un solo idioma cada uno, ej. `[{"ja": "..."}]`).
  static String? _altTitle(Map<String, dynamic> attrs, String? lang) {
    if (lang == null) return null;
    final alt = attrs['altTitles'] as List?;
    if (alt == null) return null;
    for (final entry in alt.cast<Map<String, dynamic>>()) {
      if (entry.containsKey(lang)) return entry[lang] as String?;
    }
    return null;
  }

  static String? _coverUrl(String mangaId, List? relationships) {
    if (relationships == null) return null;
    for (final r in relationships.cast<Map<String, dynamic>>()) {
      if (r['type'] == 'cover_art') {
        final fileName = r['attributes']?['fileName'] as String?;
        if (fileName != null) return '$_coverBase/$mangaId/$fileName.256.jpg';
      }
    }
    return null;
  }

  static int? _parseChapterOrVolume(Object? value) {
    if (value == null) return null;
    return int.tryParse(value.toString().split('.').first);
  }

  static MediaType _inferType(String? lang) => switch (lang) {
    'ko' => MediaType.manhwa,
    'zh' || 'zh-hk' => MediaType.manhua,
    _ => MediaType.manga,
  };

  static String? _countryFromLanguage(String? lang) => switch (lang) {
    'ko' => 'KR',
    'zh' || 'zh-hk' => 'CN',
    'ja' => 'JP',
    _ => null,
  };
}
