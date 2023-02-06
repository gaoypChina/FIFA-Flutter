import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/result_game.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

class ClubCalendarController{

  late Club club;
  late String competitionName;
  late Club club2;
  String placar = '';
  Color backgroundColor = AppColors().greyTransparent;
  bool visitante = false;
  bool hasAdversaryDefined = false;

  ClubCalendarController(this.club){
    club2 = club;
  }

  getWeekInfos(int weekToCalculate){
    Semana week = Semana(weekToCalculate);
    if(week.isJogoCampeonatoNacional){
      competitionName = club.leagueName;
      int rodada = Semana(weekToCalculate).rodadaNacional;
      ResultGameNacional result = ResultGameNacional(rodadaLocal: rodada, club: club);
      placar = result.placar;
      club2 = Club(index: result.clubID2);
      visitante = result.visitante;
      backgroundColor = result.backgroundColor;
      hasAdversaryDefined = result.hasAdversary;
    }
    else if(week.isJogoCampeonatoInternacional){
      competitionName = club.internationalLeagueNamePlaying;
      ResultGameInternacional result = ResultGameInternacional(
            semanaLocal: rodada,
            clubID: club.index,
            internationalLeagueName: club.internationalLeagueNamePlaying);
      if(result.isAlreadyPlayed) {
        placar = result.placar;
        club2 = Club(index: result.clubID2);
        visitante = result.visitante;
        backgroundColor = result.backgroundColor;
      }
      hasAdversaryDefined = result.isAlreadyPlayed;
    }
    else if(week.isJogoMundial){
      competitionName = LeagueOfficialNames().mundial;
    }
  }

}
