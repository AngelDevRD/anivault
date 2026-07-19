import 'package:anivault/features/library/domain/enums.dart';

/// Fuente de datos de la que proviene una sugerencia.
enum MediaSource { anilist, jikan }

/// Resultado de búsqueda mostrado como sugerencia al agregar una obra.
/// Contiene lo mínimo para la lista; el detalle completo se baja al seleccionar.
class MediaSuggestion {
  const MediaSuggestion({
    required this.source,
    required this.sourceId,
    required this.type,
    required this.title,
    this.coverImage,
    this.year,
    this.format,
    this.releaseStatus,
    this.episodes,
    this.chapters,
  });

  /// De dónde vino la sugerencia (define cómo bajar el detalle).
  final MediaSource source;

  /// Id en la fuente correspondiente (AniList id o MAL id).
  final int sourceId;

  final MediaType type;
  final String title;
  final String? coverImage;
  final int? year;
  final String? format;
  final String? releaseStatus;
  final int? episodes;
  final int? chapters;

  /// Texto corto con año · formato · nº de unidades para la sugerencia.
  String get subtitle {
    final parts = <String>[];
    if (year != null) parts.add('$year');
    if (format != null) parts.add(format!);
    if (type == MediaType.anime && episodes != null) {
      parts.add('$episodes ep');
    } else if (type != MediaType.anime && chapters != null) {
      parts.add('$chapters cap');
    }
    return parts.join(' · ');
  }
}
