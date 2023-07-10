
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/simulate/match_simulation.dart';

import '../../classes/club.dart';
import '../../global_variables.dart';
import '../../values/league_names.dart';
import 'mata_mata_class.dart';

class MataMataSimulation{

  void simulateMatchs(bool simulMyMatch){
    My myClass = My();
    MataMata mataMata = MataMata();
    for (int i = 0; i < internationalLeagueNames.length; i++) {
      String internationalName = internationalLeagueNames[i];

      int matchRowsTotal = mataMata.getMatchRows();
      int phaseIdaVolta = mataMata.getPhaseIdaVolta(semana); //jogo de ida ou volta
      for (int matchRows = 0; matchRows < matchRowsTotal; matchRows++) {
        //PEGA OS TIMES QUE VÃO JOGAR
        mataMata = MataMata();
        Confronto confronto = mataMata.getData(internationalName, mataMata.getSemanaPhase(semana), matchRows, phaseIdaVolta);
        Club club1 = Club(index: confronto.clubID1, clubDetails: false);
        Club club2 = Club(index: confronto.clubID2, clubDetails: false);

        if((club1.index != myClass.clubID && club2.index != myClass.clubID) || simulMyMatch){
        //SIMULA A PARTIDA EM SI
        MatchSimulation(club1, club2, myClass);
        //Se a final terminar empatada simula de novo -> PENALTIS
        if(semanaFinal.contains(semana)){
          confronto = mataMata.getData(internationalName, mataMata.getSemanaPhase(semana), matchRows, phaseIdaVolta);
          while(semanaFinal.contains(semana) && confronto.goal1 == confronto.goal2){
            //TODO: REFAZER, PORQUE ACABA REJOGANDO A PARTIDA E SALVA OS STATS DOS JOGADORES 2X
            MatchSimulation(club1, club2, myClass);
            //SALVA O PLACAR
            confronto = mataMata.getData(internationalName, mataMata.getSemanaPhase(semana), matchRows, phaseIdaVolta);
          }
        }

        }//if not my club

      }
    }


  }



}