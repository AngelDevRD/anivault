import 'package:anivault/core/utils/time_format.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/features/library/domain/enums.dart';

/// Constantes de estimación para obras de lectura.
///
/// El tiempo de lectura no se cuenta en "Tiempo total" (solo aplica a
/// anime): capítulos/páginas leídos se muestran como su propia métrica.
class ReadingEstimates {
  static const pagesPerChapter = 20;
}

/// Estadísticas de un grupo de obras de un mismo tipo.
class MediaGroupStats {
  const MediaGroupStats({
    required this.type,
    required this.total,
    required this.completed,
    required this.ongoing,
    required this.episodesWatched,
    required this.chaptersRead,
    required this.volumesRead,
    required this.estimatedPages,
    required this.minutes,
    required this.avgUnits,
    required this.avgScore,
    required this.avgEpisodeDuration,
    required this.longest,
    required this.shortest,
    required this.byGenre,
    required this.byStudio,
    required this.byYear,
    required this.byStatus,
  });

  final MediaType type;
  final int total;
  final int completed;
  final int ongoing;
  final int episodesWatched;
  final int chaptersRead;
  final int volumesRead;
  final int estimatedPages;
  final int minutes;
  final double avgUnits;
  final double avgScore; // calificación personal media (0-10)
  final double avgEpisodeDuration;
  final MediaEntry? longest;
  final MediaEntry? shortest;
  final Map<String, int> byGenre;
  final Map<String, int> byStudio; // estudio (anime) o autor (lectura)
  final Map<int, int> byYear;
  final Map<MediaStatus, int> byStatus;

  TimeBreakdown get time => TimeBreakdown(minutes);
  bool get isEmpty => total == 0;
}

/// Estadísticas globales agregando todos los tipos.
class GlobalStats {
  const GlobalStats({
    required this.groups,
    required this.totalWorks,
    required this.totalEpisodes,
    required this.totalChapters,
    required this.totalMinutes,
    required this.genreRanking,
    required this.authorRanking,
    required this.studioRanking,
    required this.favorites,
    required this.topLongest,
    required this.topRated,
  });

  final Map<MediaType, MediaGroupStats> groups;
  final int totalWorks;
  final int totalEpisodes;
  final int totalChapters;
  final int totalMinutes;
  final List<MapEntry<String, int>> genreRanking;
  final List<MapEntry<String, int>> authorRanking;
  final List<MapEntry<String, int>> studioRanking;
  final List<MediaEntry> favorites;
  final List<MediaEntry> topLongest;
  final List<MediaEntry> topRated;

  TimeBreakdown get time => TimeBreakdown(totalMinutes);
  bool get isEmpty => totalWorks == 0;

  MediaGroupStats? group(MediaType t) => groups[t];
}

/// Motor de cálculo de estadísticas. Sin dependencias de UI ni de red.
///
/// Vive en `core/` (no en `features/statistics/`) porque lo consumen varias
/// features (Home, Perfil, Chat IA) además del dashboard de estadísticas.
class StatsEngine {
  const StatsEngine();

  GlobalStats compute(List<MediaEntry> all) {
    final groups = <MediaType, MediaGroupStats>{};
    for (final type in MediaType.values) {
      groups[type] = _groupStats(
        type,
        all.where((e) => e.type == type).toList(),
      );
    }

    final genreRanking = _rankStrings(all.expand((e) => e.genres));
    final animeStudios = all
        .where((e) => e.type == MediaType.anime && e.studio != null)
        .map((e) => e.studio!);
    final authors = all
        .where((e) => e.type != MediaType.anime && e.studio != null)
        .map((e) => e.studio!);

    final favorites = all.where((e) => e.favorite).toList()
      ..sort((a, b) => (b.userRating ?? 0).compareTo(a.userRating ?? 0));

    final topLongest = [...all]
      ..sort((a, b) => _length(b).compareTo(_length(a)));

    final topRated = all.where((e) => e.userRating != null).toList()
      ..sort((a, b) => b.userRating!.compareTo(a.userRating!));

    return GlobalStats(
      groups: groups,
      totalWorks: all.length,
      totalEpisodes: all
          .where((e) => e.type == MediaType.anime)
          .fold(0, (s, e) => s + e.currentEpisode),
      totalChapters: all
          .where((e) => e.type != MediaType.anime)
          .fold(0, (s, e) => s + e.currentChapter),
      totalMinutes: all.fold(0, (s, e) => s + _minutes(e)),
      genreRanking: genreRanking,
      authorRanking: _rankStrings(authors),
      studioRanking: _rankStrings(animeStudios),
      favorites: favorites,
      topLongest: topLongest.take(10).toList(),
      topRated: topRated.take(10).toList(),
    );
  }

  MediaGroupStats _groupStats(MediaType type, List<MediaEntry> items) {
    final isAnime = type == MediaType.anime;
    final completed = items
        .where((e) => e.status == MediaStatus.completed)
        .length;
    final ongoing = items.where((e) => e.releaseStatus == 'RELEASING').length;

    final episodesWatched = items.fold(
      0,
      (s, e) => s + (isAnime ? e.currentEpisode : 0),
    );
    final chaptersRead = items.fold(
      0,
      (s, e) => s + (isAnime ? 0 : e.currentChapter),
    );
    final volumesRead = items.fold(0, (s, e) => s + e.currentVolume);
    final minutes = items.fold(0, (s, e) => s + _minutes(e));

    final ratings = items
        .where((e) => e.userRating != null)
        .map((e) => e.userRating!)
        .toList();
    final durations = items
        .where((e) => e.episodeDuration != null)
        .map((e) => e.episodeDuration!)
        .toList();

    final consumedUnits = isAnime ? episodesWatched : chaptersRead;

    MediaEntry? longest;
    MediaEntry? shortest;
    for (final e in items) {
      final len = _totalLen(e);
      if (len <= 0) continue;
      if (longest == null || len > _totalLen(longest)) longest = e;
      if (shortest == null || len < _totalLen(shortest)) shortest = e;
    }

    return MediaGroupStats(
      type: type,
      total: items.length,
      completed: completed,
      ongoing: ongoing,
      episodesWatched: episodesWatched,
      chaptersRead: chaptersRead,
      volumesRead: volumesRead,
      estimatedPages: chaptersRead * ReadingEstimates.pagesPerChapter,
      minutes: minutes,
      avgUnits: items.isEmpty ? 0 : consumedUnits / items.length,
      avgScore: ratings.isEmpty
          ? 0
          : ratings.reduce((a, b) => a + b) / ratings.length,
      avgEpisodeDuration: durations.isEmpty
          ? 0
          : durations.reduce((a, b) => a + b) / durations.length,
      longest: longest,
      shortest: shortest,
      byGenre: _countStrings(items.expand((e) => e.genres)),
      byStudio: _countStrings(
        items.where((e) => e.studio != null).map((e) => e.studio!),
      ),
      byYear: _countInts(
        items.where((e) => e.year != null).map((e) => e.year!),
      ),
      byStatus: {
        for (final s in MediaStatus.values)
          s: items.where((e) => e.status == s).length,
      },
    );
  }

  /// Minutos consumidos por una obra. Solo el anime tiene tiempo real
  /// (episodios × duración); la lectura se mide en capítulos/páginas, no
  /// en minutos estimados (ver [ReadingEstimates]).
  static int _minutes(MediaEntry e) =>
      e.type == MediaType.anime ? e.minutesWatched : 0;

  /// Longitud total conocida (episodios o capítulos) para "más largo/corto".
  static int _totalLen(MediaEntry e) => e.type == MediaType.anime
      ? (e.totalEpisodes ?? 0)
      : (e.totalChapters ?? 0);

  static int _length(MediaEntry e) => _totalLen(e);

  static Map<String, int> _countStrings(Iterable<String> values) {
    final map = <String, int>{};
    for (final v in values) {
      map[v] = (map[v] ?? 0) + 1;
    }
    return map;
  }

  static Map<int, int> _countInts(Iterable<int> values) {
    final map = <int, int>{};
    for (final v in values) {
      map[v] = (map[v] ?? 0) + 1;
    }
    return map;
  }

  static List<MapEntry<String, int>> _rankStrings(Iterable<String> values) {
    final entries = _countStrings(values).entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return entries;
  }
}
