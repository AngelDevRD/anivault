import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';

/// Acceso a la base de datos local Isar. Fuente única de verdad offline.
class IsarService {
  IsarService(this.isar);

  final Isar isar;

  /// Abre (o crea) la base de datos con todos los esquemas registrados.
  static Future<IsarService> open() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [MediaEntrySchema],
      directory: dir.path,
      name: 'anivault',
    );
    return IsarService(isar);
  }

  // --- Escritura ---

  Future<int> upsert(MediaEntry entry) {
    entry.lastUpdatedDate = DateTime.now();
    return isar.writeTxn(() => isar.mediaEntrys.put(entry));
  }

  Future<bool> delete(int id) {
    return isar.writeTxn(() => isar.mediaEntrys.delete(id));
  }

  // --- Lectura ---

  Future<MediaEntry?> getById(int id) => isar.mediaEntrys.get(id);

  /// ¿Existe ya una obra con este id de AniList y tipo? Evita duplicados.
  Future<MediaEntry?> findByAnilistId(int anilistId, MediaType type) {
    return isar.mediaEntrys
        .filter()
        .anilistIdEqualTo(anilistId)
        .typeEqualTo(type)
        .findFirst();
  }

  /// Todas las obras (para el motor de estadísticas y exportación).
  Future<List<MediaEntry>> getAll() => isar.mediaEntrys.where().findAll();

  /// Stream reactivo de todas las obras; se emite en cada cambio.
  Stream<List<MediaEntry>> watchAll() {
    return isar.mediaEntrys.where().watch(fireImmediately: true);
  }

  /// Consulta paginada y filtrada de una pestaña de biblioteca.
  ///
  /// Preparada para grandes volúmenes: aplica filtro por tipo/estado en el
  /// índice, búsqueda por título, ordenamiento y `offset/limit`.
  Future<List<MediaEntry>> queryLibrary({
    required MediaType type,
    MediaStatus? status,
    String? search,
    LibrarySort sort = LibrarySort.recent,
    int offset = 0,
    int limit = 30,
  }) async {
    var q = isar.mediaEntrys.filter().typeEqualTo(type);
    if (status != null) {
      q = q.statusEqualTo(status);
    }
    if (search != null && search.trim().isNotEmpty) {
      q = q.titleContains(search.trim(), caseSensitive: false);
    }

    final sortedBuilder = switch (sort) {
      LibrarySort.title => q.sortByTitle(),
      LibrarySort.score => q.sortByAverageScoreDesc(),
      LibrarySort.progress => q.sortByLastUpdatedDateDesc(),
      LibrarySort.recent => q.sortByAddedDateDesc(),
    };

    return sortedBuilder.offset(offset).limit(limit).findAll();
  }

  /// Conteo por tipo (para badges de pestañas).
  Future<int> countByType(MediaType type) {
    return isar.mediaEntrys.filter().typeEqualTo(type).count();
  }
}
