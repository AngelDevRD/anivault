import 'package:isar_community/isar.dart';
import 'package:uuid/uuid.dart';

import 'package:anivault/features/library/domain/enums.dart';

part 'media_entry.g.dart';

const _uuidGen = Uuid();

/// Registro local de una obra (anime/manga/manhwa/manhua).
///
/// Contiene tanto los datos obtenidos de las APIs (AniList/Jikan) como el
/// progreso personal del usuario. Es la única fuente de verdad local (Isar).
@collection
class MediaEntry {
  Id id = Isar.autoIncrement;

  /// Tipo de obra. Indexado para filtrar por pestaña de biblioteca.
  @Index()
  @enumerated
  MediaType type;

  /// Estado de seguimiento. Indexado para filtros y estadísticas.
  @Index()
  @enumerated
  MediaStatus status;

  // --- Identificadores externos ---
  int? anilistId;
  int? malId;

  // --- Datos de la obra (desde API) ---
  @Index(caseSensitive: false, type: IndexType.value)
  String title;
  String? titleOriginal;
  String? titleEnglish;
  String? coverImage;
  String? bannerImage;
  String? synopsis;
  List<String> genres;
  String? studio; // estudio (anime) o autor (manga)
  String? publisher; // editorial
  int? year;

  /// Estado de emisión/publicación tal cual lo reporta la API
  /// (RELEASING, FINISHED, NOT_YET_RELEASED, CANCELLED, HIATUS).
  String? releaseStatus;
  String? format; // TV, MOVIE, OVA, MANGA, ONE_SHOT, NOVEL...
  String? countryOfOrigin; // JP, KR, CN...

  int? totalEpisodes;
  int? episodeDuration; // minutos por episodio
  int? totalChapters;
  int? totalVolumes;

  /// Puntuación media externa (0-100 en AniList; se guarda tal cual).
  int? averageScore;

  // --- Progreso del usuario ---
  int currentEpisode;
  int currentChapter;
  int currentVolume;
  DateTime? startDate;
  DateTime? lastUpdatedDate;
  String? notes;

  /// Calificación personal del usuario (0-10).
  double? userRating;
  bool favorite;

  /// Fecha en que se agregó a la biblioteca.
  DateTime addedDate = DateTime.now();

  // --- Sync opcional en la nube (ver core/sync) ---

  /// Id estable entre dispositivos (el autoincrement de Isar es solo local).
  /// Se genera una vez al crear la entrada y nunca cambia.
  @Index(unique: true)
  String uuid = _uuidGen.v4();

  /// `true` si hay cambios locales sin subir aun. El SyncEngine la baja a
  /// `false` tras un push exitoso.
  bool dirty = true;

  // --- Agrupación por franquicia (ver core/franchise) ---

  /// Id compartido por todas las entradas de una misma franquicia (misma
  /// serie base, temporadas, películas, OVAs...). `null` = obra sin
  /// franquicia detectada (se muestra como obra independiente).
  @Index()
  String? franchiseId;

  /// Tipo de relación (tal cual la reporta AniList: SEQUEL, PREQUEL,
  /// SIDE_STORY, SPIN_OFF, ALTERNATIVE, ADAPTATION...) hacia la obra de la
  /// franquicia con la que se vinculó esta entrada al agregarla. `null` en
  /// la obra que originó la franquicia (o en obras sin franquicia).
  String? relationToRoot;

  /// `true` si, la última vez que se revisó, AniList reportaba relaciones
  /// (secuelas/películas/OVAs/etc.) que todavía no están en la biblioteca.
  /// Es solo una pista para mostrar un aviso — "Buscar más contenido"
  /// siempre vuelve a verificar en el momento, así que no hace falta que
  /// esté perfectamente actualizado.
  bool hasUnaddedRelations = false;

  // --- Sincronización de contenido con AniList (ver core/sync) ---

  /// Última vez que se refrescaron los datos de esta obra desde AniList.
  DateTime? lastSyncedAt;

  /// `updatedAt` de AniList tal cual lo reportó la última vez. Permite
  /// saber si cambió sin comparar campo por campo.
  int? remoteUpdatedAt;

  MediaEntry({
    this.type = MediaType.anime,
    this.status = MediaStatus.pending,
    this.anilistId,
    this.malId,
    this.title = '',
    this.titleOriginal,
    this.titleEnglish,
    this.coverImage,
    this.bannerImage,
    this.synopsis,
    this.genres = const [],
    this.studio,
    this.publisher,
    this.year,
    this.releaseStatus,
    this.format,
    this.countryOfOrigin,
    this.totalEpisodes,
    this.episodeDuration,
    this.totalChapters,
    this.totalVolumes,
    this.averageScore,
    this.currentEpisode = 0,
    this.currentChapter = 0,
    this.currentVolume = 0,
    this.startDate,
    this.lastUpdatedDate,
    this.notes,
    this.userRating,
    this.favorite = false,
  });

  /// Unidades totales según el tipo (episodios para anime, capítulos para lectura).
  @ignore
  int? get totalUnits =>
      type == MediaType.anime ? totalEpisodes : totalChapters;

  /// Unidades consumidas por el usuario según el tipo.
  @ignore
  int get currentUnits =>
      type == MediaType.anime ? currentEpisode : currentChapter;

  /// Progreso 0..1; 0 si no se conoce el total.
  @ignore
  double get progress {
    final total = totalUnits;
    if (total == null || total <= 0) return 0;
    return (currentUnits / total).clamp(0.0, 1.0);
  }

  /// Minutos totales consumidos en este anime (0 para obras de lectura).
  ///
  /// Si la obra está "Completada" pero `currentEpisode` no llegó al total
  /// (películas/OVAs/especiales donde `totalEpisodes` no se conocía al
  /// agregarla), se cuenta como vista por completo para no perder el
  /// tiempo real invertido.
  @ignore
  int get minutesWatched {
    if (type != MediaType.anime) return 0;
    final dur = episodeDuration ?? 24; // duración estándar por defecto
    final watchedUnits = status == MediaStatus.completed
        ? (totalEpisodes ?? (currentEpisode > 0 ? currentEpisode : 1))
        : currentEpisode;
    return watchedUnits * dur;
  }
}
