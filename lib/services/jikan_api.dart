import 'package:dio/dio.dart';

import 'package:anivault/features/add_media/domain/media_suggestion.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';

/// Cliente REST de Jikan (API no oficial de MyAnimeList).
/// Se usa como respaldo cuando AniList falla o no devuelve resultados.
class JikanApi {
  JikanApi(this._dio);

  final Dio _dio;
  static const _base = 'https://api.jikan.moe/v4';

  Future<List<MediaSuggestion>> search({
    required String query,
    required MediaType type,
  }) async {
    final path = type == MediaType.anime ? '/anime' : '/manga';
    final res = await _dio.get<Map<String, dynamic>>(
      '$_base$path',
      queryParameters: {'q': query, 'limit': 15, 'sfw': true},
    );
    final data = (res.data?['data'] as List?) ?? const [];
    return data
        .cast<Map<String, dynamic>>()
        .map((m) => _toSuggestion(m, type))
        .toList();
  }

  Future<MediaEntry> fetchDetail({
    required int malId,
    required MediaType requestedType,
  }) async {
    final path = requestedType == MediaType.anime ? '/anime' : '/manga';
    final res = await _dio.get<Map<String, dynamic>>('$_base$path/$malId/full');
    final m = res.data?['data'] as Map<String, dynamic>?;
    if (m == null) {
      throw Exception('Jikan: obra $malId no encontrada');
    }
    return _toEntry(m, requestedType);
  }

  MediaSuggestion _toSuggestion(Map<String, dynamic> m, MediaType type) {
    return MediaSuggestion(
      source: MediaSource.jikan,
      sourceId: (m['mal_id'] as int).toString(),
      type: type,
      title: m['title'] as String? ?? 'Sin título',
      coverImage: m['images']?['jpg']?['image_url'] as String?,
      year: m['year'] as int? ?? _yearFromAired(m),
      format: m['type'] as String?,
      releaseStatus: m['status'] as String?,
      episodes: m['episodes'] as int?,
      chapters: m['chapters'] as int?,
    );
  }

  MediaEntry _toEntry(Map<String, dynamic> m, MediaType type) {
    String? author;
    final authors = m['authors'] as List?;
    if (authors != null && authors.isNotEmpty) {
      author = authors.first['name'] as String?;
    }
    String? studio;
    final studios = m['studios'] as List?;
    if (studios != null && studios.isNotEmpty) {
      studio = studios.first['name'] as String?;
    }
    final score = m['score'] as num?;

    return MediaEntry(
      type: type,
      status: MediaStatus.pending,
      malId: m['mal_id'] as int?,
      title: m['title'] as String? ?? 'Sin título',
      titleOriginal: m['title_japanese'] as String?,
      titleEnglish: m['title_english'] as String?,
      coverImage:
          m['images']?['jpg']?['large_image_url'] as String? ??
          m['images']?['jpg']?['image_url'] as String?,
      synopsis: m['synopsis'] as String?,
      genres: ((m['genres'] as List?) ?? const [])
          .map((g) => g['name'] as String)
          .toList(),
      studio: type == MediaType.anime ? studio : author,
      publisher: _firstName(m['serializations'] as List?),
      year: m['year'] as int? ?? _yearFromAired(m),
      releaseStatus: m['status'] as String?,
      format: m['type'] as String?,
      totalEpisodes: m['episodes'] as int?,
      episodeDuration: _durationMinutes(m['duration'] as String?),
      totalChapters: m['chapters'] as int?,
      totalVolumes: m['volumes'] as int?,
      averageScore: score == null ? null : (score * 10).round(),
    );
  }

  static String? _firstName(List? list) {
    if (list == null || list.isEmpty) return null;
    return list.first['name'] as String?;
  }

  static int? _yearFromAired(Map<String, dynamic> m) {
    final from = m['aired']?['from'] as String?;
    if (from == null) return null;
    return DateTime.tryParse(from)?.year;
  }

  /// Extrae minutos de cadenas tipo "24 min per ep".
  static int? _durationMinutes(String? duration) {
    if (duration == null) return null;
    final match = RegExp(r'(\d+)\s*min').firstMatch(duration);
    if (match == null) return null;
    return int.tryParse(match.group(1)!);
  }
}
