import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/dict_keys/player_stats_keys.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/global_variables.dart';

class Grade{

  addMyGameRandomScore(int playerID){
    double randomNum = (Random().nextInt(7)-2)/100; //[-0.02,0.05]
    add(playerID, randomNum);
  }


  simulateGrade(Club clubClass,int jogPOS){
    int playerID = clubClass.escalacao[jogPOS];
    double randomNum = 5+Random().nextInt(40)/10;
    double grade = randomNum;
    if(grade > 10){
      grade = 10;
    }

    if(Semana(semana).isJogoCampeonatoNacional){
      saveNational(playerID, grade);
    }
    if(Semana(semana).isJogoCampeonatoInternacional) {
      saveInternational(playerID, grade);
    }
    if(Semana(semana).isJogoCopa){
      saveCup(playerID, grade);
    }

  }


  int whichPlayer(Club clubClass){
    List escalacao = clubClass.escalacao;
    if(clubClass.index == globalMyClubID) {
      escalacao = globalMyJogadores;
    }

    int probJog = Random().nextInt(11); //Posição do jogador [0-11]
    int playerID = escalacao[probJog];//Posição do jogador [0-11]

    return playerID;
  }


  goalMyMatch(int playerID){
    add(playerID, 1.2);
  }
  assistMyMatch(int playerID){
    add(playerID, 0.75);
  }
  redCardMyMatch(int playerID){
    add(playerID, -1.5);
  }
  yellowCardMyMatch(int playerID){
    add(playerID, -0.5);
  }

  add(int playerID,double value){
    if(playerID>=0) {
      globalJogadoresMatchGrade[playerID] += value;
      if(globalJogadoresMatchGrade[playerID] > 10){
        globalJogadoresMatchGrade[playerID] = 10;
      }
    }
  }

  saveNational(int playerID, double grade){
      int nMatchs = globalLeaguePlayers[PlayerStatsKeys().keyPlayerMatchs]![playerID];
      double total = globalLeaguePlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] * (nMatchs-1).toDouble();
      if(nMatchs>0){
        globalLeaguePlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] = (total + grade)/nMatchs;
      }else{
        globalLeaguePlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] = 0;
      }
  }

  saveInternational(int playerID, double grade){
    int nMatchs = globalInternationalPlayers[PlayerStatsKeys().keyPlayerMatchs]![playerID];
    double total = globalInternationalPlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] * (nMatchs-1).toDouble();
    if(nMatchs>0){
      globalInternationalPlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] = (total + grade)/nMatchs;
    }else{
      globalInternationalPlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] = 0;
    }
  }

  saveCup(int playerID, double grade){
    int nMatchs = globalCupPlayers[PlayerStatsKeys().keyPlayerMatchs]![playerID];
    double total = globalCupPlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] * (nMatchs-1).toDouble();
    if(nMatchs>0){
      globalInternationalPlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] = (total + grade)/nMatchs;
    }else{
      globalInternationalPlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] = 0;
    }
  }

}