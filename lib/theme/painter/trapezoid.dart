import 'package:flutter/material.dart';

class TrapezoidPainter extends CustomPainter {
  final double sizeObject;
  final Color color;

  TrapezoidPainter({required this.color, required this.sizeObject});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Define the vertices of the trapezoid
    Offset topLeft = Offset(sizeObject, 0);
    Offset topRight = Offset(3*sizeObject, 0);
    Offset bottomRight = Offset(2*sizeObject, 3*sizeObject);
    Offset bottomLeft = Offset(0*sizeObject, 3*sizeObject);

    // Draw the lines connecting the vertices
    Path path = Path()
      ..moveTo(topLeft.dx, topLeft.dy)
      ..lineTo(topRight.dx, topRight.dy)
      ..lineTo(bottomRight.dx, bottomRight.dy)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..close();

    // Draw the filled trapezoid shape
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}