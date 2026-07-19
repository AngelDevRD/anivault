import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:anivault/core/providers.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/features/library/presentation/widgets/media_card.dart';
import 'package:anivault/features/media_detail/presentation/detail_providers.dart';
import 'package:anivault/shared/widgets/media_cover.dart';

class MediaDetailPage extends ConsumerWidget {
  const MediaDetailPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(mediaEntryProvider(id));
    return Scaffold(
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (entry) {
          if (entry == null) {
            return const Center(child: Text('Obra no encontrada'));
          }
          return _DetailBody(entry: entry);
        },
      ),
    );
  }
}

class _DetailBody extends ConsumerWidget {
  const _DetailBody({required this.entry});

  final MediaEntry entry;

  Future<void> _save(WidgetRef ref) =>
      ref.read(isarServiceProvider).upsert(entry);

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('¿Eliminar obra?'),
        content: Text('"${entry.title}" se quitará de tu biblioteca.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
    if (ok == true) {
      await ref.read(isarServiceProvider).delete(entry.id);
      if (context.mounted) Navigator.pop(context);
    }
  }

  void _changeStatus(WidgetRef ref, MediaStatus status) {
    entry.status = status;
    if (status == MediaStatus.watching && entry.startDate == null) {
      entry.startDate = DateTime.now();
    }
    if (status == MediaStatus.completed) {
      final total = entry.totalUnits;
      if (total != null) {
        if (entry.type == MediaType.anime) {
          entry.currentEpisode = total;
        } else {
          entry.currentChapter = total;
        }
      }
    }
    _save(ref);
  }

  void _bumpUnit(WidgetRef ref, int delta) {
    if (entry.type == MediaType.anime) {
      entry.currentEpisode = (entry.currentEpisode + delta).clamp(0, 1 << 30);
    } else {
      entry.currentChapter = (entry.currentChapter + delta).clamp(0, 1 << 30);
    }
    if (entry.status == MediaStatus.pending) {
      entry.status = MediaStatus.watching;
      entry.startDate ??= DateTime.now();
    }
    _save(ref);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isAnime = entry.type == MediaType.anime;
    final unitWord = isAnime ? 'Episodio' : 'Capítulo';
    final total = entry.totalUnits;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          actions: [
            IconButton(
              icon: Icon(
                entry.favorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: entry.favorite ? Colors.redAccent : null,
              onPressed: () {
                entry.favorite = !entry.favorite;
                _save(ref);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: () => _delete(context, ref),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: entry.bannerImage != null
                ? MediaCover(url: entry.bannerImage, radius: 0)
                : Container(color: theme.colorScheme.surfaceContainerHigh),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MediaCover(url: entry.coverImage, width: 100, height: 145),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(entry.title, style: theme.textTheme.titleLarge),
                          if (entry.titleOriginal != null)
                            Text(
                              entry.titleOriginal!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.outline,
                              ),
                            ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: [
                              if (entry.year != null)
                                _MetaChip(label: '${entry.year}'),
                              if (entry.format != null)
                                _MetaChip(label: entry.format!),
                              if (entry.averageScore != null)
                                _MetaChip(
                                  icon: Icons.star,
                                  label: '${entry.averageScore! / 10}',
                                ),
                            ],
                          ),
                          if (entry.studio != null) ...[
                            const SizedBox(height: 8),
                            Text(
                              '${isAnime ? 'Estudio' : 'Autor'}: ${entry.studio}',
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Estado
                Text('Estado', style: theme.textTheme.titleMedium),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    for (final s in MediaStatus.values)
                      ChoiceChip(
                        label: Text(s.label),
                        selected: entry.status == s,
                        selectedColor: statusColor(
                          context,
                          s,
                        ).withValues(alpha: 0.25),
                        onSelected: (_) => _changeStatus(ref, s),
                      ),
                  ],
                ),
                const SizedBox(height: 20),

                // Progreso
                Text('Progreso', style: theme.textTheme.titleMedium),
                const SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                total != null
                                    ? '$unitWord ${entry.currentUnits} de $total'
                                    : '$unitWord ${entry.currentUnits}',
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                            IconButton.filledTonal(
                              icon: const Icon(Icons.remove),
                              onPressed: () => _bumpUnit(ref, -1),
                            ),
                            const SizedBox(width: 8),
                            IconButton.filledTonal(
                              icon: const Icon(Icons.add),
                              onPressed: () => _bumpUnit(ref, 1),
                            ),
                          ],
                        ),
                        if (total != null) ...[
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: entry.progress,
                              minHeight: 6,
                            ),
                          ),
                        ],
                        if (!isAnime && entry.totalVolumes != null) ...[
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Volumen ${entry.currentVolume} de '
                                  '${entry.totalVolumes}',
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                              IconButton.filledTonal(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  entry.currentVolume =
                                      (entry.currentVolume - 1).clamp(
                                        0,
                                        1 << 30,
                                      );
                                  _save(ref);
                                },
                              ),
                              const SizedBox(width: 8),
                              IconButton.filledTonal(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  entry.currentVolume += 1;
                                  _save(ref);
                                },
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Calificación personal
                Text('Tu calificación', style: theme.textTheme.titleMedium),
                Row(
                  children: [
                    Expanded(
                      child: Slider(
                        value: entry.userRating ?? 0,
                        min: 0,
                        max: 10,
                        divisions: 20,
                        label: (entry.userRating ?? 0).toStringAsFixed(1),
                        onChanged: (v) {
                          entry.userRating = v == 0 ? null : v;
                          _save(ref);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 44,
                      child: Text(
                        entry.userRating?.toStringAsFixed(1) ?? '–',
                        textAlign: TextAlign.end,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Notas
                Text('Notas', style: theme.textTheme.titleMedium),
                const SizedBox(height: 8),
                TextFormField(
                  initialValue: entry.notes ?? '',
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Escribe una nota personal...',
                  ),
                  onChanged: (v) => entry.notes = v.isEmpty ? null : v,
                  onTapOutside: (_) => _save(ref),
                ),
                const SizedBox(height: 16),

                if (entry.startDate != null || entry.lastUpdatedDate != null)
                  _DatesRow(entry: entry),

                if (entry.genres.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text('Géneros', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      for (final g in entry.genres) _MetaChip(label: g),
                    ],
                  ),
                ],

                if (entry.synopsis != null) ...[
                  const SizedBox(height: 16),
                  Text('Sinopsis', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(entry.synopsis!, style: theme.textTheme.bodyMedium),
                ],
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DatesRow extends StatelessWidget {
  const _DatesRow({required this.entry});
  final MediaEntry entry;

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat('d MMM y', 'es');
    final theme = Theme.of(context);
    return Row(
      children: [
        if (entry.startDate != null)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Inicio', style: theme.textTheme.labelSmall),
                Text(
                  fmt.format(entry.startDate!),
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        if (entry.lastUpdatedDate != null)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Última actualización', style: theme.textTheme.labelSmall),
                Text(
                  fmt.format(entry.lastUpdatedDate!),
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.label, this.icon});
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: scheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: scheme.onSecondaryContainer),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(fontSize: 12, color: scheme.onSecondaryContainer),
          ),
        ],
      ),
    );
  }
}
