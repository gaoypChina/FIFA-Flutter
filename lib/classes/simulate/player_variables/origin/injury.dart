import 'dart:math';

import 'package:fifa/global_variables.dart';

import '../../../../classes/club.dart';

class Injury{

  my(Club clubClass){
    int prob = Random().nextInt(90*100);
    //Se for o meu time
    List escalacao = clubClass.escalacao;
    if(clubClass.index == globalMyClubID) {
      escalacao = globalMyJogadores;
    }

    if(prob<=20) {
      int probJog = Random().nextInt(11); //Posição do jogador [0-11]
      int playerID = escalacao[probJog];//Posição do jogador [0-11]
      int tempoLesao = Random().nextInt(10) + 1;
      globalJogadoresInjury[playerID] = tempoLesao;
      globalJogadoresMatchInjury[playerID] = tempoLesao;
    }
  }
  notMy(Club clubClass, int jogPOS){

    int prob = Random().nextInt(110);
    if(prob<=2) {
      int playerID = clubClass.escalacao[jogPOS];
      int tempoLesao = Random().nextInt(10) + 1;
      globalJogadoresInjury[playerID] = tempoLesao;
    }
  }
  minus1(int playerID){
    if(globalJogadoresInjury[playerID]>0){
      globalJogadoresInjury[playerID]--;
    }
  }
}