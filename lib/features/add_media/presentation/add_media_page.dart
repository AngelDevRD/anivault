import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:anivault/core/providers.dart';
import 'package:anivault/features/add_media/domain/franchise_suggestions.dart';
import 'package:anivault/features/add_media/domain/media_relation.dart';
import 'package:anivault/features/add_media/domain/media_suggestion.dart';
import 'package:anivault/features/add_media/presentation/add_providers.dart';
import 'package:anivault/features/add_media/presentation/related_suggestions_sheet.dart';
import 'package:anivault/features/library/data/franchise_linker.dart';
import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/shared/widgets/empty_state.dart';
import 'package:anivault/shared/widgets/media_cover.dart';

/// Pantalla para agregar una obra: el usuario escribe el nombre y selecciona
/// una sugerencia; el resto de datos se descargan y guardan automáticamente.
class AddMediaPage extends HookConsumerWidget {
  const AddMediaPage({super.key, required this.type});

  final MediaType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final saving = useState<String?>(null); // sourceId en proceso de guardado
    final debounce = useRef<Timer?>(null);

    useEffect(
      () =>
          () => debounce.value?.cancel(),
      const [],
    );

    void onChanged(String value) {
      debounce.value?.cancel();
      debounce.value = Timer(const Duration(milliseconds: 450), () {
        ref.read(addQueryProvider(type).notifier).set(value);
      });
    }

    Future<void> onSelect(MediaSuggestion s) async {
      if (saving.value != null) return;
      saving.value = s.sourceId;
      final messenger = ScaffoldMessenger.of(context);
      final navigator = Navigator.of(context);
      try {
        final repo = ref.read(mediaSearchRepositoryProvider);
        final isar = ref.read(isarServiceProvider);
        final existing = s.source == MediaSource.anilist
            ? await isar.findByAnilistId(int.parse(s.sourceId), s.type)
            : null;
        if (existing != null) {
          messenger.showSnackBar(
            SnackBar(content: Text('"${s.title}" ya está en tu biblioteca')),
          );
          saving.value = null;
          return;
        }
        final result = await repo.fetchDetail(s);
        await linkFranchise(result.entry, result.relations, isar);
        await isar.upsert(result.entry);
        messenger.showSnackBar(
          SnackBar(content: Text('Agregado: ${result.entry.title}')),
        );

        final missing = await findMissingRelated(result.relations, isar);
        if (missing.isNotEmpty && context.mounted) {
          await _offerRelated(context, ref, missing);
        }
        navigator.pop();
      } catch (e) {
        saving.value = null;
        messenger.showSnackBar(
          SnackBar(content: Text('No se pudo agregar: $e')),
        );
      }
    }

    final results = ref.watch(addResultsProvider(type));

    return Scaffold(
      appBar: AppBar(title: Text('Agregar ${type.label}')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Escribe el nombre...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: controller.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          controller.clear();
                          ref.read(addQueryProvider(type).notifier).set('');
                        },
                      ),
              ),
              onChanged: onChanged,
            ),
          ),
          Expanded(
            child: results.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => EmptyState(
                icon: Icons.cloud_off,
                title: 'Error de búsqueda',
                message: '$e',
              ),
              data: (items) {
                if (controller.text.trim().length < 2) {
                  return const EmptyState(
                    icon: Icons.search,
                    title: 'Busca una obra',
                    message:
                        'Los datos se completan automáticamente '
                        'desde AniList.',
                  );
                }
                if (items.isEmpty) {
                  return const EmptyState(
                    icon: Icons.sentiment_dissatisfied,
                    title: 'Sin resultados',
                  );
                }
                return ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (_, i) {
                    final s = items[i];
                    return ListTile(
                      leading: MediaCover(
                        url: s.coverImage,
                        width: 42,
                        height: 60,
                      ),
                      title: Text(
                        s.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(s.subtitle),
                      trailing: saving.value == s.sourceId
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.add_circle_outline),
                      onTap: () => onSelect(s),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Muestra las obras relacionadas encontradas (películas, OVAs, secuelas...)
/// y agrega las que el usuario elija, uniéndolas a la misma franquicia.
Future<void> _offerRelated(
  BuildContext context,
  WidgetRef ref,
  List<MediaRelation> missing,
) async {
  final selected = await showModalBottomSheet<List<MediaRelation>>(
    context: context,
    isScrollControlled: true,
    builder: (_) => RelatedSuggestionsSheet(relations: missing),
  );
  if (selected == null || selected.isEmpty) return;

  final repo = ref.read(mediaSearchRepositoryProvider);
  final isar = ref.read(isarServiceProvider);
  for (final rel in selected) {
    try {
      final suggestion = MediaSuggestion(
        source: MediaSource.anilist,
        sourceId: rel.anilistId.toString(),
        type: rel.mediaType == 'ANIME' ? MediaType.anime : MediaType.manga,
        title: rel.title,
        coverImage: rel.coverImage,
        format: rel.format,
      );
      final result = await repo.fetchDetail(suggestion);
      await linkFranchise(result.entry, result.relations, isar);
      await isar.upsert(result.entry);
    } catch (_) {
      // Si una falla (ej. red), se sigue con el resto de la selección.
    }
  }
}
