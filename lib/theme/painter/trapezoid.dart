import 'package:flutter/material.dart';

class TrapezoidPainter extends CustomPainter {
  final double size;
  final Color color;

  TrapezoidPainter({required this.color, required this.size});

  @override
  void paint(Canvas canvas, Size sizes) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Define the vertices of the trapezoid
    Offset topLeft = Offset(size, 0);
    Offset topRight = Offset(3*size, 0);
    Offset bottomRight = Offset(2*size, 3*size);
    Offset bottomLeft = Offset(0*size, 3*size);

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