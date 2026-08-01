import 'dart:convert';
import 'dart:io';

import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:anivault/features/import_export/data/media_entry_json.dart';
import 'package:anivault/features/library/data/models/media_entry.dart';
import 'package:anivault/services/isar_service.dart';

/// Resultado de una importación de backup.
class BackupImportResult {
  const BackupImportResult({required this.added, required this.skipped});

  /// Obras nuevas agregadas a la biblioteca.
  final int added;

  /// Obras ya existentes (mismo `uuid`) que se dejaron intactas.
  final int skipped;
}

/// Exporta/importa la biblioteca completa como un único archivo JSON.
class LibraryBackupService {
  LibraryBackupService(this._isar);

  final IsarService _isar;

  /// Vuelca toda la biblioteca a un archivo JSON temporal, listo para
  /// compartir o guardar. El llamador es responsable de compartirlo.
  Future<File> exportToFile() async {
    final entries = await _isar.getAll();
    final payload = {
      'app': 'anivault',
      'version': 1,
      'exportedAt': DateTime.now().toIso8601String(),
      'entries': entries.map((e) => e.toBackupJson()).toList(),
    };
    final dir = await getTemporaryDirectory();
    final stamp = DateTime.now().millisecondsSinceEpoch;
    final file = File('${dir.path}/anivault_backup_$stamp.json');
    return file.writeAsString(jsonEncode(payload));
  }

  /// Importa un backup previamente exportado. Las obras cuyo `uuid` ya
  /// existe en la biblioteca se omiten para no duplicar.
  Future<BackupImportResult> importFromFile(File file) async {
    final content = await file.readAsString();
    final data = jsonDecode(content);
    if (data is! Map<String, dynamic> || data['entries'] is! List) {
      throw const FormatException('El archivo no es un backup válido de AniVault.');
    }
    final rawEntries = (data['entries'] as List).cast<Map<String, dynamic>>();

    var added = 0;
    var skipped = 0;
    for (final json in rawEntries) {
      final entry = mediaEntryFromBackupJson(json);
      final existing = await _isar.isar.mediaEntrys
          .filter()
          .uuidEqualTo(entry.uuid)
          .findFirst();
      if (existing != null) {
        skipped++;
        continue;
      }
      await _isar.upsert(entry);
      added++;
    }
    return BackupImportResult(added: added, skipped: skipped);
  }
}
