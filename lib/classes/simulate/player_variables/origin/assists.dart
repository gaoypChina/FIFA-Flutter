import 'dart:math';

import 'package:fifa/classes/player_stats_keys.dart';

import '../../../../classes/club.dart';
import '../../../../global_variables.dart';

class Assists{

  //ASSISTS
  int setAssists(Club clubClass){
    //SETA ASSISTENCIA
    int quemfez = funcQuemfezAssistencia();
    if(quemfez>0) {
      //Se for o meu time
      List escalacao = clubClass.escalacao;
      if(clubClass.index == globalMyClubID) {
        escalacao = globalMyJogadores;
      }
      int playerID = escalacao[quemfez];
      return playerID;
    }
    return -1;
  }
  saveAssistsNational(int playerID){
    if(playerID>=0) {
      globalLeaguePlayers[PlayerStatsKeys().keyPlayerAssists]![playerID]++;
      globalJogadoresCarrerAssists[playerID]++;
    }
  }
  saveAssistsInternational(int playerID){
    if(playerID>=0) {
      globalInternationalPlayers[PlayerStatsKeys().keyPlayerAssists]![playerID]++;
      globalJogadoresCarrerAssists[playerID]++;
    }
  }
  saveAssistsCup(int playerID){
    if(playerID>=0) {
      globalCupPlayers[PlayerStatsKeys().keyPlayerAssists]![playerID]++;
      globalJogadoresCarrerGoals[playerID]++;
    }
  }


  funcQuemfezAssistencia(){
    int prob = Random().nextInt(100);
    if(Random().nextInt(100)<75) { //nem todos gols tem assitencia, 75% tem
      late int quemfez;
      if(prob>80){quemfez=8;}
      else if(prob>59){quemfez=7;}
      else if(prob>47){quemfez=9;}
      else if(prob>35){quemfez=10;}
      else if(prob>25){quemfez=6;}
      else if(prob>15){quemfez=5;}
      else if(prob>11){quemfez=4;}
      else if(prob>7){quemfez=3;}
      else if(prob>3){quemfez=2;}
      else if(prob>=0){quemfez=1;}

      return quemfez;
    }
    return -1;
  }

}