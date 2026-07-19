import 'package:flutter/material.dart';

import 'package:anivault/shared/widgets/empty_state.dart';

/// Pantalla placeholder para funciones planificadas en fases posteriores.
class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({
    super.key,
    required this.title,
    required this.icon,
    required this.message,
  });

  final String title;
  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: EmptyState(icon: icon, title: 'Próximamente', message: message),
    );
  }
}
