import 'dart:math';

import 'package:flutter/material.dart';

class RadialPainter extends CustomPainter {
  final Color bgColor;
  final Color lineColor;
  final double percent;
  final double width;

  RadialPainter(
      {required this.bgColor,
      required this.lineColor,
      required this.percent,
      required this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint bgLine = Paint()
      ..color = bgColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint completeLine = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset _offset = Offset(size.width / 2, size.height / 2); //center
    // print(size);
    // print(size.width);
    // print(size.height);
    // print(min(size.width, size.height));
    double radius = min(size.width / 2, size.height / 2);
    double sweepAngle = pi * 2 * percent;
    canvas.drawCircle(_offset, radius, bgLine);
    canvas.drawArc(Rect.fromCircle(center: _offset, radius: radius), -pi / 2,
        sweepAngle, false, completeLine);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
