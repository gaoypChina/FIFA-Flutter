import 'package:fifa/theme/colors.dart';
import 'package:flutter/material.dart';

buttonSquareSelection({required bool conditionWhenTrue, required double height, required double width, required Function()? function}) {
  return InkWell(
    onTap: function,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(6),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: conditionWhenTrue ? Colors.lightGreenAccent : AppColors().greyTransparent,
        border: Border.all(color: conditionWhenTrue ? Colors.black : Colors.lightGreenAccent, width:1),
      ),
      ),
    );
}