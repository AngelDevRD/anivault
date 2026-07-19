/// Rol de un mensaje dentro de la conversación del Chat IA.
enum ChatRole { user, assistant }

/// Mensaje individual del Chat IA. Vive solo en memoria (no se persiste
/// en Fase 2; el historial de chat no forma parte del alcance del MVP).
class ChatMessage {
  const ChatMessage({
    required this.role,
    required this.text,
    this.isError = false,
  });

  final ChatRole role;
  final String text;
  final bool isError;
}
