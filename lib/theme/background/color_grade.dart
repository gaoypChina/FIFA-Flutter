import 'package:flutter/material.dart';

Color colorAgeBackground(double grade){
  Color colorBackground = Colors.green;
  if(grade < 5.0){colorBackground = Colors.red;}
  else if(grade <= 6.0){colorBackground = Colors.red.shade400;}
  else if(grade <= 7.0){colorBackground = Colors.red.shade50;}
  else if(grade <= 8.0){colorBackground = Colors.greenAccent.shade200;}
  else if(grade <= 9.0){colorBackground = Colors.green.shade400;}
  else{colorBackground = Colors.green;}
  return colorBackground;
}