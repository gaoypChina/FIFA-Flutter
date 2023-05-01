import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/cup_classification.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
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


  ResultGameCopa({required this.weekLocal, required this.club, required this.competitionName}){

    Semana weekClass = Semana(weekLocal);
    CupClassification cupClass = CupClassification();
    Map allCupResults = cupClass.getCupPhaseResultsWeek(weekClass.week, competitionName);
    ResultDict result = ResultDict();
    Confronto confronto = result.getConfronto(allCupResults);


    competitionName = club.leagueName;
    visitante = (club.name == confronto.clubName2);
    clubID = club.index;
    clubName2 = confronto.clubName2;
    clubID2 = clubsAllNameList.indexOf(clubName2);
    isAlreadyPlayed = confronto.hasGoals;

    if(!isAlreadyPlayed){
      backgroundColor = Colors.black87;
    }


  }

}