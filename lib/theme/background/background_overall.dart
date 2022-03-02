import 'package:flutter/material.dart';

Color colorOverallBackground(int overall){
  Color backgroundOverallColor = Colors.transparent;
  if(overall <= 70){backgroundOverallColor = Colors.white70;}
  if(overall >= 70){backgroundOverallColor = Colors.lightBlueAccent.withOpacity(0.5);}
  if(overall >= 75){backgroundOverallColor = Colors.blue;}
  if(overall >= 80){backgroundOverallColor = Colors.yellowAccent.withOpacity(0.4);}
  if(overall >= 85){backgroundOverallColor = Colors.yellow;}
  return backgroundOverallColor;
}
