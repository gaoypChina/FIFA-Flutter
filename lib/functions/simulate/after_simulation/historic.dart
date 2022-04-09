
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';

class SaveMatchHistoric{
  List goalsList = List.filled(clubsAllNameList.length, 0);
  setHistoricGoalsLeague(int leagueIndex, int chavePos1, int chavePos2,int goal1, int goal2){
    if(Semana().isJogoCampeonatoNacional){
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

  setHistoricGoalsGruposInternational(String internationalName, int chavePos1, int chavePos2,int goal1, int goal2){
    if(Semana().isJogoCampeonatoInternacional){
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
      goalsList[chavePos1] = goal1;
      goalsList[chavePos2] = goal2;

      //SALVA OS GOLS DO CAMPEONATO NA RODADA
      globalHistoricInternationalGoalsAll[internationalName][rodadaAtual] = List.from(goalsList);

    }
  }
}