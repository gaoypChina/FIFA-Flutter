import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/mata_mata/cup_classification.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/classes/mundial.dart';
import 'package:fifa/classes/result_game/result_game_internacional.dart';
import 'package:fifa/classes/result_game/result_game_nacional.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/background_color/background_score.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

class ResultMatch {

  late String competitionName;
  bool isAlreadyPlayed = false;
  bool hasAdversary = true;
  bool visitante = false;
  late int weekLocal;
  late int clubID;
  late Club club;
  late String clubName1;
  late String clubName2;
  late int clubID2;
  int goal1 = -1;
  int goal2 = -1;
  int victoryDrawLoss310 = 0;
  String placar = '';
  Color backgroundColor = AppColors().greyTransparent;

  void printar(){
    print("WEEK: $weekLocal hasAdversary: $hasAdversary isAlreadyPlayed: $isAlreadyPlayed");
    if(hasAdversary) {
      print("TIME1: ${club.name} TIME2: $clubName2");
    }
  }

  void setDefault(int weekLocal){
    this.weekLocal = weekLocal;
    isAlreadyPlayed = false;
    hasAdversary = false;
    competitionName = LeagueOfficialNames().resto;
  }

  void convertResultGames(dynamic show){
    competitionName = show.competitionName;
    weekLocal = show.weekLocal;
    visitante = show.visitante;
    clubID = show.clubID;
    club = show.club;
    clubName1 = show.clubName1;
    clubName2 = show.clubName2;
    clubID2 = show.clubID2;
    goal1 = show.goal1;
    goal2 = show.goal2;
    victoryDrawLoss310 = show.victoryDrawLoss310;
    placar = show.placar;
    backgroundColor = show.backgroundColor;
    hasAdversary = show.hasAdversary;
    isAlreadyPlayed = show.isAlreadyPlayed;
  }

  void getWeekResult(Semana weekLocal, Club club){

    if(weekLocal.isJogoCampeonatoNacional){
      ResultGameNacional show = ResultGameNacional(
          rodadaLocal: weekLocal.rodadaNacional,
          club: club
      );
      if(show.hasAdversary){
        convertResultGames(show);
      }

    }else if(weekLocal.isJogoCopa){
      ResultMatch show = ResultMatch();
      show.fromCopa(weekLocal.week, club);
      if(show.hasAdversary){
        convertResultGames(show);
      }

    }else if(weekLocal.isJogoCampeonatoInternacional || weekLocal.isJogoMataMataInternacional){
      ResultGameInternational show = ResultGameInternational(
          weekLocal: weekLocal.week,
          club: club,
          competitionName: club.internationalLeagueNamePlaying
      );
      if(show.hasAdversary){
        convertResultGames(show);
      }

    }

  }


  void fromMundial(int week, Club club, MundialFinal mundialFinal){

    try {
      mundialFinal.getResults(ano);
      hasAdversary = true;
    }catch(e){
      hasAdversary = false;
    }
    //THE TEAM WILL PLAY THE FINAL?
    if(hasAdversary){
      if(mundialFinal.confronto.clubID1 == club.index) {
        hasAdversary = true;
        club = Club(index: mundialFinal.confronto.clubID1);
        clubID = mundialFinal.confronto.clubID1;
        clubName2 = mundialFinal.confronto.clubName2;
        clubID2 = mundialFinal.confronto.clubID2;
      }else if(mundialFinal.confronto.clubID2 == club.index){
        hasAdversary = true;
        club = Club(index: mundialFinal.confronto.clubID2);
        clubID = mundialFinal.confronto.clubID2;
        clubName2 = mundialFinal.confronto.clubName1;
        clubID2 = mundialFinal.confronto.clubID1;
      }else{
        hasAdversary = false;
      }
    }


    if(week <= semanaMundial.first){
      isAlreadyPlayed = false;
    }else{
      isAlreadyPlayed = true;
    }
    if(isAlreadyPlayed){
      goal1 = mundialFinal.confronto.goal1;
      goal2 = mundialFinal.confronto.goal2;
      placar = goal1.toString() + ' x '+ goal2.toString();
      victoryDrawLoss310 = getVictoryDrawLoss310(goal1, goal2);
      backgroundColor = colorResultBackground(goal1, goal2);
    }

    visitante = false;
    weekLocal = semanaMundial.first;
    competitionName = LeagueOfficialNames().mundial;
  }

  void fromCopa(int week, Club club){

    hasAdversary = false;
    isAlreadyPlayed = false;

    competitionName = getCup(club.leagueName);

    Map match = CupClassification().getClubMatchMap(competitionName, week, club.name);

    if(match.isNotEmpty){
      hasAdversary = true;

      if(match[ResultDict().keyTeamName1] == club.name){
        this.club = club;
        clubName1 = match[ResultDict().keyTeamName1];
        clubID = club.index;

        clubName2 = match[ResultDict().keyTeamName2];
        clubID2 = clubsAllNameList.indexOf(clubName2);

        if(match.containsKey(ResultDict().keyGol1)) {
          goal1 = match[ResultDict().keyGol1];
          goal2 = match[ResultDict().keyGol2];
        }
      }else if(match[ResultDict().keyTeamName2] == club.name){
        clubName1 = match[ResultDict().keyTeamName1];
        clubID = clubsAllNameList.indexOf(clubName1);
        this.club = Club(index: clubID);

        clubName2 = match[ResultDict().keyTeamName2];
        clubID2 = club.index;
        visitante = true;

        if(match.containsKey(ResultDict().keyGol1)) {
          goal1 = match[ResultDict().keyGol1];
          goal2 = match[ResultDict().keyGol2];
        }
      }

      if(match.containsKey(ResultDict().keyGol1)){
        placar = goal1.toString() + ' x '+ goal2.toString();
        victoryDrawLoss310 = getVictoryDrawLoss310(goal1, goal2);
        backgroundColor = colorResultBackground(goal1, goal2);
        isAlreadyPlayed = true;
      }
    }

    weekLocal = week;

  }

  void invertTeams(){
    String aux = clubName1;clubName1 = clubName2;clubName2 = aux;
    int auxInt = clubID;clubID = clubID2;clubID2 = auxInt;
    if(isAlreadyPlayed){
        auxInt = goal1;goal1 = goal2;goal2 = auxInt;
        placar = goal1.toString() + ' x '+ goal2.toString();
        victoryDrawLoss310 = getVictoryDrawLoss310(goal1, goal2);
        backgroundColor = colorResultBackground(goal1, goal2);
    }
  }
}