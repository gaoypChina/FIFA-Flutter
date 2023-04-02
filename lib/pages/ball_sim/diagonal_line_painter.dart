
import 'dart:math';

import 'package:fifa/pages/ball_sim/physics.dart';
import 'package:flutter/material.dart';

class DiagonalLinePainter extends CustomPainter {
  final Circle circle;
  DiagonalLinePainter({
    required this.circle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double lineLength = 30;
    double xl = lineLength * cos(circle.sightLeftRad) + circle.x;
    double yl = lineLength * sin(circle.sightLeftRad) + circle.y;
    double xr = lineLength * cos(circle.sightRightRad) + circle.x;
    double yr = lineLength * sin(circle.sightRightRad) + circle.y;
    double dx = 10*circle.dx + circle.x;
    double dy = 10*circle.dy + circle.y;
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    Paint paint2 = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 2;

    canvas.drawLine(
        Offset(circle.x, circle.y), Offset(xl, yl), paint);
    canvas.drawLine(
        Offset(circle.x, circle.y), Offset(xr, yr), paint);
    canvas.drawLine(
        Offset(circle.x, circle.y), Offset(dx, dy), paint2);
  }

  @override
  bool shouldRepaint(DiagonalLinePainter oldDelegate) => false;
}
