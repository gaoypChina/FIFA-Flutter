import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/functions/mata_mata/mata_mata_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/chaves.dart';
import 'package:fifa/functions/international_league.dart';
import 'package:fifa/functions/simulate/after_simulation/historic.dart';
import 'package:fifa/functions/simulate/match_simulation.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

import '../../classes/geral/semana.dart';
import '../fim_campeonato_local.dart';
import '../mata_mata/mata_mata_simulation.dart';

class Simulate{

  simulateWeek(){

    //SIMULA PARTIDAS
    if(Semana().isJogoCampeonatoNacional) {
      nationalMatchs();
    }
    if(Semana().isJogoGruposInternacional){
      internationalMatchsGroups();
    }
    if(Semana().isJogoMataMataInternacional) {
      MataMataSimulation().simulateMatchs();
    }

    //APÓS A SIMULAÇÃO
    updateWeek();

    setTeamsInternational();
  }

  updateWeek() async{
    semana++;
    //Atualiza a rodada do campeonato
    if(semanasJogosNacionais.contains(semana)) {
      rodada = semanasJogosNacionais.indexOf(semana)+1;
    }
  }

  setTeamsInternational(){
    //Define Times na champions e libertadores
    if(semana == semanasJogosInternacionais.first){
      FimDoCampeonatoLocal().setAll032InternationalTeams();
    }
    //Define times oitavas
    if(semana == semanaOitavas.first) {
      MataMata().defineClubsOitavas();
    }
    if(semana == semanaQuartas.first) {
      MataMata().defineClubsQuartas();
    }
    if(semana == semanaSemi.first) {
      MataMata().defineClubsSemi();
    }
    if(semana == semanaFinal.first) {
      MataMata().defineClubsFinal();
    }
  }

  nationalMatchs(){
      int myClubID = globalMyClubID;
      int myCampeonatoID = My().campeonatoID;
      for (int i = 0; i < leaguesListRealIndex.length; i++) {
        int leagueIndex = leaguesListRealIndex[i];
        League leagueSelected = League(index: leagueIndex);

        int nClubs = leagueSelected.nClubs;
        //Se a liga estiver em uma semana que ainda tem jogo Ex: Rodada 15 com 10 times nem joga
        //16 times -> 15 rodadas [0,14]
        if (semana <= semanasJogosNacionais[leagueSelected.nClubs - 2]) {
          List chave = Chaves().obterChave(rodada, leagueIndex);
          for (int nConfronto = 0; nConfronto < nClubs / 2; nConfronto++) {
            int chaveClub1 = chave[nConfronto * 2];
            int indexTeam1 = leagueSelected.getClubRealID(chaveClub1);
            int chaveClub2 = Chaves().chaveIndexAdvCampeonato(
                rodada, leagueIndex, chaveClub1)[0];
            int indexTeam2 = leagueSelected.getClubRealID(chaveClub2);

            //Se não for meu jogo simula
            if (myCampeonatoID != leagueIndex ||
                (myClubID != indexTeam1 && myClubID != indexTeam2)) {
              MatchSimulation match = MatchSimulation(Club(index: indexTeam1), Club(index: indexTeam2));
              //SALVA O PLACAR NO HISTÓRICO
              SaveMatchHistoric().setHistoricGoalsLeague(leagueIndex, chaveClub1, chaveClub2,match.variableGol1,match.variableGol2);
            }
          }
        }
      }

  }

  internationalMatchsGroups(){

    int myClubID = My().clubID;
    for(int i=0; i<globalInternational32ClubsID.length; i++) { //champions, libertadores... 2
      String internationalName = funcGetInternationalLeagueNameFromIndex(internationalLeagueIndex: i);
      //PRA CHAMPIONS E PARA A LIBERTADORES
      List chave = Chaves().obterChave(semana, 0);
      for (int groupNumber = 0; groupNumber < 8; groupNumber++) {
        for (int nConfronto = 0; nConfronto < 4 / 2; nConfronto++) {
          int chaveConfronto = chave[nConfronto * 2];
          int indexTeam1 = globalInternational32ClubsID[i][4 * groupNumber + chaveConfronto];
          int indexAdv04 = Chaves().chaveIndexAdvCampeonato(semana, 0, chaveConfronto)[0];
          int indexTeam2 = globalInternational32ClubsID[i][(4 * groupNumber) + indexAdv04];
          if(indexTeam1 != myClubID && indexTeam2 != myClubID) {
            MatchSimulation match = MatchSimulation(Club(index: indexTeam1), Club(index: indexTeam2));
            //SALVA O PLACAR NO HISTÓRICO
            SaveMatchHistoric().setHistoricGoalsGruposInternational(internationalName,indexTeam1,indexTeam2, match.variableGol1,match.variableGol2);
          }
        }
      }
    }

  }

}
