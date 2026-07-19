import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/features/library/presentation/library_providers.dart';
import 'package:anivault/features/library/presentation/widgets/media_card.dart';
import 'package:anivault/shared/widgets/empty_state.dart';

/// Contenido de una pestaña de biblioteca: buscador, filtros y lista.
class LibraryTab extends ConsumerWidget {
  const LibraryTab({super.key, required this.type});

  final MediaType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(libraryFilterProvider(type));
    final notifier = ref.read(libraryFilterProvider(type).notifier);
    final listAsync = ref.watch(libraryListProvider(type));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Buscar en ${type.label}...',
              prefixIcon: const Icon(Icons.search),
            ),
            onChanged: notifier.setSearch,
          ),
        ),
        _FilterBar(type: type, filter: filter, notifier: notifier),
        Expanded(
          child: listAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => EmptyState(
              icon: Icons.error_outline,
              title: 'Error al cargar',
              message: '$e',
            ),
            data: (items) {
              if (items.isEmpty) {
                return EmptyState(
                  icon: Icons.collections_bookmark_outlined,
                  title: 'Sin ${type.label} todavía',
                  message: 'Pulsa + para agregar tu primera obra.',
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 88),
                itemCount: items.length,
                itemBuilder: (_, i) {
                  final entry = items[i];
                  return MediaCard(
                    entry: entry,
                    onTap: () => context.push('/detail/${entry.id}'),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FilterBar extends StatelessWidget {
  const _FilterBar({
    required this.type,
    required this.filter,
    required this.notifier,
  });

  final MediaType type;
  final LibraryFilter filter;
  final LibraryFilterNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          FilterChip(
            label: Text(filter.status?.label ?? 'Todos'),
            avatar: const Icon(Icons.filter_list, size: 18),
            selected: filter.status != null,
            onSelected: (_) => _showStatusMenu(context),
          ),
          const SizedBox(width: 8),
          ActionChip(
            label: Text('Orden: ${filter.sort.label}'),
            avatar: const Icon(Icons.sort, size: 18),
            onPressed: () => _showSortMenu(context),
          ),
        ],
      ),
    );
  }

  void _showStatusMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Todos'),
              onTap: () {
                notifier.setStatus(null);
                Navigator.pop(context);
              },
            ),
            for (final s in MediaStatus.values)
              ListTile(
                title: Text(s.label),
                selected: filter.status == s,
                onTap: () {
                  notifier.setStatus(s);
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
    );
  }

  void _showSortMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final s in LibrarySort.values)
              ListTile(
                title: Text(s.label),
                selected: filter.sort == s,
                onTap: () {
                  notifier.setSort(s);
                  Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
    );
  }
}
