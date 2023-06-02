import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget ageContainer(int overall,{double size=25,TextStyle style = EstiloTextoPreto.text14}){
  return Container(
    margin: const EdgeInsets.only(right: 4),
    height: size, width: size,
    color: colorAgeBackground(overall),
    child: Center(child: Text(overall.toString(), textAlign:TextAlign.center, style: style)),
  );
}

Color colorAgeBackground(int age){
  Color colorBackground = Colors.green;
  if(age < 20){colorBackground = Colors.blue;}
  else if(age <= 25){colorBackground = Colors.blue.shade200;}
  else if(age <= 30){colorBackground = Colors.red.shade50;}
  else if(age <= 35){colorBackground = Colors.red.shade200;}
  else if(age <= 40){colorBackground = Colors.red.shade400;}
  else{colorBackground = Colors.red;}
  return colorBackground;
}
