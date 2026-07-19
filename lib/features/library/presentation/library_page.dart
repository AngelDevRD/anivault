import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/features/library/presentation/widgets/library_tab.dart';

/// Biblioteca con 4 pestañas: Anime, Manga, Manhwa, Manhua.
class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  static const _types = MediaType.values;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _types.length, vsync: this);
    _controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biblioteca'),
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: [for (final t in _types) Tab(text: t.label)],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [for (final t in _types) LibraryTab(type: t)],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final type = _types[_controller.index];
          context.push('/add?type=${type.name}');
        },
        icon: const Icon(Icons.add),
        label: const Text('Agregar'),
      ),
    );
  }
}
