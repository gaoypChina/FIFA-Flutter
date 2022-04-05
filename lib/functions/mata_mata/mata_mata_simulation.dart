
import '../../classes/club.dart';
import '../../global_variables.dart';
import '../../values/league_names.dart';
import '../international_league.dart';
import '../simulate/simulate_functions.dart';
import 'mata_mata_class.dart';

class MataMataSimulation{

  simulateMatchs(){
    for (int i = 0; i < internationalLeagueNames.length; i++) {
      String internationalName = funcGetInternationalLeagueNameFromIndex(internationalLeagueIndex: i);
      int matchRowsTotal = MataMata().getMatchRows();
      int phaseStage = MataMata().getPhaseStage(semana); //jogo de ida ou volta
      for (int matchRows = 0; matchRows<matchRowsTotal; matchRows++) {
        MataMata data = MataMata();
        data.getData(internationalName, data.getSemanaPhase(semana),matchRows, phaseStage);

        Simulate().matchSimulation(data.clubID1, data.clubID2);
      }
    }
  }

  setGoals(int clubID1, int clubID2, int goal1, int goal2){

    int phaseStage = MataMata().getPhaseStage(semana);
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
    globalInternationalMataMataGoals[internationalName][weekPhase][clubID1][phaseStage] = goal1;
    globalInternationalMataMataGoals[internationalName][weekPhase][clubID2][phaseStage] = goal2;
  }

}