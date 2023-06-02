import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget ovrContainer(int overall,{double size=25,TextStyle style = EstiloTextoPreto.text14}){
  return Container(
    margin: const EdgeInsets.only(right: 4),
    height: size, width: size,
    color: colorOverallBackground(overall),
    child: Center(child: Text(overall.toString(), textAlign:TextAlign.center, style: style)),
  );
}

Color colorOverallBackground(int overall){
  Color backgroundOverallColor = Colors.transparent;
  if(overall <= 70){backgroundOverallColor = Colors.white70;}
  if(overall >= 70){backgroundOverallColor = Colors.lightBlueAccent.withOpacity(0.5);}
  if(overall >= 75){backgroundOverallColor = Colors.blue;}
  if(overall >= 80){backgroundOverallColor = Colors.yellowAccent.withOpacity(0.4);}
  if(overall >= 85){backgroundOverallColor = Colors.yellow;}
  return backgroundOverallColor;
}
