import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget numberCircle(int value, double size){
  return Container(
    height: size,
    width: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors().greyTransparent,
    ),
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Text(
        (value).toString()+"º",
        style: EstiloTextoBranco.text14,
      ),
    ),
  );
}