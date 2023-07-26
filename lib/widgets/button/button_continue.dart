import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

customButtonContinue({required String title, required Function()? function}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: function,
      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: const BorderRadius.all(
              Radius.circular(10.0) //                 <--- border radius here
          ),
          border:  Border.all(color: AppColors().green, width:1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: EstiloTextoBranco.negrito22,
            ),
          ],
        ),
      ),
    ),
  );
}