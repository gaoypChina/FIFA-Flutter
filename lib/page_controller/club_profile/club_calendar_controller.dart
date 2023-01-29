import 'package:fifa/classes/club.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/page_controller/result_game.dart';
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
    if(semanasJogosNacionais.contains(weekToCalculate)){
      competitionName = club.leagueName;
      int rodada = semanasJogosNacionais.indexOf(weekToCalculate)+1;
      ResultGameNacional result = ResultGameNacional(rodadaLocal: rodada, club: club);
      placar = result.placar;
      club2 = Club(index: result.clubID2);
      visitante = result.visitante;
      backgroundColor = result.backgroundColor;
      hasAdversaryDefined = result.hasAdversary;
    }
    else if(semanasJogosInternacionais.contains(weekToCalculate)){
      competitionName = club.internationalLeagueName;
      ResultGameInternacional result = ResultGameInternacional(semanaLocal: rodada, clubID: club.index);
      if(result.isAlreadyPlayed) {
        placar = result.placar;
        club2 = Club(index: result.clubID2);
        visitante = result.visitante;
        backgroundColor = result.backgroundColor;
      }
      hasAdversaryDefined = result.isAlreadyPlayed;
    }
    else if(semanaMundial.contains(weekToCalculate)){
      competitionName = LeagueOfficialNames().mundial;
    }
  }

}
