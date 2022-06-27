import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

buttonDesign({required String title, required Function()? function}) {
  return InkWell(
    onTap: function,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors().greyTransparent,
        borderRadius: const BorderRadius.all(
            Radius.circular(5.0) //                 <--- border radius here
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: EstiloTextoBranco.text16,
          ),
        ],
      ),
    ),
  );
}