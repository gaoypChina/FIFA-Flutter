import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/functions/simulate/player_variables/origin/grade.dart';
import 'package:fifa/functions/simulate/player_variables/origin/injury.dart';
import 'package:fifa/functions/simulate/player_variables/origin/red_card.dart';
import 'package:fifa/functions/simulate/player_variables/origin/yellow_card.dart';

import '../../../global_variables.dart';

class CardsInjury{

  setMinus1InjuryRedYellowCardAllTeam(Club clubClass){
    //Para todos os jogadores
    for(int i=0; i<clubClass.nJogadores; i++) {
      int jogadorID = clubClass.jogadores[i];
      if (clubClass.index == globalMyClubID) {
        jogadorID = globalMyJogadores[i];
      }

      //Em qualquer rodada:
      RedCard().minus1(jogadorID);
      YellowCard().minus1(jogadorID);
      Injury().minus1(jogadorID);

    }
  }

  setRedCardsYellowCardsInjury(Club clubClass,bool isMyMatch){
    if(isMyMatch){
      mySimulation(clubClass);
    }else{
      notMySimulation(clubClass);
    }
  }

  //////////////////////////////////////////////////////
  //**Simulação por minuto
  mySimulation(Club clubClass){

    //A qualquer momento pode ter lesão
    Injury().my(clubClass);

    //Ou toma cartão amarelo ou vermelho
    int prob = Random().nextInt(90 * 100);
    if (prob <= 25) {
      RedCard().my(clubClass);
    } else if (prob <= 275) {
      YellowCard().my(clubClass);
    }

  }

  notMySimulation(Club clubClass){

    for (int jogPOS = 0; jogPOS < 11; jogPOS++) {
      //A qualquer momento pode ter lesão
      Injury().notMy(clubClass,jogPOS);
      //Ou toma cartão amarelo ou vermelho
      int prob = Random().nextInt(1100);
      if (prob <= 15) {
        RedCard().notMy(clubClass, jogPOS);
      } else if (prob <= 250) {
        YellowCard().notMy(clubClass,jogPOS);
      }

     Grade().notMy(clubClass, jogPOS);
    }
  }

}
