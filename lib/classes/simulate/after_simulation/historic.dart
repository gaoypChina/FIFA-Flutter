
import 'package:fifa/classes/chaves.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/mata_mata/mata_mata_simulation.dart';
import 'package:fifa/classes/simulate/my_match/my_match_simulation.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';

class SaveMatchHistoric{

  List goalsList = List.filled(clubsAllNameList.length, 0);

  setHistoricGoalsLeagueMy(MyMatchSimulation myMatchSimulation){
    My myClass = My();
    if(Semana(semana).isJogoCampeonatoNacional){
      List chaves = Chaves().obterChave(semana,myClass.leagueID);
      late int chavePos2;
      if (chaves.indexOf(myClass.posicaoChave) % 2 == 0) {
        chavePos2 = chaves[chaves.indexOf(myClass.posicaoChave) + 1];
      } else {
        chavePos2 = chaves[chaves.indexOf(myClass.posicaoChave) - 1];
      }
      List goalsList = List.filled(25, 0);
      int chavePos1 = myClass.posicaoChave;//minha chave
      goalsList[chavePos1]  =  myMatchSimulation.meuGolMarcado;
      goalsList[chavePos2]  =  myMatchSimulation.meuGolSofrido;
      //SALVA OS GOLS DO CAMPEONATO
      globalHistoricLeagueGoalsLastRodada[myClass.leagueID] = List.from(goalsList);
      //SALVA OS GOLS DO CAMPEONATO NA RODADA
      globalHistoricLeagueGoalsAll[rodada] = Map.from(globalHistoricLeagueGoalsLastRodada);
    }
  }

  setHistoricGoalsLeague(int leagueIndex, int chavePos1, int chavePos2,int goal1, int goal2){
    if(Semana(semana).isJogoCampeonatoNacional){
      if(globalHistoricLeagueGoalsLastRodada[leagueIndex]!=null){ //Se existir
        goalsList = globalHistoricLeagueGoalsLastRodada[leagueIndex];//pega as infos da minha partida tambem
      }
      //LISTA COM GOLS DAQUELA CAMPEONATO, QUE É SOBRESCRITA A CADA CAMPEONATO
      goalsList[chavePos1] = goal1;
      goalsList[chavePos2] = goal2;

      //SALVA OS GOLS DO CAMPEONATO
      globalHistoricLeagueGoalsLastRodada[leagueIndex] = List.from(goalsList);

      //SALVA OS GOLS DO CAMPEONATO NA RODADA
      globalHistoricLeagueGoalsAll[rodada] = Map.from(globalHistoricLeagueGoalsLastRodada);
    }
  }

  setHistoricGoalsGruposInternational(String internationalName, int clubID1, int clubID2,int goal1, int goal2){
    if(Semana(semana).isJogoCampeonatoInternacional){
      int rodadaAtual = semanasGruposInternacionais.indexOf(semana);
      try{ //Se existir
        goalsList = globalHistoricInternationalGoalsAll[internationalName][rodadaAtual];//pega as infos da minha partida tambem
      }catch(e){
        //print("VARIAVEL -globalHistoricInternationalGoalsAll- AINDA NÃO FOI INICIALIZADA");
        if(globalHistoricInternationalGoalsAll[internationalName] == null){
          globalHistoricInternationalGoalsAll[internationalName] = {};
        }
        globalHistoricInternationalGoalsAll[internationalName][rodadaAtual] = List.filled(clubsAllNameList.length, 0);

      }
      //LISTA COM GOLS DAQUELA CAMPEONATO, QUE É SOBRESCRITA A CADA CAMPEONATO
      goalsList[clubID1] = goal1;
      goalsList[clubID2] = goal2;

      //SALVA OS GOLS DO CAMPEONATO NA RODADA
      globalHistoricInternationalGoalsAll[internationalName][rodadaAtual] = List.from(goalsList);

    }
  }

  setHistoricGoalsMataMataInternational(String internationalName, int clubID1, int clubID2,int goal1, int goal2){
    MataMataSimulation().setGoals(clubID1, clubID2, goal1, goal2);
  }
}