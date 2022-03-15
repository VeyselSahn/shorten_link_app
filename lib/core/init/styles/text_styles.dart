import 'package:flutter/material.dart';

class TextStyles {
  static final instance = TextStyles();
  var titleBold = const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20);
  var shortenButton = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);

  var other = TextStyle(fontSize: 17, color: Colors.grey.shade800, fontWeight: FontWeight.w500);
}
