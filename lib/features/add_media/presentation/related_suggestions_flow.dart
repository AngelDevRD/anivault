import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:anivault/core/providers.dart';
import 'package:anivault/features/add_media/domain/franchise_suggestions.dart';
import 'package:anivault/features/add_media/domain/media_relation.dart';
import 'package:anivault/features/add_media/domain/media_suggestion.dart';
import 'package:anivault/features/add_media/presentation/related_suggestions_sheet.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';

/// Re-consulta las relaciones de AniList de [entry] y, si hay obras
/// relacionadas que todavía no están en la biblioteca, ofrece agregarlas.
/// Al terminar, actualiza `entry.hasUnaddedRelations` con lo que quede
/// pendiente (siempre re-verifica en el momento; no depende de que ese
/// campo estuviera perfectamente actualizado).
///
/// Usado tanto por el botón "Buscar más contenido" del detalle como por
/// el aviso de la biblioteca cuando una franquicia tiene contenido nuevo.
Future<void> searchAndOfferRelated(
  BuildContext context,
  WidgetRef ref,
  MediaEntry entry,
) async {
  final anilistId = entry.anilistId;
  if (anilistId == null) return;
  final messenger = ScaffoldMessenger.of(context);
  final repo = ref.read(mediaSearchRepositoryProvider);
  final isar = ref.read(isarServiceProvider);

  try {
    final result = await repo.fetchDetail(
      MediaSuggestion(
        source: MediaSource.anilist,
        sourceId: anilistId.toString(),
        type: entry.type,
        title: entry.title,
      ),
    );
    final missing = await findMissingRelated(result.relations, isar);
    if (!context.mounted) return;

    if (missing.isEmpty) {
      entry.hasUnaddedRelations = false;
      await isar.upsert(entry);
      messenger.showSnackBar(
        const SnackBar(content: Text('No hay obras nuevas relacionadas')),
      );
      return;
    }

    final selected = await showModalBottomSheet<List<MediaRelation>>(
      context: context,
      isScrollControlled: true,
      builder: (_) => RelatedSuggestionsSheet(relations: missing),
    );

    var stillMissing = missing;
    if (selected != null && selected.isNotEmpty) {
      final added = await addSelectedRelated(selected, repo, isar);
      stillMissing = missing.where((r) => !selected.contains(r)).toList();
      messenger.showSnackBar(SnackBar(content: Text('$added obras agregadas')));
    }
    entry.hasUnaddedRelations = stillMissing.isNotEmpty;
    await isar.upsert(entry);
  } catch (e) {
    messenger.showSnackBar(SnackBar(content: Text('Error: $e')));
  }
}
