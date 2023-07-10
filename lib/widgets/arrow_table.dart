import 'package:flutter/material.dart';

class ArrowSquarePainter extends CustomPainter {
  final Color colorArrow;

  const ArrowSquarePainter({required this.colorArrow});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colorArrow
      ..style = PaintingStyle.fill;

    double maxHeight =  size.height*1.2;
    final arrowPath = Path();
    arrowPath.moveTo(size.width*0.9, 0);
    arrowPath.lineTo(size.width*1, maxHeight/2);
    arrowPath.lineTo(size.width*0.9, maxHeight);
    arrowPath.close();

    final squarePath = Path();
    squarePath.addRect(Rect.fromLTRB(
      0,
      (size.height-maxHeight)/2,
      size.width*0.9,
      maxHeight,
    ));

    canvas.drawPath(squarePath, paint);
    canvas.drawPath(arrowPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}