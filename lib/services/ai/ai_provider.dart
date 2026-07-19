/// Contrato común para cualquier proveedor de LLM del Chat IA.
///
/// El resto de la app nunca debe conocer el proveedor concreto: solo
/// interactúa con esta interfaz. Nuevos proveedores (Ollama, Gemini, etc.)
/// se agregan implementándola, sin tocar el resto del código.
abstract class AiProvider {
  /// Envía el prompt (ya construido con el contexto de la biblioteca —
  /// la IA nunca calcula, solo redacta a partir de datos ya computados por
  /// StatsEngine) y devuelve la respuesta en texto.
  Future<String> complete({
    required String systemPrompt,
    required String userMessage,
  });
}
