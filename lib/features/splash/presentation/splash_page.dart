import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import 'package:anivault/core/theme/app_theme.dart';

/// Splash con logo animado. La inicialización pesada (BD, prefs) ya ocurrió
/// en `main()`; aquí solo se muestra la marca brevemente.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1600), () {
      if (mounted) context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.navy,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/icon/anivault.png', width: 140, height: 140)
                .animate()
                .fadeIn(duration: 600.ms)
                .scale(begin: const Offset(0.8, 0.8), curve: Curves.easeOut),
            const SizedBox(height: 20),
            Text(
              'AniVault',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
            ).animate().fadeIn(delay: 300.ms, duration: 600.ms),
            const SizedBox(height: 8),
            Text(
              'Tus estadísticas otaku',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
            ).animate().fadeIn(delay: 600.ms),
          ],
        ),
      ),
    );
  }
}
