import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/chaves.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:flutter/material.dart';

import '../global_variables.dart';
import '../classes/league.dart';

class ResultGameNacional{

  late int rodadaLocal;
  bool visitante = false;
  late int clubID;
  late Club club;
  late String clubName2;
  late int clubID2;
  int gol1 = 0;
  int gol2 = 0;
  int victoryDrawLoss310 = 0;
  String placar = '';
  Color backgroundColor = Colors.black12;

  ResultGameNacional({required int rodadaLocal, required this.clubID}){

    club = Club(index: clubID);
    List list = Chaves().chaveIndexAdvCampeonato(rodadaLocal,club.leagueID, club.getChaveLeague());//index 0-16
    int chaveClub2 = list[0];
    visitante = list[1];
    League league = League(index: club.leagueID);
    clubName2 = league.getClubName(chaveClub2);
    clubID2 = clubsAllNameList.indexOf(clubName2);

    //SÓ MOSTRA PARA RODADAS QUE JÁ ACONTECERAM
    if(rodadaLocal<rodada || semana > semanasJogosNacionais[league.nClubs-2]){
      //rodadaLocal começa em 1 por isso subtrai 1

      int chaveClub1 = Chaves().chaveIndexAdvCampeonato(rodadaLocal, club.leagueID, chaveClub2)[0];
      try {
        List results = globalHistoricLeagueGoalsAll[rodadaLocal][club.leagueID];
        gol1 = results[chaveClub1];
        gol2 = results[chaveClub2];
        placar = gol1.toString() + ' x '+ gol2.toString();
      }catch(e){
        print("Rodada $rodadaLocal não foi simulada");
      }

      backgroundBasedOnResult(gol1,gol2);
    }
  }
  
  backgroundBasedOnResult(int gol1,int gol2){
    if(gol1 < gol2){
      backgroundColor = Colors.red;
      victoryDrawLoss310 = 0;
    }else if(gol1 == gol2){
      backgroundColor = Colors.amber.withOpacity(0.7);
      victoryDrawLoss310 = 1;
    }else if(gol1 > gol2){
      backgroundColor = Colors.green;
      victoryDrawLoss310 = 3;
    }
    if(placar.isEmpty){
      backgroundColor = Colors.black12;
      victoryDrawLoss310 = -1;
    }
  }


  }
