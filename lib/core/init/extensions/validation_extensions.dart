extension Validation on String {
  bool get isValid {
    return Uri.tryParse(this)?.hasAbsolutePath ?? false;
  }
}
