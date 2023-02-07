import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/chaves.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/background_color/background_score.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:flutter/material.dart';

class ResultGameNacional{

  late String competitionName;
  bool isAlreadyPlayed = false;
  bool hasAdversary = true;
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

  printar(){
    print("WEEK: $weekLocal hasAdversary: $hasAdversary isAlreadyPlayed: $isAlreadyPlayed");
    if(hasAdversary) {
      print("TIME1: ${club.name} TIME2: $clubName2");
    }
  }

  ResultGameNacional({required int rodadaLocal, required this.club}){

    competitionName = club.leagueName;
    weekLocal = semanasJogosNacionais[rodadaLocal-1];
    List list = Chaves().chaveIndexAdvCampeonato(weekLocal,club.leagueID, club.getChaveLeague());//index 0-16
    int chaveClub2 = list[0];
    visitante = list[1];
    League league = League(index: club.leagueID);
    clubID = club.index;
    clubName2 = league.getClubName(chaveClub2);
    clubID2 = clubsAllNameList.indexOf(clubName2);

    int rodadaMax = rodada;

    if(weekLocal < semana){
      backgroundColor = Colors.black87;
    }


    //SÓ MOSTRA PARA RODADAS QUE JÁ ACONTECERAM
    if((rodadaLocal<rodadaMax || semana > semanasJogosNacionais[league.nClubs-2])){
      //rodadaLocal começa em 1 por isso subtrai 1

      int chaveClub1 = Chaves().chaveIndexAdvCampeonato(weekLocal, club.leagueID, chaveClub2)[0];
      try {
        List results = globalHistoricLeagueGoalsAll[rodadaLocal][club.leagueID];
        gol1 = results[chaveClub1];
        gol2 = results[chaveClub2];
        placar = gol1.toString() + ' x '+ gol2.toString();
        if(placar.isEmpty){
          backgroundColor = Colors.black12;
          victoryDrawLoss310 = -1;
        }else{
          backgroundColor = colorResultBackground(gol1,gol2);
          victoryDrawLoss310 = getVictoryDrawLoss310(gol1, gol2);
        }
        isAlreadyPlayed = true;
      }catch(e){
        isAlreadyPlayed = false;
        //print("Rodada $rodadaLocal não foi simulada");
      }


    }else{
      isAlreadyPlayed = false;
    }

    if(league.nClubs<=rodadaLocal){
      hasAdversary = false;
    }




  }


  }
