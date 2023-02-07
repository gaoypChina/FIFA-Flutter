import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/mundial.dart';
import 'package:fifa/classes/result_game/result_game_internacional.dart';
import 'package:fifa/classes/result_game/result_game_nacional.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/background_color/background_score.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

class ResultMatch{

  late String competitionName;
  bool isAlreadyPlayed = false;
  bool hasAdversary = true;
  bool visitante = false;
  late int weekLocal;
  late int clubID;
  late Club club;
  late String clubName2;
  late int clubID2;
  int gol1 = 0;
  int gol2 = 0;
  int victoryDrawLoss310 = 0;
  String placar = '';
  Color backgroundColor = AppColors().greyTransparent;

  printar(){
    print("WEEK: $weekLocal hasAdversary: $hasAdversary isAlreadyPlayed: $isAlreadyPlayed");
    if(hasAdversary) {
      print("TIME1: ${club.name} TIME2: $clubName2");
    }
  }

  setDefault(int weekLocal){
    this.weekLocal = weekLocal;
    isAlreadyPlayed = false;
    hasAdversary = false;
    competitionName = LeagueOfficialNames().mundial;
  }

  fromResultGameNacional(ResultGameNacional show){
    isAlreadyPlayed = show.isAlreadyPlayed;
    hasAdversary = show.hasAdversary;
    visitante = show.visitante;
    weekLocal = show.weekLocal;
    competitionName = show.competitionName;
    if(hasAdversary) {
      clubID = show.clubID;
      club = show.club;
      clubName2 = show.clubName2;
      clubID2 = show.clubID2;
      gol1 = show.gol1;
      gol2 = show.gol2;
      placar = show.placar;
    }
    victoryDrawLoss310 = show.victoryDrawLoss310;
    backgroundColor = show.backgroundColor;
  }

  fromResultGameInternacional(ResultGameInternacional show){
    isAlreadyPlayed = show.isAlreadyPlayed;
    hasAdversary = show.hasAdversary;
    visitante = show.visitante;
    weekLocal = show.weekLocal;
    competitionName = show.competitionName;
    if(hasAdversary){
      clubID = show.clubID;
      club = show.club;
      clubName2 = show.clubName2;
      clubID2 = show.clubID2;
      gol1 = show.gol1;
      gol2 = show.gol2;
      placar = show.placar;
    }
    victoryDrawLoss310 = show.victoryDrawLoss310;
    backgroundColor = show.backgroundColor;
  }

  fromMundial(int week, Club club, MundialFinal show){
    //TODO: MUDAR ISSO AQUI PRA FICAR QUE NEM NOS OUTROS
    if(week < semanaMundial.first){
      isAlreadyPlayed = false;
    }else{
      isAlreadyPlayed = true;
    }
    if(show.club1.index == club.index || show.club2.index == club.index){
      hasAdversary = true;
    }
    visitante = false;
    weekLocal = semanaMundial.first;
    competitionName = LeagueOfficialNames().mundial;
    if(hasAdversary){
      club = show.club1;
      clubID = show.club1.index;
      clubName2 = show.club2.name;
      clubID2 = show.club2.index;
      gol1 = show.confronto.goal1;
      gol2 = show.confronto.goal2;
      placar = gol1.toString() + ' x '+ gol2.toString();
      victoryDrawLoss310 = getVictoryDrawLoss310(gol1, gol2);
      backgroundColor = colorResultBackground(gol1, gol2);
    }
  }

}