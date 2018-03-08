final RegExp allName = new RegExp(r'^[a-zA-Z0-9_-]+$');
final RegExp outerChars = new RegExp(r'[a-zA-Z0-9]');

String firstChar(String s) => s.substring(0, 1);

String lastChar(String s) =>
    s.isEmpty ? '' : s.substring(s.length - 1, s.length);

bool isValidMember(String name) =>
    name.isNotEmpty &&
    allName.hasMatch(name) &&
    outerChars.hasMatch(firstChar(name)) &&
    outerChars.hasMatch(lastChar(name));

//bool isInvalidMember(String name) => !isValidMember(name);

/// Validate the keys and returns an unmodifiable version of [meta]
Map<String, dynamic> createMeta(Map<String, dynamic> meta) {
  if (meta.isNotEmpty && meta.keys.every(isValidMember)) {
    return new Map<String, dynamic>.unmodifiable(meta);
  }
  throw new ArgumentError('meta');
}
