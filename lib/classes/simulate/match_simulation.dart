import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/historic/total_victories.dart';
import 'package:fifa/classes/mata_mata/mata_mata_simulation.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/simulate/player_variables/cards_injury_selection.dart';
import 'package:fifa/classes/simulate/after_simulation/set_points.dart';
import 'package:fifa/classes/simulate/player_variables/match_selection.dart';
import 'package:fifa/classes/simulate/player_variables/origin/grade.dart';
import 'package:fifa/classes/simulate/player_variables/update_player_variables.dart';
import 'package:fifa/global_variables.dart';


class MatchSimulation{

  late int variableGol1;
  late int variableGol2;

  printar(Club clubClass1,Club clubClass2){
    print("TIME1: ${clubClass1.name} TIME2 ${clubClass1.name}");
  }

  MatchSimulation(Club clubClass1,Club clubClass2){

    Grade().reset();

    //REMOVE (-1) CARTOES AMARELOS E VERMELHOS E LESOES
    CardsInjury().setMinus1InjuryRedYellowCardAllTeam(clubClass1);
    CardsInjury().setMinus1InjuryRedYellowCardAllTeam(clubClass2);

    matchSimulationResult(clubClass1,clubClass2);

    matchSimulationAfter(clubClass1,clubClass2);

  }

  ///////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////
  matchSimulationResult(Club clubClass1, Club clubClass2){

    //PLACAR DO JOGO
    double ovr1 = clubClass1.getOverall();
    double ovr2 = clubClass2.getOverall();
    List goalsList = result(ovr1,ovr2);
    variableGol1 = goalsList.first;
    variableGol2 = goalsList.last;

    //Salva no historico do treinador se eu simulo a partida
    if(clubClass1.name == My().clubName){
      if(variableGol1>variableGol2){
        TotalVictories().add1Victory();
      }
      if(variableGol1==variableGol2){
        TotalVictories().add1Draw();
      }
      if(variableGol1<variableGol2){
        TotalVictories().add1Loss();
      }
    }
    if(clubClass2.name == My().clubName){
      if(variableGol2>variableGol1){
        TotalVictories().add1Victory();
      }
      if(variableGol2==variableGol1){
        TotalVictories().add1Draw();
      }
      if(variableGol2<variableGol1){
        TotalVictories().add1Loss();
      }
    }

    //SETA JOGADORES
    for(int i=0; i<variableGol1; i++){
      UpdatePlayerVariable().setGoalAndAssists(clubClass1);
    }
    for(int i=0; i<variableGol2; i++){
      UpdatePlayerVariable().setGoalAndAssists(clubClass2);
    }

  }

  matchSimulationAfter(Club clubClass1,Club clubClass2){
    //SAVE GOALS TAKEN OR CLEAN SHEETS
    UpdatePlayerVariable().setGoalkeeperStats(clubClass1, variableGol2);
    UpdatePlayerVariable().setGoalkeeperStats(clubClass2, variableGol1);

    //+1 Match
    UpdatePlayerVariableMatch().update(clubClass1);
    UpdatePlayerVariableMatch().update(clubClass2);

    //RED CARDS, YELLOW CARDS, INJURY
    UpdatePlayerVariable().setCardsInjuryUpdate(clubClass1,false);
    UpdatePlayerVariable().setCardsInjuryUpdate(clubClass2,false);

    //Reorganiza os melhores jogadores da posição;
    clubClass1.optimizeBestSquadClub();
    clubClass2.optimizeBestSquadClub();

    //SOMA OS PONTOS
    SetPoints().set(clubClass1.index,clubClass2.index,variableGol1,variableGol2);

    //Se for mata-mata
    if(Semana(semana).isJogoMataMataInternacional){
      MataMataSimulation().setGoals(clubClass1.index, clubClass2.index, variableGol1, variableGol2);
    }

  }


  List result(double ovr1, double ovr2){

    // Média de Gols por jogo
    late double probGol1, probGol2;
    if(ovr1 > ovr2+10){probGol1 = 3.5;probGol2 = 1.8;}
    else if(ovr1 > ovr2+7){probGol1 = 3.3;probGol2 = 2.0;}
    else if(ovr1 > ovr2+5){probGol1 = 3.2;probGol2 = 2.15;}
    else if(ovr1 > ovr2+4){probGol1 = 3.1;probGol2 = 2.3;}
    else if(ovr1 > ovr2+3){probGol1 = 3.0;probGol2 = 2.4;}
    else if(ovr1 > ovr2+2){probGol1 = 2.9;probGol2 = 2.5;}
    else if(ovr1 > ovr2+1){probGol1 = 2.8;probGol2 = 2.6;}

    else if(ovr1 > ovr2)  {probGol1 = 2.7;probGol2 = 2.7;}

    else if(ovr1 > ovr2-1){probGol1 = 2.6;probGol2 = 2.8;}
    else if(ovr1 > ovr2-2){probGol1 = 2.5;probGol2 = 2.9;}
    else if(ovr1 > ovr2-3){probGol1 = 2.4;probGol2 = 3.0;}
    else if(ovr1 > ovr2-4){probGol1 = 2.3;probGol2 = 3.1;}
    else if(ovr1 > ovr2-5){probGol1 = 2.15;probGol2 = 3.2;}
    else if(ovr1 > ovr2-7){probGol1 = 2.0;probGol2 = 3.3;}
    else if(ovr1 <= ovr2-7){probGol1 = 1.8;probGol2 = 3.5;}
    //FATOR CASA
    if(ovr1 > ovr2){
      probGol1 *= 1.2;
      probGol2 *= 0.9;
    }

    int golTime1 = 0;
    int golTime2 = 0;
    //Vitória time 1
    //Chance de gol a cada 10 min
    for(int i=0; i<10; i++){

      probGol1 = (probGol1/9) * 12;
      probGol2 = (probGol2/9) * 12;


      int value1 = Random().nextInt(100);
      if(value1 < probGol1){
        golTime1 += 1;
      }
      int value2 = Random().nextInt(100);
      if(value2 < probGol2){
        golTime2 += 1;
      }
    }

    return [golTime1, golTime2];
  }

}