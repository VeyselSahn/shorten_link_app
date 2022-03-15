import 'package:flutter/material.dart';
import 'package:grisoft/core/constant/colors.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = ColorConstants.lightPurple
      ..style = PaintingStyle.fill
      ..strokeWidth = 6.99;

    Path path0 = Path();
    path0.moveTo(size.width * 0.5416667, 0);
    path0.lineTo(size.width * 0.9983333, size.height * 0.0016667);
    path0.lineTo(size.width, size.height * 0.4716667);
    path0.lineTo(size.width * 0.8558333, size.height * 0.4466667);
    path0.lineTo(size.width * 0.6216667, size.height * 0.2183333);
    path0.lineTo(size.width * 0.5416667, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
