import 'package:flutter/material.dart';

class ColorizedImage extends StatelessWidget {
  final String imagePath;
  final Color color;
  final double height;
  final double width;

  const ColorizedImage({Key? key,
    required this.imagePath,
    required this.color,
    required this.height,
    required this.width}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.matrix([
        color.red / 255, 0, 0, 0, 0,
        0, color.green / 255, 0, 0, 0,
        0, 0, color.blue / 255, 0, 0,
        0, 0, 0, color.alpha / 255, 0,
      ]),
      child: Image.asset(imagePath, height: height, width: width, fit: BoxFit.fill,),
    );
  }
}