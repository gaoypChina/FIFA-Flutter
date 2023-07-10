import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:flutter/material.dart';

Widget buttonListRow(String title, String typeSelected, Function(String) onTap){
    return PressableButton(
      onTap: (){
        onTap(title);
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        decoration: BoxDecoration(
          color: AppColors().greyTransparent,
          border: Border.all(
            color: typeSelected == title ? AppColors().green : Colors.white,
            width: 1.0,
          ),
        ),
        child: Text(title, style: typeSelected == title ? EstiloTextoVerdee.text16 : EstiloTextoBranco.text16 ),
      ),
    );
  }