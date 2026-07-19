import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:anivault/core/providers.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/features/library/presentation/library_providers.dart';
import 'package:anivault/features/statistics/presentation/stats_providers.dart';
import 'package:anivault/shared/widgets/media_cover.dart';
import 'package:anivault/shared/widgets/stat_tile.dart';

/// Obras en curso (estado "viéndolo"), ordenadas por última actualización.
final continueWatchingProvider = FutureProvider<List<MediaEntry>>((ref) async {
  ref.watch(libraryRevisionProvider);
  final all = await ref.watch(isarServiceProvider).getAll();
  final watching = all.where((e) => e.status == MediaStatus.watching).toList()
    ..sort(
      (a, b) => (b.lastUpdatedDate ?? b.addedDate).compareTo(
        a.lastUpdatedDate ?? a.addedDate,
      ),
    );
  return watching.take(10).toList();
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(globalStatsProvider);
    final watching = ref.watch(continueWatchingProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('AniVault')),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          stats.maybeWhen(
            data: (s) => GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.6,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                StatTile(
                  label: 'Obras totales',
                  value: '${s.totalWorks}',
                  icon: Icons.collections_bookmark,
                ),
                StatTile(
                  label: 'Tiempo total',
                  value: s.time.compact,
                  icon: Icons.schedule,
                  color: Colors.teal,
                ),
              ],
            ),
            orElse: () => const SizedBox.shrink(),
          ),
          const SizedBox(height: 16),
          Text(
            'Continuar viendo',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          watching.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('$e'),
            data: (items) {
              if (items.isEmpty) {
                return Card(
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'No tienes obras en curso. '
                      'Marca alguna como "En progreso".',
                    ),
                  ),
                );
              }
              return SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 10),
                  itemBuilder: (_, i) => _ContinueCard(entry: items[i]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ContinueCard extends StatelessWidget {
  const _ContinueCard({required this.entry});
  final MediaEntry entry;

  @override
  Widget build(BuildContext context) {
    final total = entry.totalUnits;
    return GestureDetector(
      onTap: () => context.push('/detail/${entry.id}'),
      child: SizedBox(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaCover(url: entry.coverImage, width: 120, height: 150),
            const SizedBox(height: 6),
            Text(
              entry.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Text(
              total != null
                  ? '${entry.currentUnits}/$total'
                  : '${entry.currentUnits}',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
