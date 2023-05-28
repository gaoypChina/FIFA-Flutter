import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/global_variables.dart';

class Grade{

  addMyGameRandomScore(int playerID){
    double randomNum = (Random().nextInt(7)-2)/100; //[-0.02,0.05]
    add(playerID, randomNum);
  }


  notMy(Club clubClass,int jogPOS){
    int playerID = clubClass.escalacao[jogPOS];
    double randomNum = 5+Random().nextInt(40)/10;
    globalJogadoresGrades[playerID] = randomNum;
    if(globalJogadoresMatchGrade[playerID]>10){
      globalJogadoresMatchGrade[playerID] = 10;
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


  reset(){
    globalJogadoresMatchGrade = List.filled(globalMaxPlayersPermitted, 6.0);
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
      if(globalJogadoresMatchGrade[playerID]>10){
        globalJogadoresMatchGrade[playerID] = 10;
      }
    }
  }


}