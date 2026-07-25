import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:anivault/core/config/supabase_config.dart';
import 'package:anivault/core/providers.dart';
import 'package:anivault/core/sync/sync_settings.dart';
import 'package:anivault/features/cloud_sync/data/cloud_auth_repository.dart';
import 'package:anivault/features/cloud_sync/presentation/cloud_login_screen.dart';
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
          const ListTile(
            leading: Icon(Icons.file_download_outlined),
            title: Text('Importar biblioteca'),
            subtitle: Text('MyAnimeList, AniList, Kitsu, CSV, JSON'),
            trailing: Chip(label: Text('Próximamente')),
          ),
          const ListTile(
            leading: Icon(Icons.file_upload_outlined),
            title: Text('Exportar biblioteca'),
            subtitle: Text('JSON, CSV, PDF con estadísticas'),
            trailing: Chip(label: Text('Próximamente')),
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
              'AniVault · v1.0.0',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
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
