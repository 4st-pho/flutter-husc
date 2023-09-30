extension Charater on String? {
  String getFirstCharacter() {
    return (this ?? '').isNotEmpty ? this![0] : '';
  }
}
