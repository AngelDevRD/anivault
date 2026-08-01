import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:anivault/core/providers.dart';
import 'package:anivault/features/import_export/domain/title_list_importer.dart';
import 'package:anivault/features/import_export/presentation/import_review_page.dart';
import 'package:anivault/features/library/domain/enums.dart';

/// Pantalla para importar una biblioteca pegando una lista de títulos (uno
/// por línea). Cada título se busca en AniList/Jikan; los que no matchean
/// se pasan a [ImportReviewPage] para resolverlos manualmente.
class ImportTitleListPage extends HookConsumerWidget {
  const ImportTitleListPage({super.key, required this.initialType});

  final MediaType initialType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = useState(initialType);
    final controller = useTextEditingController();
    final processing = useState(false);
    final progress = useState<(int, int)?>(null);

    Future<void> onImport() async {
      final titles = splitImportedTitles(controller.text);
      if (titles.isEmpty) return;
      processing.value = true;
      progress.value = (0, titles.length);
      final messenger = ScaffoldMessenger.of(context);
      final navigator = Navigator.of(context);
      try {
        final result = await importTitleList(
          titles: titles,
          type: type.value,
          repo: ref.read(mediaSearchRepositoryProvider),
          isar: ref.read(isarServiceProvider),
          onProgress: (done, total) => progress.value = (done, total),
        );
        processing.value = false;
        final parts = <String>[
          '${result.added} agregados con datos completos',
          if (result.duplicated > 0) '${result.duplicated} ya estaban',
          if (result.unmatched.isNotEmpty)
            '${result.unmatched.length} sin match',
        ];
        messenger.showSnackBar(SnackBar(content: Text(parts.join(' · '))));
        if (result.unmatched.isEmpty) {
          navigator.pop();
        } else {
          navigator.pushReplacement(
            MaterialPageRoute(
              builder: (_) => ImportReviewPage(
                titles: result.unmatched,
                type: type.value,
              ),
            ),
          );
        }
      } catch (e) {
        processing.value = false;
        messenger.showSnackBar(SnackBar(content: Text('Error al importar: $e')));
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Importar lista de títulos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pega tu lista con un título por línea. Se buscará cada uno '
              'en AniList/Jikan; los que no se encuentren podrás resolverlos '
              'manualmente al final.',
            ),
            const SizedBox(height: 12),
            DropdownButton<MediaType>(
              value: type.value,
              onChanged: processing.value
                  ? null
                  : (t) {
                      if (t != null) type.value = t;
                    },
              items: [
                for (final t in MediaType.values)
                  DropdownMenuItem(value: t, child: Text(t.label)),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TextField(
                controller: controller,
                enabled: !processing.value,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Akame ga kill\nBoruto\nDr. Stone\n...',
                ),
              ),
            ),
            const SizedBox(height: 12),
            if (processing.value && progress.value != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinearProgressIndicator(
                      value: progress.value!.$2 == 0
                          ? null
                          : progress.value!.$1 / progress.value!.$2,
                    ),
                    const SizedBox(height: 4),
                    Text('Procesando ${progress.value!.$1}/${progress.value!.$2}'),
                  ],
                ),
              ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: processing.value ? null : onImport,
                child: Text(processing.value ? 'Importando...' : 'Importar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
