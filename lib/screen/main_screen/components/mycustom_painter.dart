import 'package:flutter/material.dart';
import 'package:grisoft/core/constant/colors.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = ColorConstants.lightPurple
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4591667, 0);
    path0.lineTo(size.width * 0.5316667, size.height * 0.2066667);
    path0.lineTo(size.width * 0.6533333, size.height * 0.4083333);
    path0.lineTo(size.width * 0.8108333, size.height * 0.5516667);
    path0.lineTo(size.width, size.height * 0.5866667);
    path0.lineTo(size.width, 0);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
