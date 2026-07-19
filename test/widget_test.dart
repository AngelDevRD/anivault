// Prueba unitaria del motor de estadísticas (toda la matemática vive en Dart).
import 'package:flutter_test/flutter_test.dart';

import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/core/statistics/stats_engine.dart';

void main() {
  const engine = StatsEngine();

  MediaEntry anime({
    required int episodes,
    required int watched,
    int duration = 24,
    List<String> genres = const [],
    String? studio,
  }) {
    return MediaEntry(
      type: MediaType.anime,
      status: MediaStatus.watching,
      title: 'A',
      totalEpisodes: episodes,
      currentEpisode: watched,
      episodeDuration: duration,
      genres: genres,
      studio: studio,
    );
  }

  test('tiempo de anime calculado por duración de episodio', () {
    final stats = engine.compute([
      anime(episodes: 12, watched: 12, duration: 24), // 288 min
      anime(episodes: 24, watched: 10, duration: 24), // 240 min
    ]);
    expect(stats.totalWorks, 2);
    expect(stats.totalEpisodes, 22);
    expect(stats.totalMinutes, 288 + 240);
  });

  test('ranking de géneros ordenado por frecuencia', () {
    final stats = engine.compute([
      anime(episodes: 12, watched: 1, genres: ['Action', 'Comedy']),
      anime(episodes: 12, watched: 1, genres: ['Action']),
    ]);
    expect(stats.genreRanking.first.key, 'Action');
    expect(stats.genreRanking.first.value, 2);
  });

  test('biblioteca vacía produce estadísticas vacías', () {
    final stats = engine.compute([]);
    expect(stats.isEmpty, true);
    expect(stats.totalMinutes, 0);
  });
}
