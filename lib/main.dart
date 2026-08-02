import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:anivault/core/config/supabase_config.dart';
import 'package:anivault/core/providers.dart';
import 'package:anivault/core/router/app_router.dart';
import 'package:anivault/core/sync/sync_provider.dart';
import 'package:anivault/core/theme/app_theme.dart';
import 'package:anivault/services/isar_service.dart';
import 'package:anivault/services/prefs_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es');

  // Inicialización de servicios (BD + preferencias).
  final isar = await IsarService.open();
  final prefs = await PrefsService.create();

  // Supabase solo si la build trae credenciales (--dart-define). Sin ellas
  // la app opera 100% local, sin sync en la nube.
  if (SupabaseConfig.configurado) {
    await Supabase.initialize(
      url: SupabaseConfig.url,
      publishableKey: SupabaseConfig.anonKey,
    );
  }

  runApp(
    ProviderScope(
      overrides: [
        isarServiceProvider.overrideWithValue(isar),
        prefsServiceProvider.overrideWithValue(prefs),
      ],
      child: const AniVaultApp(),
    ),
  );
}

class AniVaultApp extends HookConsumerWidget {
  const AniVaultApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    // Mantiene vivo el SyncEngine mientras este widget exista (toda la app).
    ref.watch(syncEngineProvider);

    // Sincronización de contenido (episodios/estado/portadas desde AniList):
    // una sola vez al abrir la app, en segundo plano, si ya pasó el
    // intervalo configurado (ver ContentSyncService.maybeAutoSync).
    useEffect(() {
      ref.read(contentSyncServiceProvider).maybeAutoSync();
      return null;
    }, const []);

    return MaterialApp.router(
      title: 'AniVault',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      routerConfig: appRouter,
      supportedLocales: const [Locale('es'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
