import 'package:fifa/theme/colors.dart';
import 'package:flutter/material.dart';

List<BoxShadow> boxShadowApp(){
  return [
      BoxShadow(
      color: AppColors().greyTransparent,
      spreadRadius: 4,
      blurRadius: 4,
      offset: const Offset(0, 8), // horizontal, vertical offset
    ),
  ];
}