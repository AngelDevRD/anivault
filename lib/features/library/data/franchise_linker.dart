import 'package:uuid/uuid.dart';

import 'package:anivault/features/add_media/domain/media_relation.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/services/isar_service.dart';

const _uuidGen = Uuid();

/// Decide si una obra recién descargada pertenece a una franquicia ya
/// presente en la biblioteca, usando sus relaciones directas (AniList):
/// si alguna de ellas coincide con una obra local que ya tiene
/// `franchiseId`, esta entrada se une a esa misma franquicia. Si ninguna
/// coincide, queda como una franquicia nueva de un solo miembro.
///
/// Muta `entry` in-place (aún no persistida); el llamador debe guardarla
/// después con `IsarService.upsert`.
Future<void> linkFranchise(
  MediaEntry entry,
  List<MediaRelation> relations,
  IsarService isar,
) async {
  for (final rel in relations) {
    final existing = await isar.findByAnilistId(rel.anilistId, entry.type);
    if (existing?.franchiseId != null) {
      entry.franchiseId = existing!.franchiseId;
      entry.relationToRoot = rel.relationType;
      return;
    }
  }
  entry.franchiseId = _uuidGen.v4();
}
