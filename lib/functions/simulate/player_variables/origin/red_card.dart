import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/functions/simulate/player_variables/origin/grade.dart';
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
    int jogadorID = escalacao[probJog];//Posição do jogador [0-11]
    globalJogadoresRedCard[jogadorID]++;
    globalJogadoresMatchRedCards[jogadorID]++;

    Grade().redCardMyMatch(jogadorID);
  }

  notMy(Club clubClass,int jogPOS) {
    int jogadorID = clubClass.escalacao[jogPOS];
    globalJogadoresRedCard[jogadorID]++;
  }

  minus1(int jogadorID){
    if(globalJogadoresRedCard[jogadorID]>0){
      globalJogadoresRedCard[jogadorID]--;
    }
  }

}