import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anivault/core/providers.dart';
import 'package:anivault/features/library/presentation/library_providers.dart';
import 'package:anivault/core/statistics/stats_engine.dart';

/// Estadísticas globales calculadas a partir de toda la biblioteca.
/// Se recalculan automáticamente cuando cambian los datos.
final globalStatsProvider = FutureProvider<GlobalStats>((ref) async {
  ref.watch(libraryRevisionProvider);
  final all = await ref.watch(isarServiceProvider).getAll();
  return const StatsEngine().compute(all);
});
