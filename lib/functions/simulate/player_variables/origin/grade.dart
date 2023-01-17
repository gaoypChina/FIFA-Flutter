import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/global_variables.dart';

class Grade{

  addMyGameRandomScore(int jogadorID){
    double randomNum = (Random().nextInt(5)-2)/100;
    add(jogadorID, randomNum);
  }

  notMy(Club clubClass,int jogPOS){
    int jogadorID = clubClass.escalacao[jogPOS];
    double randomNum = 5+Random().nextInt(40)/10;
    globalJogadoresGrades[jogadorID] = randomNum;
  }



  int whichPlayer(Club clubClass){
    List escalacao = clubClass.escalacao;
    if(clubClass.index == globalMyClubID) {
      escalacao = globalMyJogadores;
    }

    int probJog = Random().nextInt(11); //Posição do jogador [0-11]
    int jogadorID = escalacao[probJog];//Posição do jogador [0-11]

    return jogadorID;
  }


  reset(){
    globalJogadoresMatchGrade = List.filled(globalMaxPlayersPermitted, 6.0);
  }

  goalMyMatch(int jogadorID){
    add(jogadorID, 1.5);
  }
  assistMyMatch(int jogadorID){
    add(jogadorID, 0.8);
  }
  redCardMyMatch(int jogadorID){
    add(jogadorID, -1.5);
  }
  yellowCardMyMatch(int jogadorID){
    add(jogadorID, -0.5);
  }

  add(int playerID,double value){
    if(playerID>=0) {
      globalJogadoresMatchGrade[playerID] += value;
    }
  }


}