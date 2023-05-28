import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/simulate/player_variables/origin/grade.dart';
import 'package:fifa/global_variables.dart';

import '../../../../classes/club.dart';

class RedCard{

  my(Club clubClass){
    //Se for o meu time
    List escalacao = clubClass.escalacao;
    if(clubClass.index == globalMyClubID) {
      escalacao = globalMyJogadores;
    }

    int probJog = Random().nextInt(11); //Posição do jogador [0-11]
    int playerID = escalacao[probJog];//Posição do jogador [0-11]
    globalJogadoresRedCard[playerID]++;
    globalJogadoresMatchRedCards[playerID]++;

    Grade().redCardMyMatch(playerID);
  }

  notMy(Club clubClass,int jogPOS) {
    int playerID = clubClass.escalacao[jogPOS];
    globalJogadoresRedCard[playerID]++;
  }

  minus1(int playerID){
    if(globalJogadoresRedCard[playerID]>0){
      globalJogadoresRedCard[playerID]--;
    }
  }

}