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
  late String clubNameAdv;
  late int clubIDAdv;
  int gol1 = 0;
  int golAdv = 0;
  String placar = '';
  Color backgroundColor = Colors.black12;

  ResultGameNacional({required int rodadaLocal, required int clubID}){

    club = Club(index: clubID);
    List list = Chaves().chaveIndexAdvCampeonato(rodadaLocal,club.leagueID, club.getChaveLeague());//index 0-16
    int chaveClubAdv = list[0];
    visitante = list[1];
    League league = League(index: club.leagueID);
    clubNameAdv = league.getClubName(chaveClubAdv);
    clubIDAdv = clubsAllNameList.indexOf(clubNameAdv);

    //SÓ MOSTRA PARA RODADAS QUE JÁ ACONTECERAM
    if(rodadaLocal<rodada || semana >= semanasJogosNacionais[league.nClubs-2]){
      //rodadaLocal começa em 1 por isso subtrai 1

      int chaveClub1 = Chaves().chaveIndexAdvCampeonato(rodadaLocal, club.leagueID, chaveClubAdv)[0];
      try {
        List results = globalHistoricLeagueGoalsAll[rodadaLocal][club.leagueID];
        gol1 = results[chaveClub1];
        golAdv = results[chaveClubAdv];
        placar = gol1.toString() + ' x '+ golAdv.toString();
      }catch(e){
        print("Rodada $rodadaLocal não foi simulada");
      }

      if(gol1 < golAdv){
        backgroundColor = Colors.red;
      }else if(gol1 == golAdv){
        backgroundColor = Colors.amber.withOpacity(0.7);
      }if(gol1 > golAdv){
        backgroundColor = Colors.green;
      }if(placar.isEmpty){
        backgroundColor = Colors.black12;
      }
    }
  }


  }
