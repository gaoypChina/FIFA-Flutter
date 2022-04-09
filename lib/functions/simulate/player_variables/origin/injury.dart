import 'dart:math';

import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';

import '../../../../classes/club.dart';

class Injury{

  my(Club clubClass){
    int prob = Random().nextInt(90*100);
    if(prob<=30) {
      int probJog = Random().nextInt(11); //Posição do jogador [0-11]
      int jogadorID = clubClass.escalacao[probJog];//Posição do jogador [0-11]
      int tempoLesao = Random().nextInt(10) + 1;
      globalJogadoresInjury[jogadorID] = tempoLesao;
      globalJogadoresMatchInjury[jogadorID] = tempoLesao;

      customToast('MACHUCADO: ${Jogador(index: jogadorID).name} ');
    }
  }
  notMy(Club clubClass, int jogPOS){

    int prob = Random().nextInt(110);
    if(prob<=3) {
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