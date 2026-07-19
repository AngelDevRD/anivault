import 'package:dio/dio.dart';

import 'package:anivault/services/ai/ai_provider.dart';

/// Implementación de [AiProvider] sobre OpenRouter (modelos gratuitos).
class OpenRouterProvider implements AiProvider {
  OpenRouterProvider(this._dio, {required this.apiKey, required this.model});

  final Dio _dio;
  final String apiKey;
  final String model;

  static const _endpoint = 'https://openrouter.ai/api/v1/chat/completions';

  @override
  Future<String> complete({
    required String systemPrompt,
    required String userMessage,
  }) async {
    final res = await _dio.post<Map<String, dynamic>>(
      _endpoint,
      data: {
        'model': model,
        'messages': [
          {'role': 'system', 'content': systemPrompt},
          {'role': 'user', 'content': userMessage},
        ],
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
      ),
    );
    final choices = res.data?['choices'] as List?;
    if (choices == null || choices.isEmpty) {
      throw Exception('OpenRouter: respuesta vacía');
    }
    return (choices.first['message']?['content'] as String?)?.trim() ?? '';
  }
}
