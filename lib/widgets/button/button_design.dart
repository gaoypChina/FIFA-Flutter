import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

buttonDesign({required String title, required Function()? function}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors().greyTransparent,
          borderRadius: const BorderRadius.all(
              Radius.circular(5.0) //                 <--- border radius here
          ),
          border: Border.all(
          width: 1.0,
          color: AppColors().green,
        ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: EstiloTextoBranco.negrito14,
            ),
          ],
        ),
      ),
    ),
  );
}


Widget buttonDesign2({required String title, required Function()? function}){
  return Container(
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
        color: AppColors().greyTransparent,
        border: Border.all(color: AppColors().green, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10))
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: function,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Text(title, style: EstiloTextoBranco.negrito22),
            ],
          ),
        ),
      ),
    ),
  );
}