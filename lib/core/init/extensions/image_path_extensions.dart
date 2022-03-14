import 'package:flutter_svg/svg.dart';

extension ImagePathExtension on String {
  String get toSVG => 'assets/svg/$this.svg';
  String get svgImageAsset => 'assets/images/$this.svg';
  SvgPicture get svgIconAsset => SvgPicture.asset('assets/icons/$this.svg');
}
