import 'package:flutter/material.dart';

Color colorResultBackground(int gol1,int gol2){
  late Color backgroundColor;
    if(gol1 < gol2){
      backgroundColor = Colors.red.withOpacity(0.5);
    }else if(gol1 == gol2){
      backgroundColor = Colors.amber.withOpacity(0.5);
    }else if(gol1 > gol2){
      backgroundColor = Colors.green.withOpacity(0.5);
    }
  return backgroundColor;
}

int getVictoryDrawLoss310(int gol1,int gol2){
  late int victoryDrawLoss310;
    if(gol1 < gol2){
      victoryDrawLoss310 = 0;
    }else if(gol1 == gol2){
      victoryDrawLoss310 = 1;
    }else if(gol1 > gol2){
      victoryDrawLoss310 = 3;
    }
  return victoryDrawLoss310;
}