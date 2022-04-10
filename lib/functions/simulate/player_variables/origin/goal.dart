import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/global_variables.dart';

class Goal{
  //GOALS
  int setGoals(Club clubClass){
    int quemfez = funcQuemfezgol();
    //Se for a minha simulação
    //Se o jogador escolhido estiver machucado ou com cartão vermelho, entao escolhe outro jogador
    if(clubClass.index == globalMyClubID) {
      if (globalJogadoresMatchRedCards[quemfez] > 0 && globalJogadoresMatchInjury[quemfez] > 0) {
        quemfez = funcQuemfezgol();
      }
    }
    int jogadorID=clubClass.escalacao[quemfez];
    return jogadorID;
  }

  saveGoalsNational(int jogadorID){
    globalJogadoresLeagueGoals[jogadorID]++;
    globalJogadoresCarrerGoals[jogadorID]++;
  }

  saveGoalsInternational(int jogadorID){
    globalJogadoresInternationalGoals[jogadorID]++;
    globalJogadoresCarrerGoals[jogadorID]++;
  }

  int funcQuemfezgol(){
    int prob = Random().nextInt(100);
    late int quemfez;
    if(prob>75){quemfez=10;}
    else if(prob>50){quemfez=9;}
    else if(prob>40){quemfez=8;}
    else if(prob>30){quemfez=7;}
    else if(prob>20){quemfez=6;}
    else if(prob>15){quemfez=5;}
    else if(prob>11){quemfez=4;}
    else if(prob>7){quemfez=3;}
    else if(prob>3){quemfez=2;}
    else if(prob>=0){quemfez=1;}

    return quemfez;
  }
}
