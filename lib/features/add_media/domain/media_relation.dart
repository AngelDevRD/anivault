/// Relación (según AniList) entre una obra recién descargada y otra dentro
/// de la misma franquicia (secuela, precuela, película, side story...).
///
/// Solo AniList expone un grafo de relaciones estructurado; Jikan y
/// MangaDex no aportan datos aquí (ver `FranchiseLinker`).
class MediaRelation {
  const MediaRelation({
    required this.anilistId,
    required this.relationType,
    required this.title,
    required this.mediaType,
    this.coverImage,
    this.format,
  });

  /// Id en AniList de la obra relacionada.
  final int anilistId;

  /// Tipo de relación tal cual lo reporta AniList (SEQUEL, PREQUEL,
  /// SIDE_STORY, SPIN_OFF, ALTERNATIVE, ADAPTATION, OTHER...).
  final String relationType;

  final String title;
  final String? coverImage;

  /// Formato tal cual lo reporta AniList (TV, MOVIE, OVA, ONA, SPECIAL...).
  final String? format;

  /// Tipo de medio en AniList: ANIME o MANGA.
  final String mediaType;
}
