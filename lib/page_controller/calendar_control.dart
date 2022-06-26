import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/chaves.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/functions/mata_mata/mata_mata_class.dart';
import 'package:fifa/page_controller/table/table_matchs_control.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:flutter/material.dart';

import '../global_variables.dart';
import '../classes/league.dart';

class ResultGameNacional{

  bool exists = false;
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
        exists = true;
      }catch(e){
        exists = false;
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

class ResultGameInternacional{

  late int semanaLocal;
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
  bool hasAdversary = false;
  bool isAlreadyPlayed = false;


  ResultGameInternacional({required int semanaLocal, required this.clubID}){

    club = Club(index: clubID);
    String internationalLeague = club.internationalLeagueName;

    //FASE DE GRUPOS
    //Check every group if myTeam Is Playing
    if(semanasGruposInternacionais.contains(semanaLocal)){
      int rodadaNumber = semanasGruposInternacionais.indexOf(semanaLocal);
      for(int groupNumber=0; groupNumber<8; groupNumber++){
        for(int nConfronto=0; nConfronto<2; nConfronto++) {

          MatchResultInternational matchResultInternational = MatchResultInternational(
              rodadaNumber: rodadaNumber,
              groupNumber: groupNumber,
              nConfronto: nConfronto,
              competitionName: internationalLeague);

          isAlreadyPlayed = matchResultInternational.isAlreadyPlayed;

          //SE SOU O TIME 1
          if(matchResultInternational.clubID1 == clubID){
            ifMyTeamIsLocal(matchResultInternational);
          }
          //SE SOU O TIME 2
          if(matchResultInternational.clubID2 == clubID){
            ifMyTeamIsVisitor(matchResultInternational);
          }
        }
      }
    }

    //RESULTADO MATA-MATAS
    else if(semanasMataMataInternacionais.contains(semanaLocal)){
      int idaVolta = 1;
      if(Semana(semanaLocal).isJogoIdaMataMata){
        idaVolta = 0;
      }
      for(int matchRow=0; matchRow<8; matchRow++){
        try{
          MataMata mataMata = MataMata();
          mataMata.getData(internationalLeague, Semana(semanaLocal).semanaStr, matchRow, idaVolta);
          isAlreadyPlayed = mataMata.isAlreadyPlayed;
          if(mataMata.clubID1 == clubID){
            visitante = false;
            clubID2 = mataMata.clubID2;
            clubName2 = Club(index: clubID2).name;
            if(isAlreadyPlayed){
              gol1 = mataMata.goal1;
              gol2 = mataMata.goal2;
            }
            hasAdversary = true;
          }
          if(mataMata.clubID2 == clubID){
            visitante = true;
            clubID2 = mataMata.clubID1;
            clubName2 = Club(index: clubID2).name;
            if(isAlreadyPlayed){
              gol1 = mataMata.goal2;
              gol2 = mataMata.goal1;
            }
            hasAdversary = true;
          }

          if(isAlreadyPlayed){
            placar = gol1.toString() + ' x '+ gol2.toString();
          }else{
            placar = '';
          }

        }catch(e){
          //print('row nao existe');
        }
      }
    }

    if(isAlreadyPlayed) {
      backgroundBasedOnResult(gol1, gol2);
    }

  }

  ifMyTeamIsLocal(MatchResultInternational matchResultInternational){
    visitante = false;
    clubID2 = matchResultInternational.clubID2;
    clubName2 = Club(index: clubID2).name;
    gol1 = matchResultInternational.goals1;
    gol2 = matchResultInternational.goals2;
    hasAdversary = true;
    if(isAlreadyPlayed){
      placar = gol1.toString() + ' x '+ gol2.toString();
    }else{
      placar = '';
    }
  }
  ifMyTeamIsVisitor(MatchResultInternational matchResultInternational){
    visitante = true;
    clubID2 = matchResultInternational.clubID1;
    clubName2 = Club(index: clubID2).name;
    gol1 = matchResultInternational.goals2;
    gol2 = matchResultInternational.goals1;
    hasAdversary = true;
    if(isAlreadyPlayed){
      placar = gol1.toString() + ' x '+ gol2.toString();
    }else{
      placar = '';
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