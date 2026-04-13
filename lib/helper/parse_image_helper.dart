import 'dart:convert';

List<String> parseImages(dynamic value) {
  if (value == null) return [];

  if (value is List) {
    return List<String>.from(value);
  }

  if (value is String && value.isNotEmpty) {
    try {
      return List<String>.from(jsonDecode(value));
    } catch (_) {
      return [];
    }
  }

  return [];
}
