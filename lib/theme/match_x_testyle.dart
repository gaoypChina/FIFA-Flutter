import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

TextStyle matchStyle1(int goal1, int goal2, double size){
  if(goal1 < goal2){
    return TextStyle(
      fontFamily: 'Roboto',
      color: Colors.grey,
      fontSize: size,
    );
  }else{
    return TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: size,
    );
  }
}

TextStyle matchStyle2(int goal1, int goal2, double size){
  if(goal1 > goal2){
    return TextStyle(
      fontFamily: 'Roboto',
      color: Colors.grey,
      fontSize: size,
    );
  }else{
    return TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: size,
    );
  }
}