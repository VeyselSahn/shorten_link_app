import 'package:flutter/material.dart';
import 'package:grisoft/core/constant/colors.dart';
import 'dart:ui' as ui;

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = ColorConstants.lightPurple
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
    paint0.shader = ui.Gradient.linear(Offset(size.width * 0.41, size.height * 0.48),
        Offset(size.width * 0.53, size.height * 0.48), [Colors.amber, Colors.white], [0.00, 1.00]);

    Path path0 = Path();
    path0.moveTo(size.width * 0.4111667, size.height * 0.4166667);
    path0.lineTo(size.width * 0.5258333, size.height * 0.4150000);
    path0.lineTo(size.width * 0.5208333, size.height * 0.5516667);
    path0.lineTo(size.width * 0.4730000, size.height * 0.5256667);
    path0.lineTo(size.width * 0.4433333, size.height * 0.5133333);
    path0.lineTo(size.width * 0.4250000, size.height * 0.4833333);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
