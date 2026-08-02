import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:anivault/features/add_media/domain/media_relation.dart';
import 'package:anivault/shared/widgets/media_cover.dart';

/// Lista de obras relacionadas (películas, OVAs, secuelas...) que AniList
/// reporta y que todavía no están en la biblioteca. El usuario elige
/// cuáles agregar de una vez, para completar la franquicia recién creada.
class RelatedSuggestionsSheet extends HookConsumerWidget {
  const RelatedSuggestionsSheet({super.key, required this.relations});

  final List<MediaRelation> relations;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState(relations.toSet());

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Text(
              '${relations.length} obras relacionadas encontradas',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: [
                for (final rel in relations)
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
                    subtitle: Text(rel.format ?? rel.relationType),
                    onChanged: (checked) {
                      final next = {...selected.value};
                      if (checked == true) {
                        next.add(rel);
                      } else {
                        next.remove(rel);
                      }
                      selected.value = next;
                    },
                  ),
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
                    : () => Navigator.of(
                        context,
                      ).pop(selected.value.toList()),
                child: Text('Agregar ${selected.value.length} obras'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
