
import 'package:fifa/classes/my.dart';

import '../../classes/club.dart';
import '../../global_variables.dart';
import '../../values/league_names.dart';
import '../international_league.dart';
import '../simulate/match_simulation.dart';
import 'mata_mata_class.dart';

class MataMataSimulation{

  simulateMatchs(bool simulMyMatch){
    My myClass = My();
    for (int i = 0; i < internationalLeagueNames.length; i++) {
      String internationalName = InternationalLeagueManipulation().funcGetInternationalLeagueNameFromIndex(internationalLeagueIndex: i);
      int matchRowsTotal = MataMata().getMatchRows();
      int phaseIdaVolta = MataMata().getPhaseIdaVolta(semana); //jogo de ida ou volta
      for (int matchRows = 0; matchRows<matchRowsTotal; matchRows++) {
        //PEGA OS TIMES QUE VÃO JOGAR
        MataMata mataMata = MataMata();
        mataMata.getData(internationalName, mataMata.getSemanaPhase(semana),matchRows, phaseIdaVolta);
        Club club1 = Club(index: mataMata.clubID1);
        Club club2 = Club(index: mataMata.clubID2);
        if((club1.index != myClass.clubID && club2.index != myClass.clubID) || simulMyMatch){
        //SIMULA A PARTIDA EM SI
        MatchSimulation(club1, club2);
        //Se a final terminar empatada simula de novo -> PENALTIS
        if(semanaFinal.contains(semana) && mataMata.goal1 == mataMata.goal2){
          while(semanaFinal.contains(semana) && mataMata.goal1 == mataMata.goal2){
            MatchSimulation(club1, club2);
            mataMata.getData(internationalName, mataMata.getSemanaPhase(semana),matchRows, phaseIdaVolta);
          }
        }

        }//if not my club

      }
    }


  }

  setGoals(int clubID1, int clubID2, int goal1, int goal2){

    int phaseIdaVolta = MataMata().getPhaseIdaVolta(semana);
    String weekPhase = MataMata().getSemanaPhase(semana);

    String internationalName = Club(index: clubID1).internationalLeagueName;
    //CRIA MAP SE NÃO EXISTIR
    if(globalInternationalMataMataGoals[internationalName] == null){
      globalInternationalMataMataGoals[internationalName] = {};
    }
    if(globalInternationalMataMataGoals[internationalName][weekPhase] == null){
      globalInternationalMataMataGoals[internationalName][weekPhase] = {};
    }
    if(globalInternationalMataMataGoals[internationalName][weekPhase][clubID1] == null){
      globalInternationalMataMataGoals[internationalName][weekPhase][clubID1] = [-1,-1];
    }
    if(globalInternationalMataMataGoals[internationalName][weekPhase][clubID2] == null){
      globalInternationalMataMataGoals[internationalName][weekPhase][clubID2] = [-1,-1];
    }

    //SALVA VARIAVEL
    globalInternationalMataMataGoals[internationalName][weekPhase][clubID1][phaseIdaVolta] = goal1;
    globalInternationalMataMataGoals[internationalName][weekPhase][clubID2][phaseIdaVolta] = goal2;
  }


}