import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:anivault/core/providers.dart';
import 'package:anivault/core/router/app_router.dart';
import 'package:anivault/core/theme/app_theme.dart';
import 'package:anivault/services/isar_service.dart';
import 'package:anivault/services/prefs_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es');

  // Inicialización de servicios (BD + preferencias).
  final isar = await IsarService.open();
  final prefs = await PrefsService.create();

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

class AniVaultApp extends ConsumerWidget {
  const AniVaultApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
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
