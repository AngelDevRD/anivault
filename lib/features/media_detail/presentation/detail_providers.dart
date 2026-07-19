import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anivault/core/providers.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/presentation/library_providers.dart';

/// Carga una obra por id y se refresca ante cambios en la base de datos.
final mediaEntryProvider = FutureProvider.family<MediaEntry?, int>((
  ref,
  id,
) async {
  ref.watch(libraryRevisionProvider);
  return ref.watch(isarServiceProvider).getById(id);
});
