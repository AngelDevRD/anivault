import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/features/library/domain/franchise_group.dart';
import 'package:anivault/features/library/presentation/library_providers.dart';
import 'package:anivault/features/library/presentation/widgets/media_card.dart';
import 'package:anivault/shared/widgets/empty_state.dart';
import 'package:anivault/shared/widgets/media_cover.dart';

/// Contenido de una pestaña de biblioteca: buscador, filtros y lista.
class LibraryTab extends ConsumerWidget {
  const LibraryTab({super.key, required this.type});

  final MediaType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(libraryFilterProvider(type));
    final notifier = ref.read(libraryFilterProvider(type).notifier);
    final listAsync = ref.watch(libraryGroupedListProvider(type));

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
                  final group = items[i];
                  return MediaCard(
                    group: group,
                    onTap: () => group.isFranchise
                        ? _showFranchiseSheet(context, group)
                        : context.push('/detail/${group.root.id}'),
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

/// Muestra las obras de una franquicia agrupadas por categoría (Temporadas,
/// Películas, OVAs, ONAs, Especiales, Spin-offs). Cada una lleva a su
/// propia ficha de detalle y progreso.
void _showFranchiseSheet(BuildContext context, FranchiseGroup group) {
  final byBucket = group.bucketed;

  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (sheetContext) => DraggableScrollableSheet(
      initialChildSize: 0.7,
      expand: false,
      builder: (_, scrollController) => ListView(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            group.root.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            '${group.members.length} obras en esta franquicia',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          for (final bucket in FranchiseBucket.values)
            if (byBucket[bucket]?.isNotEmpty ?? false) ...[
              Text(
                bucket.label,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              for (final entry in byBucket[bucket]!)
                ListTile(
                  leading: MediaCover(
                    url: entry.coverImage,
                    width: 40,
                    height: 56,
                  ),
                  title: Text(
                    entry.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(entry.status.label),
                  onTap: () {
                    Navigator.of(sheetContext).pop();
                    GoRouter.of(context).push('/detail/${entry.id}');
                  },
                ),
              const SizedBox(height: 8),
            ],
        ],
      ),
    ),
  );
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
