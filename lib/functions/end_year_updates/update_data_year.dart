import 'dart:math';

import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/historic/historic_club_year.dart';
import 'package:fifa/classes/historic/historic_my_tranfers.dart';
import 'package:fifa/classes/historic/top_players_ovr.dart';
import 'package:fifa/classes/historic/top_scorers.dart';
import 'package:fifa/classes/international.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/end_year_updates/aposentadoria.dart';
import 'package:fifa/functions/international_league.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/page_controller/coach/coach_ranking_controller.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/values/league_names.dart';

import 'ovr_update.dart';
import 'player_transfer.dart';
import 'rebaixamento.dart';

void funcUpdateDataAfterSeason(){
  customToast('10% - Salvando dados históricos');
  saveHistoricalData(); //salva a classificação dos campeonatos
  customToast('30% - Atualizando status dos jogadores');
  atualizaStatusJogadores(); //venda, update de overall, idade+1
  customToast('50% - Alterando os times de divisão');
  trocaClubesRebaixamento();
  customToast('70% - Resetando cartões, gols, assistencias');
  resetData(); //clear cartoes amarelos, gols, assistencias etc...
  customToast('90% - Salvando dados de treinador');
  saveCoachPoints();
  ano++;
}

//HISTORICO
saveHistoricalData(){
  saveLeagueResults();
  saveInternationalLeagueResults();
  resetInternationalGoalsData();
  saveMyClubData();
  saveBestPlayers();
}
saveLeagueResults(){
  Map allLeaguesClassification = {};
  for(int i=0;i<nLeaguesTotal;i++){
    int leagueID = leaguesListRealIndex[i];
    List clubsIDs = Classification(leagueIndex: leagueID).classificationClubsIndexes;
    allLeaguesClassification[League(index: leagueID).name] = clubsIDs;
  }
  //salva o resultado final
  globalHistoricLeagueClassification[ano] = allLeaguesClassification;
}
saveInternationalLeagueResults(){
  Map allLeaguesClassification = {};
  int nInternationalLeagues = InternationalLeagueManipulation().funcNInternationalLeagues();
  for(int i=0;i<nInternationalLeagues;i++){
    String internationalLeagueName = InternationalLeagueManipulation().funcGetInternationalLeagueNameFromIndex(internationalLeagueIndex: i);
    List clubsIDs = International(internationalLeagueName).getClassification();
    allLeaguesClassification[internationalLeagueName] = clubsIDs;
  }
  //salva o resultado final
  globalHistoricInternationalClassification[ano] = allLeaguesClassification;
  globalHistoricInternationalGoalsAll[ano] = globalInternationalMataMataGoals;
}
resetInternationalGoalsData(){
  globalInternationalMataMataGoals = {};
}

saveMyClubData(){
  My my = My();
  globalHistoricMyClub[ano] = {
    'clubID': my.clubID,
    'leagueID': my.campeonatoID,
    'players': my.jogadores,
  };
}

saveBestPlayers(){
  List best = [];
  List bestID = [];
  List topScorers = [];
  List topScorersID = [];
  //Seleciona os melhores
  for(int index=0; index<globalJogadoresIndex.length; index++){
    Jogador player = Jogador(index: index);
    if(player.goalsLeague >= 2 || topScorers.length<100){
      topScorers.add(player.goalsLeague);
      topScorersID.add(player.index);
    }
    if(player.overall > 80){
      best.add(player.overall);
      bestID.add(player.index);
    }
  }
  TopScorers().orderAndSave(topScorers, topScorersID);
  TopPlayersOVR().orderAndSave(best, bestID);
}
resetPlayersData(){
  //Reseta só antes de carregar o database
  //Jogadores
  globalJogadoresIndex = [];
  globalJogadoresName = [];
  globalJogadoresClubIndex = [];
  globalJogadoresPosition = [];
  globalJogadoresAge = [];
  globalJogadoresOverall = [];
  globalJogadoresNationality = [];
  globalJogadoresImageUrl = [];

  //Limpa histórico
  globalHistoricLeagueClassification = {};
  globalHistoricInternationalClassification = {};
  globalHistoricClassification = {'Mundial':{}};

  //ZERA DADOS DE TRANSFERENCIAS
  HistoricMyTransfers().resetGlobalVariable();
}
resetData(){
  semana= testInitRodada;//testInitRodada = variavel global
  rodada= testInitRodada;//testInitRodada = variavel global
  alreadyChangedClubThisSeason = false;

  //Zera Status dos jogadores
  globalJogadoresHealth = List.filled(globalMaxPlayersPermitted, 1.0);
  globalJogadoresMoral = List.filled(globalMaxPlayersPermitted, globalJogadoresMoralNames[Random().nextInt(globalJogadoresMoralNames.length)]);
  globalJogadoresLeagueMatchs = List.filled(globalMaxPlayersPermitted, 0);
  globalJogadoresLeagueGoals = List.filled(globalMaxPlayersPermitted, 0);
  globalJogadoresLeagueAssists = List.filled(globalMaxPlayersPermitted, 0);
  globalJogadoresInternationalMatchs = List.filled(globalMaxPlayersPermitted, 0);
  globalJogadoresInternationalGoals = List.filled(globalMaxPlayersPermitted, 0);
  globalJogadoresInternationalAssists = List.filled(globalMaxPlayersPermitted, 0);
  globalJogadoresRedCard = List.filled(globalMaxPlayersPermitted, 0);
  globalJogadoresYellowCard = List.filled(globalMaxPlayersPermitted, 0);
  globalJogadoresInjury = List.filled(globalMaxPlayersPermitted, 0);

  //Clubes
  globalClubsLeaguePoints = List.filled(globalMaxClubsPermitted, 0);
  globalClubsLeagueGM = List.filled(globalMaxClubsPermitted, 0);
  globalClubsLeagueGS = List.filled(globalMaxClubsPermitted, 0);
  globalClubsInternationalPoints = List.filled(globalMaxClubsPermitted, 0);
  globalClubsInternationalGM = List.filled(globalMaxClubsPermitted, 0);
  globalClubsInternationalGS = List.filled(globalMaxClubsPermitted, 0);

}

void trocaClubesRebaixamento(){
  List leagueClassifications = [];
  for (int index in leaguesListRealIndex){
    leagueClassifications.add(League(index: index).getClassification());
  }

  funcRebaixamentoLeague(leagueClassifications,LeagueOfficialNames().inglaterra1,LeagueOfficialNames().inglaterra2,3);
  funcRebaixamentoLeague(leagueClassifications,LeagueOfficialNames().inglaterra2,LeagueOfficialNames().inglaterra3,3);
  funcRebaixamentoLeague(leagueClassifications,LeagueOfficialNames().espanha1,LeagueOfficialNames().espanha2,3);
  funcRebaixamentoLeague(leagueClassifications,LeagueOfficialNames().italia1,LeagueOfficialNames().italia2,3);
  funcRebaixamentoLeague(leagueClassifications,LeagueOfficialNames().alemanha1,LeagueOfficialNames().alemanha2,3);
  funcRebaixamentoLeague(leagueClassifications,LeagueOfficialNames().franca1,LeagueOfficialNames().franca2,3);
  funcRebaixamentoLeague(leagueClassifications,LeagueOfficialNames().brasil1,LeagueOfficialNames().brasil2,3);
  funcRebaixamentoLeague(leagueClassifications,LeagueOfficialNames().brasil2,LeagueOfficialNames().brasil3,3);
}


void atualizaStatusJogadores(){
  for(int id=0;id<globalJogadoresIndex.length;id++){

    Jogador player = Jogador(index: id);
    //Set New Overall
    newOverall(player);

    //+1 Ano de idade
    globalJogadoresAge[id]++;

    //Transferencia
    transferenciaJogador(id);

    //aposentadoria
    AposentarJogador(player);
  }
  //Faz minha nova escalação titular, com base nos melhores jogadores que melhoraram
  Club newClubClass = Club(index: My().clubID);
  globalMyJogadores = newClubClass.escalacao; //global MyJogadores tem que ser declarado antes de usar qualquer getOverall();
  newClubClass.getOverall();
}

saveCoachPoints(){
  int expectativa = My().getLastYearExpectativa();
  int classificacao = HistoricClubYear(ano).leaguePosition;
  double multiplicationFactor = (expectativa+1)/(classificacao+1); //Ex: 10/3  12/5
  globalCoachPoints += (multiplicationFactor*(100/classificacao)).round(); //100,50,33,25,20...


  CoachRankingController controller = CoachRankingController();
  controller.saveData();
}
