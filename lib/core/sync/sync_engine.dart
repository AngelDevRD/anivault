import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:isar_community/isar.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/data/models/sync_deletion.dart';

/// Motor de sync de la biblioteca (favoritos, progreso, notas) contra
/// Supabase (tabla `anivault_media_entries`). Los datos siempre viven
/// primero en Isar local -- esto solo decide cada cuánto se replican. Se
/// dispara al recuperar conectividad y con un timer periódico configurable
/// (ver SyncSettingsProvider).
class SyncEngine {
  final Isar isar;
  final sb.SupabaseClient client;
  Duration backupInterval;

  SyncEngine({
    required this.isar,
    required this.client,
    this.backupInterval = const Duration(hours: 3),
  });

  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;
  Timer? _backupTimer;
  bool _syncing = false;

  void start() {
    _connectivitySub = Connectivity().onConnectivityChanged.listen((results) {
      if (!results.contains(ConnectivityResult.none)) {
        syncNow();
      }
    });
    _backupTimer = Timer.periodic(backupInterval, (_) => syncNow());
    syncNow();
  }

  void updateInterval(Duration newInterval) {
    if (newInterval == backupInterval) return;
    backupInterval = newInterval;
    _backupTimer?.cancel();
    _backupTimer = Timer.periodic(backupInterval, (_) => syncNow());
  }

  void dispose() {
    _connectivitySub?.cancel();
    _backupTimer?.cancel();
  }

  Future<void> syncNow() async {
    if (_syncing) return;
    final userId = client.auth.currentUser?.id;
    if (userId == null) return;

    _syncing = true;
    try {
      await _pushDeletions(userId);
      await _pushDirtyEntries(userId);
    } finally {
      _syncing = false;
    }
  }

  Future<void> _pushDeletions(String userId) async {
    final pending = await isar.syncDeletions.where().findAll();
    for (final tombstone in pending) {
      try {
        await client
            .from('anivault_media_entries')
            .delete()
            .eq('uuid', tombstone.uuid)
            .eq('user_id', userId);
        await isar.writeTxn(() => isar.syncDeletions.delete(tombstone.id));
      } catch (e, st) {
        developer.log(
          'Sync (delete) fallo para ${tombstone.uuid}',
          error: e,
          stackTrace: st,
          name: 'SyncEngine',
        );
      }
    }
  }

  Future<void> _pushDirtyEntries(String userId) async {
    final dirty = await isar.mediaEntrys
        .filter()
        .dirtyEqualTo(true)
        .findAll();

    for (final entry in dirty) {
      try {
        await client.from('anivault_media_entries').upsert({
          'uuid': entry.uuid,
          'user_id': userId,
          'type': entry.type.name,
          'status': entry.status.name,
          'anilist_id': entry.anilistId,
          'mal_id': entry.malId,
          'title': entry.title,
          'title_original': entry.titleOriginal,
          'title_english': entry.titleEnglish,
          'cover_image': entry.coverImage,
          'banner_image': entry.bannerImage,
          'synopsis': entry.synopsis,
          'genres': entry.genres,
          'studio': entry.studio,
          'publisher': entry.publisher,
          'year': entry.year,
          'release_status': entry.releaseStatus,
          'format': entry.format,
          'country_of_origin': entry.countryOfOrigin,
          'total_episodes': entry.totalEpisodes,
          'episode_duration': entry.episodeDuration,
          'total_chapters': entry.totalChapters,
          'total_volumes': entry.totalVolumes,
          'average_score': entry.averageScore,
          'current_episode': entry.currentEpisode,
          'current_chapter': entry.currentChapter,
          'current_volume': entry.currentVolume,
          'start_date': entry.startDate?.toIso8601String(),
          'last_updated_date': entry.lastUpdatedDate?.toIso8601String(),
          'notes': entry.notes,
          'user_rating': entry.userRating,
          'favorite': entry.favorite,
          'added_date': entry.addedDate.toIso8601String(),
        }, onConflict: 'uuid');

        await isar.writeTxn(() async {
          entry.dirty = false;
          await isar.mediaEntrys.put(entry);
        });
      } catch (e, st) {
        developer.log(
          'Sync fallo para ${entry.uuid} (${entry.title})',
          error: e,
          stackTrace: st,
          name: 'SyncEngine',
        );
      }
    }
  }
}
