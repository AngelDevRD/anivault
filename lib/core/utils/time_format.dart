/// Utilidades de conversión de tiempo consumido (en minutos) a distintas
/// unidades. Toda la matemática de estadísticas vive en Dart (nunca en la IA).
class TimeBreakdown {
  const TimeBreakdown(this.totalMinutes);

  final int totalMinutes;

  double get hours => totalMinutes / 60;
  double get days => totalMinutes / (60 * 24);
  double get weeks => totalMinutes / (60 * 24 * 7);
  double get months => totalMinutes / (60 * 24 * 30);
  double get years => totalMinutes / (60 * 24 * 365);

  /// Cadena compacta legible, p. ej. "3d 5h" o "12h 30m".
  String get compact {
    final d = totalMinutes ~/ (60 * 24);
    final h = (totalMinutes % (60 * 24)) ~/ 60;
    final m = totalMinutes % 60;
    if (d > 0) return '${d}d ${h}h';
    if (h > 0) return '${h}h ${m}m';
    return '${m}m';
  }
}

extension NumberFormatX on num {
  /// Redondea a [digits] decimales y elimina ceros sobrantes: 3.0 -> "3".
  String toTrimmed([int digits = 1]) {
    final s = toStringAsFixed(digits);
    if (s.contains('.')) {
      return s.replaceFirst(RegExp(r'\.?0+$'), '');
    }
    return s;
  }
}
