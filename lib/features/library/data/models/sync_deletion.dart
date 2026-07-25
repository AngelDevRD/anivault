import 'package:isar_community/isar.dart';

part 'sync_deletion.g.dart';

/// Tombstone: registra el `uuid` de una obra borrada localmente que todavía
/// no se eliminó en Supabase. El SyncEngine la borra remotamente y luego
/// quita esta fila.
@collection
class SyncDeletion {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;
}
