import 'package:flutter/material.dart';

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
