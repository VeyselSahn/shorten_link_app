import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  Size get deviceSize => MediaQuery.of(this).size;
  double get deviceWidth => deviceSize.width;
  double get deviceHeight => deviceSize.height;

  //customs
  double get customWidth => deviceWidth * .8;
  double get customHeight => deviceHeight * .08;
}
