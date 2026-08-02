import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anivault/core/providers.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/features/library/domain/franchise_group.dart';

/// Señal reactiva: emite cada vez que cambia la colección de obras en Isar.
/// Permite a las listas refrescarse automáticamente tras agregar/editar/borrar.
final libraryRevisionProvider = StreamProvider<void>((ref) {
  final isar = ref.watch(isarServiceProvider).isar;
  return isar.mediaEntrys.watchLazy(fireImmediately: true);
});

/// Filtros/orden/búsqueda por pestaña (uno por MediaType).
class LibraryFilter {
  const LibraryFilter({
    this.status,
    this.sort = LibrarySort.recent,
    this.search = '',
  });

  final MediaStatus? status;
  final LibrarySort sort;
  final String search;

  LibraryFilter copyWith({
    Object? status = _sentinel,
    LibrarySort? sort,
    String? search,
  }) {
    return LibraryFilter(
      status: identical(status, _sentinel)
          ? this.status
          : status as MediaStatus?,
      sort: sort ?? this.sort,
      search: search ?? this.search,
    );
  }

  static const _sentinel = Object();
}

class LibraryFilterNotifier extends Notifier<LibraryFilter> {
  LibraryFilterNotifier(this.type);

  final MediaType type;

  @override
  LibraryFilter build() => const LibraryFilter();

  void setStatus(MediaStatus? status) => state = state.copyWith(status: status);
  void setSort(LibrarySort sort) => state = state.copyWith(sort: sort);
  void setSearch(String search) => state = state.copyWith(search: search);
}

final libraryFilterProvider =
    NotifierProvider.family<LibraryFilterNotifier, LibraryFilter, MediaType>(
      LibraryFilterNotifier.new,
    );

/// Lista de obras de una pestaña, aplicando filtro/orden/búsqueda y
/// refrescándose ante cambios en la base de datos.
final libraryListProvider = FutureProvider.family<List<MediaEntry>, MediaType>((
  ref,
  type,
) async {
  // Re-ejecuta cuando cambia la colección o los filtros.
  ref.watch(libraryRevisionProvider);
  final filter = ref.watch(libraryFilterProvider(type));
  final isar = ref.watch(isarServiceProvider);
  return isar.queryLibrary(
    type: type,
    status: filter.status,
    search: filter.search,
    sort: filter.sort,
    limit: 500,
  );
});

/// Igual que [libraryListProvider], pero agrupando por franquicia: una
/// misma obra principal, sus temporadas, películas, OVAs, etc. aparecen
/// como un único elemento en la biblioteca.
final libraryGroupedListProvider =
    FutureProvider.family<List<FranchiseGroup>, MediaType>((ref, type) async {
      final flat = await ref.watch(libraryListProvider(type).future);
      return groupByFranchise(flat);
    });

/// Conteo total por tipo (para badges de las pestañas).
final libraryCountProvider = FutureProvider.family<int, MediaType>((
  ref,
  type,
) async {
  ref.watch(libraryRevisionProvider);
  return ref.watch(isarServiceProvider).countByType(type);
});
