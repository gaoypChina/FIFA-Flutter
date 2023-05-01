import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/international_league_manipulation.dart';
import 'package:fifa/classes/historic/historic_my_tranfers.dart';
import 'package:fifa/classes/historic_positions_this_year.dart';
import 'package:fifa/classes/international_league.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/mata_mata/mata_mata_class.dart';
import 'package:fifa/classes/mata_mata/mata_mata_simulation.dart';
import 'package:fifa/classes/mundial.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/chaves.dart';
import 'package:fifa/classes/simulate/after_simulation/historic.dart';
import 'package:fifa/classes/simulate/match_simulation.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/values/league_names.dart';

import '../semana.dart';

class Simulate{

  simulateWeek({required bool simulMyMatch}){
    //Antes de usar -> use o startVariables se for jogar a partida

    customToast('Simulate Matchs...');
    //SIMULA PARTIDAS
    if(Semana(semana).isJogoCampeonatoNacional) {
      nationalMatchs(simulMyMatch);
    }
    if(Semana(semana).isJogoCopa) {
      cupMatchs(simulMyMatch);
    }
    if(Semana(semana).isJogoGruposInternacional){
      internationalMatchsGroups(simulMyMatch);
    }
    if(Semana(semana).isJogoMataMataInternacional) {
      MataMataSimulation().simulateMatchs(simulMyMatch);
    }

    if(Semana(semana).isJogoMundial) {
      MundialFinal data = MundialFinal();
      data.simulate();
    }

    //APÓS A SIMULAÇÃO
    updateWeek();

    setTeamsInternational();

    //Save position map
    if(Semana(semana).isJogoCampeonatoNacional){
      HistoricPositionsThisYear().setGlobal();
    }

    //Salva o saldo financeiro atual para o histórico
    HistoricMyTransfers().saveWeekBalance();
  }

  startVariables(){
      globalMatchGoalScorerIDMy = [];
      globalMatchGoalScorerIDAdv = [];
      globalMatchGoalsMinutesMy = [];
      globalMatchGoalsMinutesAdv = [];
      globalJogadoresMatchGoals = List.filled(globalMaxPlayersPermitted, 0);
      globalJogadoresMatchAssists = List.filled(globalMaxPlayersPermitted, 0);
      globalJogadoresMatchRedCards = List.filled(globalMaxPlayersPermitted, 0);
      globalJogadoresMatchYellowCards = List.filled(globalMaxPlayersPermitted, 0);
      globalJogadoresMatchInjury = List.filled(globalMaxPlayersPermitted, 0);
      globalJogadoresMatchHealth = List.filled(globalMaxPlayersPermitted, 1.0);
      globalJogadoresMatchGrade = List.filled(globalMaxPlayersPermitted, 6.0);
  }
  updateWeek(){
    semana++;
    //Atualiza a rodada do campeonato
    if(Semana(semana).isJogoCampeonatoNacional) {
      rodada = semanasJogosNacionais.indexOf(semana)+1;
    }
  }

  setTeamsInternational(){
    //Define times oitavas
    if(semana == semanaOitavas.first) {
      MataMata().defineClubsOitavas();
    }
    else if(semana == semanaQuartas.first) {
      MataMata().defineClubsQuartas();
    }
    else if(semana == semanaSemi.first) {
      MataMata().defineClubsSemi();
    }
    else if(semana == semanaFinal.first) {
      MataMata().defineClubsFinal();
    }
  }

  nationalMatchs(bool simulMyMatch){
      int myClubID = globalMyClubID;
      int myCampeonatoID = My().leagueID;
      for (int i = 0; i < leaguesListRealIndex.length; i++) {
        int leagueIndex = leaguesListRealIndex[i];
        League leagueSelected = League(index: leagueIndex);

        int nClubs = leagueSelected.nClubs;
        //Se a liga estiver em uma semana que ainda tem jogo Ex: Rodada 15 com 10 times nem joga
        //16 times -> 15 rodadas [0,14]
        if (semana <= semanasJogosNacionais[leagueSelected.nClubs - 2]) {
          List chave = Chaves().obterChave(semana, leagueIndex);
          for (int nConfronto = 0; nConfronto < nClubs / 2; nConfronto++) {
            int chaveClub1 = chave[nConfronto * 2];
            int indexTeam1 = leagueSelected.getClubRealID(chaveClub1);
            int chaveClub2 = Chaves().chaveIndexAdvCampeonato(
                semana, leagueIndex, chaveClub1)[0];
            int indexTeam2 = leagueSelected.getClubRealID(chaveClub2);

            //Se não for meu jogo simula ou se for simulação
            if (myCampeonatoID != leagueIndex ||
                (myClubID != indexTeam1 && myClubID != indexTeam2) || simulMyMatch) {
              MatchSimulation match = MatchSimulation(Club(index: indexTeam1,clubDetails: false), Club(index: indexTeam2,clubDetails: false));
              //SALVA O PLACAR NO HISTÓRICO
              SaveMatchHistoric().setHistoricGoalsLeague(leagueIndex, chaveClub1, chaveClub2,match.variableGol1,match.variableGol2);
            }
          }
        }
      }

  }

  cupMatchs(bool simulMyMatch){

  }

  internationalMatchsGroups(bool simulMyMatch) {
    for(int i=0; i<InternationalLeagueManipulation().funcNInternationalLeagues();i++){
      internationalMatchsGroupsLeague(
          simulMyMatch,
          InternationalLeagueManipulation().funcGetInternationalLeagueNameFromIndex(internationalLeagueIndex: i)
      );
    }
  }

  internationalMatchsGroupsLeague(bool simulMyMatch, String internationalName){
    int myClubID = My().clubID;
    InternationalLeague internationalLeague = InternationalLeague();
      //PRA CHAMPIONS E PARA A LIBERTADORES
      List chave = Chaves().obterChave(semana, 0);
      for (int groupNumber = 0; groupNumber < 8; groupNumber++) {
        for (int nConfronto = 0; nConfronto < 4 / 2; nConfronto++) {
          int chaveConfronto = chave[nConfronto * 2];
          int indexTeam1 = internationalLeague.getClub(internationalName, 4 * groupNumber + chaveConfronto);
          int indexAdv04 = Chaves().chaveIndexAdvCampeonato(semana, 0, chaveConfronto)[0];
          int indexTeam2 = internationalLeague.getClub(internationalName, 4 * groupNumber + indexAdv04);
          if(indexTeam1 != myClubID && indexTeam2 != myClubID || simulMyMatch) {
            MatchSimulation match = MatchSimulation(Club(index: indexTeam1,clubDetails: false), Club(index: indexTeam2,clubDetails: false));
            //SALVA O PLACAR NO HISTÓRICO
            SaveMatchHistoric().setHistoricGoalsGruposInternational(internationalName,indexTeam1,indexTeam2, match.variableGol1,match.variableGol2);
          }
        }

    }

  }

}
