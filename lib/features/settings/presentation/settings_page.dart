import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import 'package:anivault/core/config/supabase_config.dart';
import 'package:anivault/core/providers.dart';
import 'package:anivault/core/sync/sync_settings.dart';
import 'package:anivault/features/cloud_sync/data/cloud_auth_repository.dart';
import 'package:anivault/features/cloud_sync/presentation/cloud_login_screen.dart';
import 'package:anivault/features/import_export/presentation/import_title_list_page.dart';
import 'package:anivault/features/library/domain/enums.dart';
import 'package:anivault/services/prefs_service.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(prefsServiceProvider);
    final themeMode = ref.watch(themeModeProvider);
    final provider = useState(prefs.aiProvider);
    final apiKeyCtrl = useTextEditingController(text: prefs.apiKey);
    final modelCtrl = useTextEditingController(text: prefs.aiModel);

    return Scaffold(
      appBar: AppBar(title: const Text('Ajustes')),
      body: ListView(
        children: [
          const _SectionHeader('Apariencia'),
          RadioGroup<ThemeMode>(
            groupValue: themeMode,
            onChanged: (m) {
              if (m != null) ref.read(themeModeProvider.notifier).set(m);
            },
            child: const Column(
              children: [
                RadioListTile(
                  value: ThemeMode.system,
                  title: Text('Según el sistema'),
                ),
                RadioListTile(value: ThemeMode.light, title: Text('Claro')),
                RadioListTile(value: ThemeMode.dark, title: Text('Oscuro')),
              ],
            ),
          ),
          const Divider(),
          const _SectionHeader('Asistente IA'),
          ListTile(
            title: const Text('Proveedor'),
            subtitle: Text(provider.value.label),
            trailing: DropdownButton<AiProvider>(
              value: provider.value,
              items: [
                for (final p in AiProvider.values)
                  DropdownMenuItem(value: p, child: Text(p.label)),
              ],
              onChanged: (p) {
                if (p == null) return;
                provider.value = p;
                prefs.setAiProvider(p);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: apiKeyCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'API Key',
                helperText: 'El Chat IA se habilita al configurar la clave.',
              ),
              onChanged: prefs.setApiKey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: modelCtrl,
              decoration: const InputDecoration(labelText: 'Modelo'),
              onChanged: prefs.setAiModel,
            ),
          ),
          if (SupabaseConfig.configurado) ...[
            const Divider(),
            const _SectionHeader('Sincronización'),
            const _SyncTile(),
          ],
          const Divider(),
          const _SectionHeader('Datos'),
          ListTile(
            leading: const Icon(Icons.file_download_outlined),
            title: const Text('Importar biblioteca'),
            subtitle: const Text('Lista de títulos o backup JSON'),
            onTap: () => _showImportOptions(context, ref),
          ),
          ListTile(
            leading: const Icon(Icons.file_upload_outlined),
            title: const Text('Exportar biblioteca'),
            subtitle: const Text('Backup completo en JSON'),
            onTap: () => _exportLibrary(context, ref),
          ),
          ListTile(
            leading: const Icon(Icons.sync),
            title: const Text('Sincronizar biblioteca'),
            subtitle: const Text(
              'Actualiza episodios, estado de emisión y portadas desde AniList',
            ),
            onTap: () => _syncLibrary(context, ref),
          ),
          const ListTile(
            leading: Icon(Icons.notifications_outlined),
            title: Text('Notificaciones'),
            subtitle: Text('Próximos episodios'),
            trailing: Chip(label: Text('Próximamente')),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              'AniVault · v1.2.0',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

Future<void> _showImportOptions(BuildContext context, WidgetRef ref) async {
  final choice = await showModalBottomSheet<String>(
    context: context,
    builder: (ctx) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.checklist_outlined),
            title: const Text('Pegar lista de títulos'),
            subtitle: const Text('Anime, manga, manhwa o manhua'),
            onTap: () => Navigator.of(ctx).pop('titles'),
          ),
          ListTile(
            leading: const Icon(Icons.restore_outlined),
            title: const Text('Restaurar backup (.json)'),
            subtitle: const Text('Un archivo exportado previamente desde AniVault'),
            onTap: () => Navigator.of(ctx).pop('backup'),
          ),
        ],
      ),
    ),
  );
  if (!context.mounted || choice == null) return;

  if (choice == 'titles') {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const ImportTitleListPage(initialType: MediaType.anime),
      ),
    );
    return;
  }

  final path = await showDialog<String>(
    context: context,
    builder: (ctx) {
      final controller = TextEditingController();
      return AlertDialog(
        title: const Text('Restaurar backup'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Ruta del archivo .json',
            hintText: '/storage/emulated/0/Download/anivault_backup_....json',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(controller.text.trim()),
            child: const Text('Restaurar'),
          ),
        ],
      );
    },
  );
  if (!context.mounted || path == null || path.isEmpty) return;

  final messenger = ScaffoldMessenger.of(context);
  try {
    final result = await ref
        .read(libraryBackupServiceProvider)
        .importFromFile(File(path));
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          '${result.added} obras restauradas'
          '${result.skipped > 0 ? ' · ${result.skipped} ya existían' : ''}',
        ),
      ),
    );
  } catch (e) {
    messenger.showSnackBar(SnackBar(content: Text('No se pudo importar: $e')));
  }
}

Future<void> _exportLibrary(BuildContext context, WidgetRef ref) async {
  final messenger = ScaffoldMessenger.of(context);
  try {
    final file = await ref.read(libraryBackupServiceProvider).exportToFile();
    await SharePlus.instance.share(
      ShareParams(files: [XFile(file.path)], text: 'Backup de mi biblioteca AniVault'),
    );
  } catch (e) {
    messenger.showSnackBar(SnackBar(content: Text('No se pudo exportar: $e')));
  }
}

Future<void> _syncLibrary(BuildContext context, WidgetRef ref) async {
  final messenger = ScaffoldMessenger.of(context);
  messenger.showSnackBar(
    const SnackBar(content: Text('Sincronizando biblioteca...')),
  );
  try {
    final result = await ref.read(contentSyncServiceProvider).syncAll();
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          '${result.updated} de ${result.checked} obras actualizadas',
        ),
      ),
    );
  } catch (e) {
    messenger.showSnackBar(SnackBar(content: Text('No se pudo sincronizar: $e')));
  }
}

class _SyncTile extends ConsumerWidget {
  const _SyncTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(cloudCurrentUserProvider);
    final frequency = ref.watch(syncFrequencyProvider);

    if (user == null) {
      return ListTile(
        leading: const Icon(Icons.cloud_outlined),
        title: const Text('Vincular con la nube'),
        subtitle: const Text(
          'Tu biblioteca ya se guarda en este dispositivo; esto agrega '
          'una copia en la nube.',
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const CloudLoginScreen()),
        ),
      );
    }

    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.cloud_done_outlined),
          title: Text(user.email ?? 'Cuenta vinculada'),
          subtitle: const Text('Sync activo'),
          trailing: TextButton(
            onPressed: () => ref.read(cloudAuthRepositoryProvider).signOut(),
            child: const Text('Desvincular'),
          ),
        ),
        ListTile(
          title: const Text('Frecuencia de sync'),
          trailing: DropdownButton<SyncFrequency>(
            value: frequency,
            underline: const SizedBox.shrink(),
            items: SyncFrequency.values
                .map((f) => DropdownMenuItem(value: f, child: Text(f.label)))
                .toList(),
            onChanged: (f) {
              if (f != null) {
                ref.read(syncFrequencyProvider.notifier).setFrequency(f);
              }
            },
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
