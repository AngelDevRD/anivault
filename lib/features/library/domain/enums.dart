/// Tipo de obra registrada en la biblioteca.
enum MediaType {
  anime,
  manga,
  manhwa,
  manhua;

  bool get isReadable => this != MediaType.anime;

  String get label => switch (this) {
    MediaType.anime => 'Anime',
    MediaType.manga => 'Manga',
    MediaType.manhwa => 'Manhwa',
    MediaType.manhua => 'Manhua',
  };
}

/// Estado de seguimiento de una obra por parte del usuario.
enum MediaStatus {
  pending,
  watching,
  completed,
  paused,
  dropped;

  String get label => switch (this) {
    MediaStatus.pending => 'Pendiente',
    MediaStatus.watching => 'En progreso',
    MediaStatus.completed => 'Completado',
    MediaStatus.paused => 'Pausado',
    MediaStatus.dropped => 'Abandonado',
  };
}

/// Criterios de ordenamiento de la biblioteca.
enum LibrarySort {
  recent,
  title,
  score,
  progress;

  String get label => switch (this) {
    LibrarySort.recent => 'Recientes',
    LibrarySort.title => 'Título',
    LibrarySort.score => 'Puntuación',
    LibrarySort.progress => 'Progreso',
  };
}
