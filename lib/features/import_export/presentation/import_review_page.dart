import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:anivault/core/providers.dart';
import 'package:anivault/features/add_media/domain/media_suggestion.dart';
import 'package:anivault/features/library/data/franchise_linker.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/shared/widgets/media_cover.dart';

/// Revisión manual de los títulos que no encontraron match automático en
/// [ImportTitleListPage]. Por cada uno el usuario puede buscar y elegir la
/// obra correcta, o agregarlo solo con el título para completarlo después.
class ImportReviewPage extends HookConsumerWidget {
  const ImportReviewPage({super.key, required this.titles, required this.type});

  final List<String> titles;
  final MediaType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resolved = useState<Set<String>>({});

    Future<void> addBare(String title) async {
      final isar = ref.read(isarServiceProvider);
      await isar.upsert(MediaEntry(type: type, title: title));
      resolved.value = {...resolved.value, title};
    }

    Future<void> addAllBare() async {
      final pending = titles.where((t) => !resolved.value.contains(t)).toList();
      for (final t in pending) {
        await addBare(t);
      }
    }

    Future<void> openSearch(String title) async {
      final picked = await showModalBottomSheet<MediaSuggestion>(
        context: context,
        isScrollControlled: true,
        builder: (_) => _SearchSheet(initialQuery: title, type: type),
      );
      if (picked == null) return;
      final isar = ref.read(isarServiceProvider);
      final repo = ref.read(mediaSearchRepositoryProvider);
      final existing = picked.source == MediaSource.anilist
          ? await isar.findByAnilistId(int.parse(picked.sourceId), type)
          : null;
      if (existing == null) {
        final result = await repo.fetchDetail(picked);
        await linkFranchise(result.entry, result.relations, isar);
        await isar.upsert(result.entry);
      }
      resolved.value = {...resolved.value, title};
    }

    final pendingCount = titles.where((t) => !resolved.value.contains(t)).length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Revisar $pendingCount sin match'),
        actions: [
          if (pendingCount > 0)
            TextButton(
              onPressed: addAllBare,
              child: const Text('Agregar todos'),
            ),
        ],
      ),
      body: ListView.separated(
        itemCount: titles.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (_, i) {
          final title = titles[i];
          final done = resolved.value.contains(title);
          return ListTile(
            title: Text(
              title,
              style: done
                  ? const TextStyle(decoration: TextDecoration.lineThrough)
                  : null,
            ),
            trailing: done
                ? const Icon(Icons.check_circle, color: Colors.green)
                : Wrap(
                    spacing: 4,
                    children: [
                      TextButton(
                        onPressed: () => addBare(title),
                        child: const Text('Solo título'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () => openSearch(title),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

class _SearchSheet extends HookConsumerWidget {
  const _SearchSheet({required this.initialQuery, required this.type});

  final String initialQuery;
  final MediaType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: initialQuery);
    final query = useState(initialQuery);
    final debounce = useRef<Timer?>(null);

    useEffect(() => () => debounce.value?.cancel(), const []);

    final results = ref.watch(_reviewSearchProvider((query: query.value, type: type)));

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: controller,
                autofocus: true,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Buscar título...',
                ),
                onChanged: (v) {
                  debounce.value?.cancel();
                  debounce.value = Timer(
                    const Duration(milliseconds: 400),
                    () => query.value = v,
                  );
                },
              ),
            ),
            Expanded(
              child: results.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
                data: (items) {
                  if (items.isEmpty) {
                    return const Center(child: Text('Sin resultados'));
                  }
                  return ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (_, i) {
                      final s = items[i];
                      return ListTile(
                        leading: MediaCover(url: s.coverImage, width: 42, height: 60),
                        title: Text(s.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                        subtitle: Text(s.subtitle),
                        onTap: () => Navigator.of(context).pop(s),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _reviewSearchProvider = FutureProvider.family
    .autoDispose<List<MediaSuggestion>, ({String query, MediaType type})>((
      ref,
      args,
    ) async {
      if (args.query.trim().length < 2) return const [];
      return ref
          .watch(mediaSearchRepositoryProvider)
          .search(query: args.query, type: args.type);
    });
