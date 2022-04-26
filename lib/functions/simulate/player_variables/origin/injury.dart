import 'dart:math';

import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';

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
      int jogadorID = escalacao[probJog];//Posição do jogador [0-11]
      int tempoLesao = Random().nextInt(10) + 1;
      globalJogadoresInjury[jogadorID] = tempoLesao;
      globalJogadoresMatchInjury[jogadorID] = tempoLesao;

      customToast('MACHUCADO: ${Jogador(index: jogadorID).name} ');
    }
  }
  notMy(Club clubClass, int jogPOS){

    int prob = Random().nextInt(110);
    if(prob<=2) {
      int jogadorID = clubClass.escalacao[jogPOS];
      int tempoLesao = Random().nextInt(10) + 1;
      globalJogadoresInjury[jogadorID] = tempoLesao;
    }
  }
  minus1(int jogadorID){
    if(globalJogadoresInjury[jogadorID]>0){
      globalJogadoresInjury[jogadorID]--;
    }
  }
}