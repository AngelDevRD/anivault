import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anivault/core/sync/content_sync_service.dart';
import 'package:anivault/features/add_media/data/media_search_repository.dart';
import 'package:anivault/features/import_export/data/library_backup_service.dart';
import 'package:anivault/services/anilist_api.dart';
import 'package:anivault/services/isar_service.dart';
import 'package:anivault/services/jikan_api.dart';
import 'package:anivault/services/mangadex_api.dart';
import 'package:anivault/services/prefs_service.dart';

/// Servicios inicializados de forma asíncrona en `main()` y sobreescritos
/// mediante `overrides` en el `ProviderScope`.
final isarServiceProvider = Provider<IsarService>(
  (ref) => throw UnimplementedError('isarServiceProvider debe sobreescribirse'),
);

final prefsServiceProvider = Provider<PrefsService>(
  (ref) =>
      throw UnimplementedError('prefsServiceProvider debe sobreescribirse'),
);

final dioProvider = Provider<Dio>((ref) {
  return Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 12),
      receiveTimeout: const Duration(seconds: 12),
    ),
  );
});

final aniListApiProvider = Provider<AniListApi>(
  (ref) => AniListApi(ref.watch(dioProvider)),
);

final jikanApiProvider = Provider<JikanApi>(
  (ref) => JikanApi(ref.watch(dioProvider)),
);

final mangaDexApiProvider = Provider<MangaDexApi>(
  (ref) => MangaDexApi(ref.watch(dioProvider)),
);

final mediaSearchRepositoryProvider = Provider<MediaSearchRepository>((ref) {
  return MediaSearchRepository(
    ref.watch(aniListApiProvider),
    ref.watch(jikanApiProvider),
    ref.watch(mangaDexApiProvider),
  );
});

final libraryBackupServiceProvider = Provider<LibraryBackupService>((ref) {
  return LibraryBackupService(ref.watch(isarServiceProvider));
});

final contentSyncServiceProvider = Provider<ContentSyncService>((ref) {
  return ContentSyncService(
    ref.watch(aniListApiProvider),
    ref.watch(isarServiceProvider),
    ref.watch(prefsServiceProvider),
  );
});

/// Modo de tema, persistido en preferencias.
class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ref.watch(prefsServiceProvider).themeMode;

  Future<void> set(ThemeMode mode) async {
    await ref.read(prefsServiceProvider).setThemeMode(mode);
    state = mode;
  }

  Future<void> toggleDark(bool isDark) =>
      set(isDark ? ThemeMode.dark : ThemeMode.light);
}

final themeModeProvider = NotifierProvider<ThemeModeNotifier, ThemeMode>(
  ThemeModeNotifier.new,
);
