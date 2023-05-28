import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/simulate/player_variables/origin/grade.dart';
import 'package:fifa/global_variables.dart';

import '../../../../global_variables.dart';

class YellowCard{
  my(Club clubClass){
    //Se for o meu time
    List escalacao = clubClass.escalacao;
    if(clubClass.index == globalMyClubID) {
      escalacao = globalMyJogadores;
    }

    int probJog = Random().nextInt(11); //Posição do jogador [0-11]
    int playerID = escalacao[probJog]; //Posição do jogador [0-11]
    globalJogadoresYellowCard[playerID]++;
    globalJogadoresMatchYellowCards[playerID]++;

    Grade().yellowCardMyMatch(playerID);

  }
  notMy(Club clubClass, int jogPOS) {
    int playerID = clubClass.escalacao[jogPOS];
    globalJogadoresYellowCard[playerID]++;
  }
  minus1(int playerID){
    if(globalJogadoresYellowCard[playerID]>0){
      globalJogadoresYellowCard[playerID]--;
    }
  }
}