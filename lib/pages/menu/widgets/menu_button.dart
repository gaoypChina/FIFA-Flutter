import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget wMenuButton(String text, Function() function){
  return  Container(
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: AppColors().greyTransparent,
      border: Border.all(
        width: 2.0,
        color: Colors.green,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: function,
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.text22))),
    ),
  );
}