import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anivault/core/utils/time_format.dart';
import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/core/statistics/stats_engine.dart';
import 'package:anivault/features/statistics/presentation/stats_providers.dart';
import 'package:anivault/shared/widgets/empty_state.dart';
import 'package:anivault/shared/widgets/stat_tile.dart';

class StatisticsPage extends ConsumerWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(globalStatsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Estadísticas')),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => EmptyState(
          icon: Icons.error_outline,
          title: 'Error',
          message: '$e',
        ),
        data: (stats) {
          if (stats.isEmpty) {
            return const EmptyState(
              icon: Icons.bar_chart,
              title: 'Aún no hay datos',
              message: 'Agrega obras para ver tus estadísticas.',
            );
          }
          return _Dashboard(stats: stats);
        },
      ),
    );
  }
}

class _Dashboard extends StatelessWidget {
  const _Dashboard({required this.stats});
  final GlobalStats stats;

  @override
  Widget build(BuildContext context) {
    final t = stats.time;
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        // Resumen global
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 1.5,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            StatTile(
              label: 'Obras totales',
              value: '${stats.totalWorks}',
              icon: Icons.collections_bookmark,
            ),
            StatTile(
              label: 'Tiempo total',
              value: t.compact,
              icon: Icons.schedule,
              color: Colors.teal,
            ),
            StatTile(
              label: 'Episodios vistos',
              value: '${stats.totalEpisodes}',
              icon: Icons.play_circle,
              color: Colors.indigo,
            ),
            StatTile(
              label: 'Capítulos leídos',
              value: '${stats.totalChapters}',
              icon: Icons.menu_book,
              color: Colors.deepPurple,
            ),
          ],
        ),
        const SizedBox(height: 8),
        _TimeCard(breakdown: t),
        const SizedBox(height: 16),

        // Desglose por tipo
        for (final type in MediaType.values)
          if (!(stats.group(type)?.isEmpty ?? true))
            _GroupCard(group: stats.group(type)!),

        // Gráfico de géneros
        if (stats.genreRanking.isNotEmpty) ...[
          const SizedBox(height: 8),
          _SectionTitle('Distribución por género'),
          _GenrePie(ranking: stats.genreRanking),
        ],

        // Ranking de estudios
        if (stats.studioRanking.isNotEmpty) ...[
          _SectionTitle('Estudios más vistos'),
          _RankingList(ranking: stats.studioRanking, icon: Icons.movie),
        ],

        // Ranking de autores
        if (stats.authorRanking.isNotEmpty) ...[
          _SectionTitle('Autores más leídos'),
          _RankingList(ranking: stats.authorRanking, icon: Icons.person),
        ],

        // Top mejor calificadas
        if (stats.topRated.isNotEmpty) ...[
          _SectionTitle('Top mejor calificadas'),
          for (final e in stats.topRated.take(10))
            ListTile(
              dense: true,
              leading: const Icon(Icons.star, color: Colors.amber),
              title: Text(
                e.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(e.userRating!.toStringAsFixed(1)),
            ),
        ],
        const SizedBox(height: 24),
      ],
    );
  }
}

class _TimeCard extends StatelessWidget {
  const _TimeCard({required this.breakdown});
  final TimeBreakdown breakdown;

  @override
  Widget build(BuildContext context) {
    final items = <(String, String)>[
      ('Horas', breakdown.hours.toTrimmed()),
      ('Días', breakdown.days.toTrimmed()),
      ('Semanas', breakdown.weeks.toTrimmed()),
      ('Meses', breakdown.months.toTrimmed(1)),
      ('Años', breakdown.years.toTrimmed(2)),
    ];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tiempo invertido',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 20,
              runSpacing: 12,
              children: [
                for (final (label, value) in items)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(label, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GroupCard extends StatelessWidget {
  const _GroupCard({required this.group});
  final MediaGroupStats group;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isAnime = group.type == MediaType.anime;
    final rows = <(String, String)>[
      ('Total', '${group.total}'),
      ('Completados', '${group.completed}'),
      if (isAnime) ('En emisión', '${group.ongoing}'),
      if (isAnime)
        ('Episodios vistos', '${group.episodesWatched}')
      else ...[
        ('Capítulos leídos', '${group.chaptersRead}'),
        ('Volúmenes leídos', '${group.volumesRead}'),
        ('Páginas estimadas', '${group.estimatedPages}'),
      ],
      ('Tiempo', group.time.compact),
      ('Promedio', group.avgUnits.toTrimmed(1)),
      if (group.avgScore > 0) ('Puntuación media', group.avgScore.toTrimmed(1)),
      if (group.longest != null) ('Más largo', group.longest!.title),
    ];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(group.type.label, style: theme.textTheme.titleMedium),
            const Divider(),
            for (final (label, value) in rows)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  children: [
                    Expanded(child: Text(label)),
                    Flexible(
                      child: Text(
                        value,
                        textAlign: TextAlign.end,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _GenrePie extends StatelessWidget {
  const _GenrePie({required this.ranking});
  final List<MapEntry<String, int>> ranking;

  static const _colors = [
    Color(0xFF1E4F8F),
    Color(0xFF6AA8FF),
    Color(0xFF00BCD4),
    Color(0xFF4CAF50),
    Color(0xFFFFC107),
    Color(0xFFFF7043),
    Color(0xFFAB47BC),
    Color(0xFFEC407A),
  ];

  @override
  Widget build(BuildContext context) {
    final top = ranking.take(8).toList();
    final total = top.fold<int>(0, (s, e) => s + e.value);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                  sections: [
                    for (var i = 0; i < top.length; i++)
                      PieChartSectionData(
                        value: top[i].value.toDouble(),
                        color: _colors[i % _colors.length],
                        title: '${(top[i].value / total * 100).round()}%',
                        radius: 60,
                        titleStyle: const TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 6,
              children: [
                for (var i = 0; i < top.length; i++)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: _colors[i % _colors.length],
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${top[i].key} (${top[i].value})',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RankingList extends StatelessWidget {
  const _RankingList({required this.ranking, required this.icon});
  final List<MapEntry<String, int>> ranking;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          for (final e in ranking.take(5))
            ListTile(
              dense: true,
              leading: Icon(icon, size: 20),
              title: Text(e.key, maxLines: 1, overflow: TextOverflow.ellipsis),
              trailing: Text('${e.value}'),
            ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 16, 4, 8),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
