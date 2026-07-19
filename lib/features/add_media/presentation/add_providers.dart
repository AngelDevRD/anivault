import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:anivault/core/providers.dart';
import 'package:anivault/features/add_media/domain/media_suggestion.dart';
import 'package:anivault/features/library/domain/enums.dart';

/// Texto de búsqueda actual por tipo (ya con debounce aplicado en la UI).
class AddQueryNotifier extends Notifier<String> {
  AddQueryNotifier(this.type);

  final MediaType type;

  @override
  String build() => '';

  void set(String value) => state = value;
}

final addQueryProvider =
    NotifierProvider.family<AddQueryNotifier, String, MediaType>(
      AddQueryNotifier.new,
    );

/// Resultados de búsqueda para el tipo/consulta actuales.
final addResultsProvider =
    FutureProvider.family<List<MediaSuggestion>, MediaType>((ref, type) async {
      final query = ref.watch(addQueryProvider(type));
      if (query.trim().length < 2) return const [];
      return ref
          .watch(mediaSearchRepositoryProvider)
          .search(query: query, type: type);
    });
