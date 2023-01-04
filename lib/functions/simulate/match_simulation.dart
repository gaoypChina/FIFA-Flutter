import 'dart:math';

import 'package:fifa/classes/historic/total_victories.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/simulate/player_variables/cards_injury_selection.dart';
import 'package:fifa/functions/simulate/after_simulation/set_points.dart';
import 'package:fifa/functions/simulate/player_variables/update_player_variables.dart';
import 'package:fifa/global_variables.dart';

import '../../classes/club.dart';
import '../../classes/geral/semana.dart';
import '../mata_mata/mata_mata_simulation.dart';

class MatchSimulation{

  late int variableGol1;
  late int variableGol2;

  MatchSimulation(Club clubClass1,Club clubClass2){

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
    //+1 Match
    UpdatePlayerVariable().setMatchUpdate(clubClass1);
    UpdatePlayerVariable().setMatchUpdate(clubClass2);

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

    int gol = Random().nextInt(100);
    late int probVit,probEmp;
    if(ovr1 > ovr2+10){probVit = 90;probEmp = 95;}
    else if(ovr1 > ovr2+7){probVit = 75;probEmp = 95;}
    else if(ovr1 > ovr2+5){probVit = 65;probEmp = 90;}
    else if(ovr1 > ovr2+4){probVit = 60;probEmp = 85;}
    else if(ovr1 > ovr2+3){probVit = 55;probEmp = 80;}
    else if(ovr1 > ovr2+2){probVit = 50;probEmp = 75;}
    else if(ovr1 > ovr2+1){probVit = 40;probEmp = 70;}
    else if(ovr1 > ovr2)  {probVit = 33;probEmp = 66;}
    else if(ovr1 > ovr2-1){probVit = 30;probEmp = 60;}
    else if(ovr1 > ovr2-2){probVit = 25;probEmp = 50;}
    else if(ovr1 > ovr2-3){probVit = 20;probEmp = 45;}
    else if(ovr1 > ovr2-4){probVit = 15;probEmp = 35;}
    else if(ovr1 > ovr2-5){probVit = 10;probEmp = 35;}
    else if(ovr1 > ovr2-7){probVit = 5;probEmp = 25;}
    else if(ovr1 <= ovr2-7){probVit = 5;probEmp = 10;}

    late int golTime1;
    late int golTime2;
    //Vitória time 1
    if(gol<probVit){
      golTime1 = Random().nextInt(5)+1;
      golTime2 = golTime1>1 ? Random().nextInt(golTime1) : 0;
    }
    //EMPATE
    else if(gol<probEmp){
      golTime1 = Random().nextInt(4);
      golTime2 = golTime1;
      //Vitória time 2
    }else{
      golTime2 = Random().nextInt(5)+1;
      golTime1 = golTime2>1 ? Random().nextInt(golTime2) : 0;
    }
    return [golTime1, golTime2];
  }

}