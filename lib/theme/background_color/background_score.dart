import 'package:flutter/material.dart';

Color colorResultBackground(int goal1,int goal2){
  late Color backgroundColor;
    if(goal1 < goal2){
      backgroundColor = Colors.red.withOpacity(0.5);
    }else if(goal1 == goal2){
      backgroundColor = Colors.amber.withOpacity(0.5);
    }else if(goal1 > goal2){
      backgroundColor = Colors.green.withOpacity(0.5);
    }
  return backgroundColor;
}

int getVictoryDrawLoss310(int goal1,int goal2){
  late int victoryDrawLoss310;
    if(goal1 < goal2){
      victoryDrawLoss310 = 0;
    }else if(goal1 == goal2){
      victoryDrawLoss310 = 1;
    }else if(goal1 > goal2){
      victoryDrawLoss310 = 3;
    }
  return victoryDrawLoss310;
}