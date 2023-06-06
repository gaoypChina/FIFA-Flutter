import 'package:fifa/theme/colors.dart';
import 'package:flutter/material.dart';

buttonSquareSelection({required Color primaryColor, required Color secondColor, required bool conditionWhenTrue, required double height, required double width, required Function()? function}) {
  return InkWell(
    onTap: function,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(6),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: conditionWhenTrue ? primaryColor : AppColors().greyTransparent,
        border: Border.all(color: conditionWhenTrue ? secondColor : primaryColor, width:1),
      ),
      ),
    );
}