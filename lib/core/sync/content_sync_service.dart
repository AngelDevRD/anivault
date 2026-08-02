import 'package:anivault/services/anilist_api.dart';
import 'package:anivault/services/isar_service.dart';
import 'package:anivault/services/prefs_service.dart';

/// Resultado de una pasada de sincronización de contenido.
class ContentSyncResult {
  const ContentSyncResult({required this.checked, required this.updated});

  /// Obras con id de AniList que se revisaron.
  final int checked;

  /// De esas, cuántas tenían cambios reales y se actualizaron.
  final int updated;
}

/// Refresca episodios/capítulos/estado de emisión/portada/géneros desde
/// AniList para las obras que ya están en la biblioteca (no descubre
/// obras nuevas — eso lo hace `related_suggestions_flow.dart`).
///
/// Usa el `updatedAt` de AniList para saltar obras sin cambios reales, y
/// agrupa las consultas en lotes de 50 para no hacer una llamada por obra.
class ContentSyncService {
  ContentSyncService(this._anilist, this._isar, this._prefs);

  final AniListApi _anilist;
  final IsarService _isar;
  final PrefsService _prefs;

  static const _autoSyncInterval = Duration(hours: 6);
  static const _batchSize = 50;

  /// Si pasó más de [_autoSyncInterval] desde la última vez, sincroniza en
  /// segundo plano. Pensado para llamarse una vez al abrir la app.
  Future<ContentSyncResult?> maybeAutoSync() async {
    final last = _prefs.lastContentSyncAt;
    if (last != null && DateTime.now().difference(last) < _autoSyncInterval) {
      return null;
    }
    return syncAll();
  }

  /// Sincroniza toda la biblioteca ahora mismo (botón "Sincronizar
  /// biblioteca" en Ajustes, o disparado por [maybeAutoSync]).
  Future<ContentSyncResult> syncAll() async {
    final entries = await _isar.getAllWithAnilistId();
    var updated = 0;

    for (var i = 0; i < entries.length; i += _batchSize) {
      final batch = entries.sublist(
        i,
        (i + _batchSize > entries.length) ? entries.length : i + _batchSize,
      );
      final ids = batch.map((e) => e.anilistId!).toList();
      final snapshots = {
        for (final s in await _anilist.fetchBulkSnapshot(ids)) s.anilistId: s,
      };

      for (final entry in batch) {
        final snapshot = snapshots[entry.anilistId];
        if (snapshot == null) continue;
        if (snapshot.updatedAt != null &&
            snapshot.updatedAt == entry.remoteUpdatedAt) {
          continue; // Sin cambios en AniList desde la última sincronización.
        }

        entry.totalEpisodes = snapshot.totalEpisodes ?? entry.totalEpisodes;
        entry.totalChapters = snapshot.totalChapters ?? entry.totalChapters;
        entry.releaseStatus = snapshot.releaseStatus ?? entry.releaseStatus;
        entry.coverImage = snapshot.coverImage ?? entry.coverImage;
        if (snapshot.genres.isNotEmpty) entry.genres = snapshot.genres;
        entry.remoteUpdatedAt = snapshot.updatedAt;
        entry.lastSyncedAt = DateTime.now();
        await _isar.upsert(entry);
        updated++;
      }
    }

    await _prefs.setLastContentSyncAt(DateTime.now());
    return ContentSyncResult(checked: entries.length, updated: updated);
  }
}
