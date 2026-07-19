import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anivault/core/providers.dart';
import 'package:anivault/core/statistics/stats_engine.dart';
import 'package:anivault/features/chat_ai/domain/ai_context_builder.dart';
import 'package:anivault/features/chat_ai/domain/chat_message.dart';
import 'package:anivault/services/ai/ai_provider.dart';
import 'package:anivault/services/ai/openrouter_provider.dart';
import 'package:anivault/services/prefs_service.dart';

/// Instancia del proveedor de IA configurado en Ajustes. `null` si no hay
/// clave configurada (Chat IA deshabilitado) o el proveedor no está
/// implementado todavía (p. ej. Ollama).
final aiProviderInstanceProvider = Provider<AiProvider?>((ref) {
  final prefs = ref.watch(prefsServiceProvider);
  if (!prefs.isAiConfigured) return null;
  return switch (prefs.aiProvider) {
    AiProvider.openRouter => OpenRouterProvider(
      ref.watch(dioProvider),
      apiKey: prefs.apiKey,
      model: prefs.aiModel,
    ),
    AiProvider.ollama => null,
  };
});

/// Conversación del Chat IA. Vive en memoria; se reinicia entre sesiones.
class ChatNotifier extends Notifier<List<ChatMessage>> {
  @override
  List<ChatMessage> build() => const [];

  Future<void> send(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;

    state = [...state, ChatMessage(role: ChatRole.user, text: trimmed)];

    final aiProvider = ref.read(aiProviderInstanceProvider);
    if (aiProvider == null) {
      state = [
        ...state,
        const ChatMessage(
          role: ChatRole.assistant,
          isError: true,
          text:
              'Configura tu proveedor de IA y API key en Ajustes '
              'para usar el Chat.',
        ),
      ];
      return;
    }

    try {
      final isar = ref.read(isarServiceProvider);
      final all = await isar.getAll();
      final stats = const StatsEngine().compute(all);
      final systemPrompt = const AiContextBuilder().buildSystemPrompt(
        stats,
        all,
      );
      final reply = await aiProvider.complete(
        systemPrompt: systemPrompt,
        userMessage: trimmed,
      );
      state = [
        ...state,
        ChatMessage(
          role: ChatRole.assistant,
          text: reply.isEmpty
              ? 'No obtuve respuesta, intenta de nuevo.'
              : reply,
        ),
      ];
    } catch (e) {
      state = [
        ...state,
        ChatMessage(
          role: ChatRole.assistant,
          isError: true,
          text: 'Error al consultar la IA: $e',
        ),
      ];
    }
  }

  void clear() => state = const [];
}

final chatProvider = NotifierProvider<ChatNotifier, List<ChatMessage>>(
  ChatNotifier.new,
);
