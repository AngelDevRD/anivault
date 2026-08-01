import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';

/// Serialización a/desde JSON de [MediaEntry] para backups de biblioteca.
///
/// No se usa `json_serializable` aquí para evitar tocar el modelo Isar
/// (requeriría regenerar `media_entry.g.dart`).
extension MediaEntryJson on MediaEntry {
  Map<String, dynamic> toBackupJson() => {
    'uuid': uuid,
    'type': type.name,
    'status': status.name,
    'anilistId': anilistId,
    'malId': malId,
    'title': title,
    'titleOriginal': titleOriginal,
    'titleEnglish': titleEnglish,
    'coverImage': coverImage,
    'bannerImage': bannerImage,
    'synopsis': synopsis,
    'genres': genres,
    'studio': studio,
    'publisher': publisher,
    'year': year,
    'releaseStatus': releaseStatus,
    'format': format,
    'countryOfOrigin': countryOfOrigin,
    'totalEpisodes': totalEpisodes,
    'episodeDuration': episodeDuration,
    'totalChapters': totalChapters,
    'totalVolumes': totalVolumes,
    'averageScore': averageScore,
    'currentEpisode': currentEpisode,
    'currentChapter': currentChapter,
    'currentVolume': currentVolume,
    'startDate': startDate?.toIso8601String(),
    'lastUpdatedDate': lastUpdatedDate?.toIso8601String(),
    'notes': notes,
    'userRating': userRating,
    'favorite': favorite,
    'addedDate': addedDate.toIso8601String(),
  };
}

/// Reconstruye un [MediaEntry] desde el JSON producido por [MediaEntryJson].
MediaEntry mediaEntryFromBackupJson(Map<String, dynamic> json) {
  final entry = MediaEntry(
    type: MediaType.values.byName(json['type'] as String? ?? 'anime'),
    status: MediaStatus.values.byName(json['status'] as String? ?? 'pending'),
    anilistId: json['anilistId'] as int?,
    malId: json['malId'] as int?,
    title: json['title'] as String? ?? '',
    titleOriginal: json['titleOriginal'] as String?,
    titleEnglish: json['titleEnglish'] as String?,
    coverImage: json['coverImage'] as String?,
    bannerImage: json['bannerImage'] as String?,
    synopsis: json['synopsis'] as String?,
    genres: (json['genres'] as List?)?.cast<String>() ?? const [],
    studio: json['studio'] as String?,
    publisher: json['publisher'] as String?,
    year: json['year'] as int?,
    releaseStatus: json['releaseStatus'] as String?,
    format: json['format'] as String?,
    countryOfOrigin: json['countryOfOrigin'] as String?,
    totalEpisodes: json['totalEpisodes'] as int?,
    episodeDuration: json['episodeDuration'] as int?,
    totalChapters: json['totalChapters'] as int?,
    totalVolumes: json['totalVolumes'] as int?,
    averageScore: json['averageScore'] as int?,
    currentEpisode: json['currentEpisode'] as int? ?? 0,
    currentChapter: json['currentChapter'] as int? ?? 0,
    currentVolume: json['currentVolume'] as int? ?? 0,
    startDate: _parseDate(json['startDate']),
    lastUpdatedDate: _parseDate(json['lastUpdatedDate']),
    notes: json['notes'] as String?,
    userRating: (json['userRating'] as num?)?.toDouble(),
    favorite: json['favorite'] as bool? ?? false,
  );
  if (json['uuid'] is String) entry.uuid = json['uuid'] as String;
  final addedDate = _parseDate(json['addedDate']);
  if (addedDate != null) entry.addedDate = addedDate;
  return entry;
}

DateTime? _parseDate(Object? value) =>
    value is String ? DateTime.tryParse(value) : null;
