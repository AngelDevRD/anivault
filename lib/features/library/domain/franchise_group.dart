import 'package:anivault/features/library/data/models/media_entry.dart';

/// Categoría de una obra dentro de su franquicia, para la vista expandida
/// (Anime principal/Temporadas, Películas, OVAs, ONAs, Especiales, Spin-offs).
enum FranchiseBucket {
  main,
  movie,
  ova,
  ona,
  special,
  spinOff,
  other;

  String get label => switch (this) {
    FranchiseBucket.main => 'Temporadas',
    FranchiseBucket.movie => 'Películas',
    FranchiseBucket.ova => 'OVAs',
    FranchiseBucket.ona => 'ONAs',
    FranchiseBucket.special => 'Especiales',
    FranchiseBucket.spinOff => 'Spin-offs',
    FranchiseBucket.other => 'Otros',
  };
}

/// Clasifica una obra dentro de su franquicia. Prioriza el tipo de
/// relación con la que se vinculó (AniList) por sobre el formato, ya que
/// es la señal más específica (ej. un spin-off puede ser format TV igual
/// que una temporada normal).
FranchiseBucket bucketOf(MediaEntry e) {
  if (e.relationToRoot == 'SPIN_OFF') return FranchiseBucket.spinOff;
  return switch (e.format) {
    'TV' || 'TV_SHORT' => FranchiseBucket.main,
    'MOVIE' => FranchiseBucket.movie,
    'OVA' => FranchiseBucket.ova,
    'ONA' => FranchiseBucket.ona,
    'SPECIAL' => FranchiseBucket.special,
    _ => FranchiseBucket.other,
  };
}

/// Un grupo de biblioteca: una franquicia completa (obra principal +
/// temporadas/películas/OVAs/etc.) o una obra independiente sin franquicia
/// detectada (`members` tiene un solo elemento, igual a [root]).
class FranchiseGroup {
  const FranchiseGroup({required this.root, required this.members});

  /// Obra que representa la franquicia en la biblioteca: la serie TV más
  /// antigua si existe alguna, o si no, la primera obra agregada.
  final MediaEntry root;

  /// Todas las obras del grupo, incluyendo [root].
  final List<MediaEntry> members;

  bool get isFranchise => members.length > 1;
}

/// Agrupa una lista plana de obras (ya filtrada/ordenada) por `franchiseId`.
/// Las obras sin franquicia quedan como grupos de un solo miembro. El orden
/// de los grupos sigue el de la primera obra de cada uno en [entries].
List<FranchiseGroup> groupByFranchise(List<MediaEntry> entries) {
  final membersByKey = <String, List<MediaEntry>>{};
  final order = <String>[];

  for (final e in entries) {
    final key = e.franchiseId ?? 'standalone:${e.id}';
    if (!membersByKey.containsKey(key)) order.add(key);
    membersByKey.putIfAbsent(key, () => []).add(e);
  }

  return [
    for (final key in order)
      FranchiseGroup(
        root: _pickRoot(membersByKey[key]!),
        members: membersByKey[key]!,
      ),
  ];
}

MediaEntry _pickRoot(List<MediaEntry> members) {
  final tvSeries =
      members.where((e) => e.format == 'TV' || e.format == 'TV_SHORT').toList()
        ..sort((a, b) => (a.year ?? 999999).compareTo(b.year ?? 999999));
  if (tvSeries.isNotEmpty) return tvSeries.first;

  final original = members.where((e) => e.relationToRoot == null);
  if (original.isNotEmpty) return original.first;

  return members.first;
}
