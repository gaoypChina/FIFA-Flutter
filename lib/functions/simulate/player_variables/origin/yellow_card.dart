import 'dart:math';

import 'package:fifa/classes/club.dart';
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
    int jogadorID = escalacao[probJog]; //Posição do jogador [0-11]
    globalJogadoresYellowCard[jogadorID]++;
    globalJogadoresMatchYellowCards[jogadorID]++;

  }
  notMy(Club clubClass, int jogPOS) {
    int jogadorID = clubClass.escalacao[jogPOS];
    globalJogadoresYellowCard[jogadorID]++;
  }
  minus1(int jogadorID){
    if(globalJogadoresYellowCard[jogadorID]>0){
      globalJogadoresYellowCard[jogadorID]--;
    }
  }
}