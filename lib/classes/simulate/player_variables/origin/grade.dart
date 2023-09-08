import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/dict_keys/player_stats_keys.dart';
import 'package:fifa/classes/functions/normal_distribution.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/global_variables.dart';

class Grade{

  addMyGameRandomScore(int playerID){
    double randomNum = (Random().nextInt(7)-2)/100; //[-0.02,0.05]
    add(playerID, randomNum);
  }


  simulateGrade(Club clubClass, int jogPOS){
    int playerID = clubClass.escalacao[jogPOS];
    double randomNum = 6 + randomNormal(0, 1);
    double grade = randomNum;
    if(grade > 10){
      grade = 10;
    }

    saveGrade(playerID, grade);
  }

  saveGrade(int playerID, double grade){
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

  double gradesFromGoalsAssists(int playerID){

    double goalsGrade = globalLeaguePlayers[PlayerStatsKeys().keyPlayerGoals]![playerID] * 1.1;
    double assistsGrade = globalLeaguePlayers[PlayerStatsKeys().keyPlayerAssists]![playerID] * 0.75;
    double goalsSofridosGrade = globalLeaguePlayers[PlayerStatsKeys().keyPlayerGolsSofridos]![playerID] * - 0.2;
    double cleanSheetsGrade = globalLeaguePlayers[PlayerStatsKeys().keyPlayerCleanSheets]![playerID] * 1.5;

    return goalsGrade + assistsGrade + goalsSofridosGrade + cleanSheetsGrade;
  }
  getFinalGrade(int playerID, double total, double gradeMatch, int nMatchs){
    total += gradesFromGoalsAssists(playerID);
    double finalGrade = (total + gradeMatch)/nMatchs;
    if(finalGrade > 10){
      finalGrade = 10;
      if(finalGrade > 9 && gradesFromGoalsAssists(playerID) < 1){
        finalGrade = randomNormal(8, 0.4);
      }
    }
    return finalGrade;
  }

  saveNational(int playerID, double gradeMatch){
      int nMatchs = globalLeaguePlayers[PlayerStatsKeys().keyPlayerMatchs]![playerID];
      if(nMatchs>0){
        double total = globalLeaguePlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] * (nMatchs-1).toDouble() ?? 0;
        double finalGrade = getFinalGrade(playerID, total, gradeMatch, nMatchs);
        globalLeaguePlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] = finalGrade;
      }else{
        globalLeaguePlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] = 0;
      }
  }

  saveInternational(int playerID, double gradeMatch){
    int nMatchs = globalInternationalPlayers[PlayerStatsKeys().keyPlayerMatchs]![playerID];
    if(nMatchs>0){
    double total = globalInternationalPlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] * (nMatchs-1).toDouble();
    double finalGrade = getFinalGrade(playerID, total, gradeMatch, nMatchs);
    globalInternationalPlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] = finalGrade;
    }else{
      globalInternationalPlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] = 0;
    }
  }

  saveCup(int playerID, double gradeMatch){
    int nMatchs = globalCupPlayers[PlayerStatsKeys().keyPlayerMatchs]![playerID];
    if(nMatchs>0){
      double total = globalCupPlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] * (nMatchs-1).toDouble();
      double finalGrade = getFinalGrade(playerID, total, gradeMatch, nMatchs);
      globalCupPlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] = finalGrade;
    }else{
      globalCupPlayers[PlayerStatsKeys().keyPlayerGrade]![playerID] = 0;
    }
  }

}