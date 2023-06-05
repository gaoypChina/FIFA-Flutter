import 'package:flutter/material.dart';

TextStyle matchStyle1(int goal1, int goal2, double textsize){
  if(goal1 < goal2){
    return TextStyle(
      fontFamily: 'Roboto',
      color: Colors.grey,
      fontSize: textsize,
    );
  }else{
    return TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: textsize,
    );
  }
}

TextStyle matchStyle2(int goal1, int goal2, double textsize){
  if(goal1 > goal2){
    return TextStyle(
      fontFamily: 'Roboto',
      color: Colors.grey,
      fontSize: textsize,
    );
  }else{
    return TextStyle(
      fontFamily: 'Roboto',
      color: Colors.white,
      fontSize: textsize,
    );
  }
}