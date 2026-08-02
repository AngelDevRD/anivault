import 'package:flutter/material.dart';

import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/features/library/domain/franchise_group.dart';
import 'package:anivault/shared/widgets/media_cover.dart';

/// Color asociado a cada estado de seguimiento.
Color statusColor(BuildContext context, MediaStatus status) {
  final scheme = Theme.of(context).colorScheme;
  return switch (status) {
    MediaStatus.watching => Colors.blue,
    MediaStatus.completed => Colors.green,
    MediaStatus.paused => Colors.orange,
    MediaStatus.dropped => scheme.error,
    MediaStatus.pending => scheme.outline,
  };
}

/// Tarjeta de una obra (o franquicia completa) en la lista de biblioteca.
/// Muestra los datos de la obra principal ([FranchiseGroup.root]); si el
/// grupo tiene más miembros (temporadas, películas, OVAs...) se ve un
/// badge con el total.
class MediaCard extends StatelessWidget {
  const MediaCard({super.key, required this.group, required this.onTap});

  final FranchiseGroup group;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final entry = group.root;
    final total = entry.totalUnits;
    final unitLabel = entry.type == MediaType.anime ? 'ep' : 'cap';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MediaCover(url: entry.coverImage, width: 64, height: 90),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            entry.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (group.isFranchise)
                          Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.secondaryContainer,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '${group.members.length} obras',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onSecondaryContainer,
                                ),
                              ),
                            ),
                          ),
                        if (entry.favorite)
                          const Icon(
                            Icons.favorite,
                            size: 16,
                            color: Colors.redAccent,
                          ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor(
                              context,
                              entry.status,
                            ).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            entry.status.label,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: statusColor(context, entry.status),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        if (entry.userRating != null)
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 14,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                entry.userRating!.toStringAsFixed(1),
                                style: theme.textTheme.labelSmall,
                              ),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      total != null
                          ? '${entry.currentUnits} / $total $unitLabel'
                          : '${entry.currentUnits} $unitLabel',
                      style: theme.textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: entry.progress,
                        minHeight: 4,
                        backgroundColor:
                            theme.colorScheme.surfaceContainerHighest,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
