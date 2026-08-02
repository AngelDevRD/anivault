import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anivault/core/providers.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/features/library/domain/franchise_group.dart';
import 'package:anivault/features/library/presentation/library_providers.dart';

/// Carga una obra por id y se refresca ante cambios en la base de datos.
final mediaEntryProvider = FutureProvider.family<MediaEntry?, int>((
  ref,
  id,
) async {
  ref.watch(libraryRevisionProvider);
  return ref.watch(isarServiceProvider).getById(id);
});

/// Si [id] está "Completada" y pertenece a una franquicia, la próxima obra
/// pendiente en orden cronológico (ver [nextToWatchAfter]). `null` si no
/// aplica o no hay ninguna.
final nextToWatchProvider = FutureProvider.family<MediaEntry?, int>((
  ref,
  id,
) async {
  ref.watch(libraryRevisionProvider);
  final isar = ref.watch(isarServiceProvider);
  final entry = await isar.getById(id);
  if (entry == null ||
      entry.status != MediaStatus.completed ||
      entry.franchiseId == null) {
    return null;
  }
  final members = await isar.findByFranchiseId(entry.franchiseId!);
  return nextToWatchAfter(entry, members);
});
