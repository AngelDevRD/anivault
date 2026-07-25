/// Credenciales de Supabase inyectadas en build time (AG-CORE-004: las
/// claves nunca van en el código):
///   flutter build apk --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...
///
/// Sin estas variables la app funciona igual, 100% local (Isar) -- el sync
/// en la nube de la biblioteca es opcional (ver core/sync).
abstract final class SupabaseConfig {
  static const url = String.fromEnvironment('SUPABASE_URL');
  static const anonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  static bool get configurado => url.isNotEmpty && anonKey.isNotEmpty;
}
