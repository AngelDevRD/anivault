/// Estado actual de una obra en AniList, para comparar contra lo guardado
/// localmente y decidir si hace falta actualizar (`ContentSyncService`).
class RemoteMediaSnapshot {
  const RemoteMediaSnapshot({
    required this.anilistId,
    required this.updatedAt,
    this.totalEpisodes,
    this.totalChapters,
    this.releaseStatus,
    this.coverImage,
    this.genres = const [],
  });

  final int anilistId;

  /// Timestamp (epoch) que AniList actualiza cada vez que cambia algo en
  /// la obra. Permite saber si hay cambios sin comparar campo por campo.
  final int? updatedAt;

  final int? totalEpisodes;
  final int? totalChapters;
  final String? releaseStatus;
  final String? coverImage;
  final List<String> genres;
}
