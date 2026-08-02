import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:anivault/features/add_media/domain/franchise_suggestions.dart';
import 'package:anivault/features/add_media/domain/media_relation.dart';
import 'package:anivault/features/library/domain/franchise_group.dart';
import 'package:anivault/shared/widgets/media_cover.dart';

/// Lista de obras relacionadas (películas, OVAs, secuelas...) que AniList
/// reporta y que todavía no están en la biblioteca, agrupadas por
/// categoría. El usuario elige cuáles agregar para completar la
/// franquicia recién creada; las secuelas/temporadas quedan pre-marcadas
/// (son la continuación directa de la historia), el resto no.
class RelatedSuggestionsSheet extends HookConsumerWidget {
  const RelatedSuggestionsSheet({super.key, required this.relations});

  final List<MediaRelation> relations;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final byBucket = useMemoized(() {
      final map = <FranchiseBucket, List<MediaRelation>>{};
      for (final r in relations) {
        map.putIfAbsent(bucketOfRelation(r), () => []).add(r);
      }
      for (final list in map.values) {
        list.sort((a, b) => (a.year ?? 999999).compareTo(b.year ?? 999999));
      }
      return map;
    }, [relations]);

    final selected = useState(
      relations
          .where((r) => defaultSelectedBuckets.contains(bucketOfRelation(r)))
          .toSet(),
    );

    void toggle(MediaRelation r, bool checked) {
      final next = {...selected.value};
      if (checked) {
        next.add(r);
      } else {
        next.remove(r);
      }
      selected.value = next;
    }

    return SafeArea(
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
        expand: false,
        builder: (_, scrollController) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${relations.length} obras relacionadas encontradas',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  TextButton(
                    onPressed: () => selected.value = relations.toSet(),
                    child: const Text('Todo'),
                  ),
                  TextButton(
                    onPressed: () => selected.value = {},
                    child: const Text('Nada'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                controller: scrollController,
                children: [
                  for (final bucket in FranchiseBucket.values)
                    if (byBucket[bucket]?.isNotEmpty ?? false) ...[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                        child: Text(
                          bucket.label,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      for (final rel in byBucket[bucket]!)
                        CheckboxListTile(
                          value: selected.value.contains(rel),
                          secondary: MediaCover(
                            url: rel.coverImage,
                            width: 36,
                            height: 50,
                          ),
                          title: Text(
                            rel.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(_subtitle(rel)),
                          onChanged: (checked) =>
                              toggle(rel, checked ?? false),
                        ),
                    ],
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: selected.value.isEmpty
                      ? null
                      : () =>
                            Navigator.of(context).pop(selected.value.toList()),
                  child: Text('Agregar ${selected.value.length} obras'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _subtitle(MediaRelation r) {
    final parts = <String>[
      if (r.format != null) r.format! else r.relationType,
      if (r.year != null) '${r.year}',
      if (r.units != null)
        r.mediaType == 'ANIME' ? '${r.units} ep' : '${r.units} cap',
    ];
    return parts.join(' • ');
  }
}
