import 'package:flutter/material.dart';

import 'package:anivault/features/home/presentation/home_page.dart';
import 'package:anivault/features/library/presentation/library_page.dart';
import 'package:anivault/features/settings/presentation/settings_page.dart';
import 'package:anivault/features/statistics/presentation/statistics_page.dart';
import 'package:anivault/shared/widgets/coming_soon_page.dart';

/// Contenedor principal con barra de navegación inferior de 5 pestañas.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  static const _pages = [
    HomePage(),
    LibraryPage(),
    StatisticsPage(),
    ComingSoonPage(
      title: 'Chat IA',
      icon: Icons.smart_toy_outlined,
      message:
          'El asistente responderá preguntas sobre tu biblioteca. '
          'Configura tu proveedor y API key en Ajustes.',
    ),
    _ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.collections_bookmark_outlined),
            selectedIcon: Icon(Icons.collections_bookmark),
            label: 'Biblioteca',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Estadísticas',
          ),
          NavigationDestination(
            icon: Icon(Icons.smart_toy_outlined),
            selectedIcon: Icon(Icons.smart_toy),
            label: 'Chat IA',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

/// Perfil incluye acceso a Ajustes; el resto (nivel, logros) llega en Fase 3.
class _ProfileTab extends StatelessWidget {
  const _ProfileTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const SettingsPage()),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 24),
          const CircleAvatar(radius: 44, child: Icon(Icons.person, size: 44)),
          const SizedBox(height: 12),
          Center(
            child: Text('Otaku', style: Theme.of(context).textTheme.titleLarge),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Chip(label: Text('Nivel, XP, insignias y logros — Fase 3')),
          ),
          const Divider(height: 32),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Ajustes'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const SettingsPage()),
            ),
          ),
        ],
      ),
    );
  }
}
