import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/mata_mata/cup_classification.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/classes/mundial.dart';
import 'package:fifa/classes/result_game/result_game_internacional.dart';
import 'package:fifa/classes/result_game/result_game_nacional.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/background_color/background_score.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
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
    competitionName = LeagueOfficialNames().resto;
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

  fromMundial(int week, Club club, MundialFinal mundialFinal){

    //THE TEAM WILL PLAY THE FINAL?
    if(mundialFinal.club1.index == club.index) {
      hasAdversary = true;
      club = mundialFinal.club1;
      clubID = mundialFinal.club1.index;
      clubName2 = mundialFinal.club2.name;
      clubID2 = mundialFinal.club2.index;
    }else if(mundialFinal.club2.index == club.index){
      hasAdversary = true;
      club = mundialFinal.club2;
      clubID = mundialFinal.club2.index;
      clubName2 = mundialFinal.club1.name;
      clubID2 = mundialFinal.club1.index;
    }else{
      hasAdversary = false;
    }


    if(week <= semanaMundial.first){
      isAlreadyPlayed = false;
    }else{
      isAlreadyPlayed = true;
    }
    if(isAlreadyPlayed){
      gol1 = mundialFinal.confronto.goal1;
      gol2 = mundialFinal.confronto.goal2;
      placar = gol1.toString() + ' x '+ gol2.toString();
      victoryDrawLoss310 = getVictoryDrawLoss310(gol1, gol2);
      backgroundColor = colorResultBackground(gol1, gol2);
    }

    visitante = false;
    weekLocal = semanaMundial.first;
    competitionName = LeagueOfficialNames().mundial;
  }

  fromCopa(int week, Club club){

    hasAdversary = false;
    isAlreadyPlayed = false;

    competitionName = getCup(club.leagueName);

    Map match = CupClassification().getClubMatchMap(competitionName, week, club.name);

    if(match.isNotEmpty){
      hasAdversary = true;

      if(match[ResultDict().keyTeamName1] == club.name){
        club = club;
        clubID = club.index;
        clubName2 = match[ResultDict().keyTeamName2];
        clubID2 = clubsAllNameList.indexOf(clubName2);

        if(match.containsKey(ResultDict().keyGol1)) {
          gol1 = match[ResultDict().keyGol1];
          gol2 = match[ResultDict().keyGol2];
        }
      }else if(match[ResultDict().keyTeamName2] == club.name){
        String clubName = match[ResultDict().keyTeamName1];
        clubID = clubsAllNameList.indexOf(clubName);
        club = Club(index: clubID);
        clubName2 = club.name;
        clubID2 = club.index;
        visitante = true;
        if(match.containsKey(ResultDict().keyGol1)) {
          gol1 = match[ResultDict().keyGol2];
          gol2 = match[ResultDict().keyGol1];
        }
      }

      if(match.containsKey(ResultDict().keyGol1)){
        placar = gol1.toString() + ' x '+ gol2.toString();
        victoryDrawLoss310 = getVictoryDrawLoss310(gol1, gol2);
        backgroundColor = colorResultBackground(gol1, gol2);
        isAlreadyPlayed = true;
      }
    }

    weekLocal = week;

  }
}