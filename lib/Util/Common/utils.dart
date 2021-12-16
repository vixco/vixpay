///
/// Utilities
///

abstract class ToString {
  Map stringContentMap();

  @override
  String toString() {
    var content = stringContentMap();
    content.removeWhere((_, v) =>
        v == null ||
        (v is num && v == 0) ||
        (v is Iterable && v.isEmpty) ||
        (v is Map && v.isEmpty));
    return '$runtimeType$content';
  }
}