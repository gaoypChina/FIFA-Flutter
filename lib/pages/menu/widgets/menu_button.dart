import 'package:fifa/classes/club.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget wMenuButton(String text, Club club, Function() function){
  return  Container(
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: club.colors.primaryColor.withOpacity(0.4),
      border: Border.all(
        width: 2.0,
        color: club.colors.secondColor,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: function,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.text22))),
    ),
  );
}