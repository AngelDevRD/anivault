import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Proveedores de LLM soportados por el Chat IA.
enum AiProvider {
  openRouter,
  ollama;

  String get label => switch (this) {
    AiProvider.openRouter => 'OpenRouter (gratis)',
    AiProvider.ollama => 'Ollama (local)',
  };
}

/// Persistencia de preferencias del usuario (SharedPreferences).
class PrefsService {
  PrefsService(this._prefs);

  final SharedPreferences _prefs;

  static const _kThemeMode = 'theme_mode';
  static const _kAiProvider = 'ai_provider';
  static const _kApiKey = 'ai_api_key';
  static const _kAiModel = 'ai_model';
  static const _kLanguage = 'language';
  static const _kLastContentSyncAt = 'last_content_sync_at';

  static Future<PrefsService> create() async {
    final prefs = await SharedPreferences.getInstance();
    return PrefsService(prefs);
  }

  ThemeMode get themeMode {
    final v = _prefs.getString(_kThemeMode);
    return ThemeMode.values.firstWhere(
      (e) => e.name == v,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) =>
      _prefs.setString(_kThemeMode, mode.name);

  AiProvider get aiProvider {
    final v = _prefs.getString(_kAiProvider);
    return AiProvider.values.firstWhere(
      (e) => e.name == v,
      orElse: () => AiProvider.openRouter,
    );
  }

  Future<void> setAiProvider(AiProvider p) =>
      _prefs.setString(_kAiProvider, p.name);

  String get apiKey => _prefs.getString(_kApiKey) ?? '';
  Future<void> setApiKey(String key) => _prefs.setString(_kApiKey, key);

  /// Modelo por defecto de OpenRouter (gratuito).
  String get aiModel =>
      _prefs.getString(_kAiModel) ?? 'meta-llama/llama-3.1-8b-instruct:free';
  Future<void> setAiModel(String m) => _prefs.setString(_kAiModel, m);

  String get language => _prefs.getString(_kLanguage) ?? 'es';
  Future<void> setLanguage(String l) => _prefs.setString(_kLanguage, l);

  /// El Chat IA solo se habilita si hay clave configurada.
  bool get isAiConfigured => apiKey.trim().isNotEmpty;

  /// Última vez que se sincronizó la biblioteca con AniList (episodios,
  /// estado de emisión, etc.). `null` si nunca se sincronizó.
  DateTime? get lastContentSyncAt {
    final v = _prefs.getString(_kLastContentSyncAt);
    return v == null ? null : DateTime.tryParse(v);
  }

  Future<void> setLastContentSyncAt(DateTime value) =>
      _prefs.setString(_kLastContentSyncAt, value.toIso8601String());
}
