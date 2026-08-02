import 'package:anivault/features/add_media/data/media_search_repository.dart';
import 'package:anivault/features/add_media/domain/media_relation.dart';
import 'package:anivault/features/add_media/domain/media_suggestion.dart';
import 'package:anivault/features/library/data/franchise_linker.dart';
import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/features/library/domain/franchise_group.dart';
import 'package:anivault/services/isar_service.dart';

/// Tipos de relación (AniList) que representan contenido de la misma
/// continuidad narrativa, vale la pena ofrecer agregarlo. Se excluyen
/// CHARACTER (comparte personaje, no la obra), SUMMARY (recopilatorio),
/// ADAPTATION/SOURCE (cambian de medio) y OTHER (demasiado ambiguo, suele
/// ser música o merchandising).
const franchiseRelationTypes = {
  'PREQUEL',
  'SEQUEL',
  'PARENT',
  'SIDE_STORY',
  'ALTERNATIVE',
  'SPIN_OFF',
  'COMPILATION',
  'CONTAINS',
};

/// De las relaciones de una obra recién agregada, cuáles todavía no están
/// en la biblioteca y vale la pena sugerir para completar la franquicia.
Future<List<MediaRelation>> findMissingRelated(
  List<MediaRelation> relations,
  IsarService isar,
) async {
  final missing = <MediaRelation>[];
  for (final rel in relations) {
    if (!franchiseRelationTypes.contains(rel.relationType)) continue;
    final existing = await isar.findByAnilistIdAnyType(rel.anilistId);
    if (existing == null) missing.add(rel);
  }
  return missing;
}

/// Clasifica una relación en la misma categoría que usa la biblioteca
/// (ver `bucketOf` para `MediaEntry`), para mostrar las sugerencias
/// agrupadas por Temporadas/Películas/OVAs/etc.
FranchiseBucket bucketOfRelation(MediaRelation r) {
  if (r.relationType == 'SPIN_OFF') return FranchiseBucket.spinOff;
  return switch (r.format) {
    'TV' || 'TV_SHORT' => FranchiseBucket.main,
    'MOVIE' => FranchiseBucket.movie,
    'OVA' => FranchiseBucket.ova,
    'ONA' => FranchiseBucket.ona,
    'SPECIAL' => FranchiseBucket.special,
    _ => FranchiseBucket.other,
  };
}

/// Categorías que se marcan por defecto en el diálogo de sugerencias:
/// continuaciones directas de la historia. Películas/OVAs/especiales/
/// spin-offs quedan sin marcar (el usuario decide si le interesan).
const defaultSelectedBuckets = {FranchiseBucket.main};

/// Agrega las obras relacionadas que el usuario seleccionó, uniendo cada
/// una a la misma franquicia. Si una falla (ej. sin red), sigue con el
/// resto sin contarla. Devuelve cuántas se agregaron con éxito.
Future<int> addSelectedRelated(
  List<MediaRelation> selected,
  MediaSearchRepository repo,
  IsarService isar,
) async {
  var added = 0;
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
      added++;
    } catch (_) {
      // Se sigue con el resto de la selección.
    }
  }
  return added;
}
