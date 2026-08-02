import 'package:anivault/features/add_media/domain/media_relation.dart';
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
