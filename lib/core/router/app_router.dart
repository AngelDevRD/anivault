import 'package:go_router/go_router.dart';

import 'package:anivault/features/add_media/presentation/add_media_page.dart';
import 'package:anivault/features/home/presentation/home_shell.dart';
import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/features/media_detail/presentation/media_detail_page.dart';
import 'package:anivault/features/splash/presentation/splash_page.dart';

/// Configuración de navegación de la app.
final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (_, _) => const SplashPage()),
    GoRoute(path: '/home', builder: (_, _) => const HomeShell()),
    GoRoute(
      path: '/detail/:id',
      builder: (_, state) =>
          MediaDetailPage(id: int.parse(state.pathParameters['id']!)),
    ),
    GoRoute(
      path: '/add',
      builder: (_, state) {
        final typeName = state.uri.queryParameters['type'] ?? 'anime';
        final type = MediaType.values.firstWhere(
          (t) => t.name == typeName,
          orElse: () => MediaType.anime,
        );
        return AddMediaPage(type: type);
      },
    ),
  ],
);
