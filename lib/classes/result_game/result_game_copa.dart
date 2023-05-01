import 'package:fifa/classes/club.dart';
import 'package:fifa/theme/colors.dart';
import 'package:flutter/material.dart';

class ResultGameCopa{

  late String competitionName;
  late int weekLocal;
  bool visitante = false;
  late int clubID;
  late Club club;
  late String clubName2;
  late int clubID2;
  int gol1 = 0;
  int gol2 = 0;
  int victoryDrawLoss310 = 0;
  String placar = '';
  Color backgroundColor = AppColors().greyTransparent;
  bool hasAdversary = false;
  bool isAlreadyPlayed = false;

  printar(){
    print("WEEK: $weekLocal hasAdversary: $hasAdversary isAlreadyPlayed: $isAlreadyPlayed");
    if(hasAdversary) {
      print("TIME1: ${club.name} TIME2: $clubName2");
    }
  }


}