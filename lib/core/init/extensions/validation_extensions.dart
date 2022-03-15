extension Validation on String {
  bool get isValid {
    RegExp validLinkRules = RegExp(r'^\w+\.com$');

    return validLinkRules.hasMatch(this);
  }
}
