extension Validation on String {
  bool get isValid {
    RegExp linkRuler = RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    return linkRuler.hasMatch(this);
  }
}
