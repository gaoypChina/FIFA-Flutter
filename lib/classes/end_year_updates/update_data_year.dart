import 'dart:math';

import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/dict_keys/player_stats_keys.dart';
import 'package:fifa/classes/mata_mata/cup_classification.dart';
import 'package:fifa/classes/end_year_updates/aposentadoria.dart';
import 'package:fifa/classes/functions/fim_campeonato_local.dart';
import 'package:fifa/classes/historic/historic_club_year.dart';
import 'package:fifa/classes/historic/historic_my_players.dart';
import 'package:fifa/classes/historic/historic_my_tranfers.dart';
import 'package:fifa/classes/historic/top_players_ovr.dart';
import 'package:fifa/classes/historic/top_scorers.dart';
import 'package:fifa/classes/historic_positions_this_year.dart';
import 'package:fifa/classes/international.dart';
import 'package:fifa/classes/international_league.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/functions/internat_league_manipulation.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/coach/controller/coach_ranking_controller.dart';
import 'package:fifa/pages/negotiation/negotiation_class.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/values/league_names.dart';

import 'ovr_update.dart';
import 'player_transfer.dart';
import 'relegation.dart';

void funcUpdateDataAfterSeason(){
  customToast('10% - Salvando dados históricos');
  saveHistoricalData(); //salva a classificação dos campeonatos

  customToast('30% - Atualizando status dos jogadores');
  atualizaStatusJogadores(); //venda, update de overall, idade+1

  customToast('70% - Alterando os times de divisão');
  FimDoCampeonatoLocal().setAll032InternationalTeams(); //Define Times na champions e libertadores
  
  relegateClubsOperation();

  customToast('80% - Resetando cartões, gols, assistencias');
  resetData(); //clear cartoes amarelos, gols, assistencias etc...

  customToast('90% - Salvando dados de treinador');
  saveCoachPoints();

  ano++;
}

//HISTORICO
void saveHistoricalData(){
  //TIMES DAS COPAS
  CupClassification().setClubs();

  saveLeagueResults();
  saveInternationalLeagueResults();
  saveCupResults();
  globalInternationalMataMata = {};
  HistoricMyPlayers().saveMyClubData(My());
  saveBestPlayers();
}
void saveLeagueResults(){
  Map allLeaguesClassification = {};
  for(int i=0;i<nLeaguesTotal;i++){
    int leagueID = leaguesListRealIndex[i];
    List clubsIDs = Classification(leagueIndex: leagueID).classificationClubsIndexes;
    allLeaguesClassification[League(index: leagueID).name] = clubsIDs;
  }
  //salva o resultado final
  globalHistoricLeagueClassification[ano] = allLeaguesClassification;
}
void saveInternationalLeagueResults(){
  Map allLeaguesClassification = {};
  int nInternationalLeagues = InternationalLeagueManipulation().funcNInternationalLeagues();
  for(int i=0;i<nInternationalLeagues;i++){
    String internationalLeagueName = internationalLeagueNames[i];
    List clubsIDs = International(internationalLeagueName).getClassification();
    allLeaguesClassification[internationalLeagueName] = clubsIDs;
  }
  //salva o resultado final
  globalHistoricInternationalClassification[ano] = allLeaguesClassification;
  globalHistoricInternationalGoalsAll[ano] = globalInternationalMataMata;
}
void saveCupResults(){
  globalHistoricCup[ano] = globalCup;
}

void saveBestPlayers(){
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
void resetOnLoadData(){
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
  globalHistoricCup = {};
  globalHistoricClassification = {'Mundial':{}};
  globalHistoricLeagueGoalsAll = {};
  globalHistoricInternationalGoalsAll = {};
  globalInternationalMataMata = {};

  //ZERA DADOS DE TRANSFERENCIAS
  HistoricMyTransfers().resetGlobalVariable();

  //Reset Histórico de posições
  HistoricPositionsThisYear().resetGlobal();

  globalHistoricLeagueClassification = {};
  globalHistoricInternationalClassification = {};
  globalHistoricCup = {};
  globalHistoricClassification = {'Mundial': {}};


  globalHistoricMyClub = {};
  globalHistoricBestPlayers = {};
  globalHistoricTopScorers = {};
  globalHistoricCoachResults = {};

  //RESET CHAMPIONS LEAGUE, LIBERTADORES etc data
  if(ano == anoInicial) {
    InternationalLeague().resetAll();
    InternationalLeague().setDefaultTeams();
  }

}

void resetData(){

  semana = testInitRodada; //testInitRodada = variavel global
  rodada = testInitRodada; //testInitRodada = variavel global
  alreadyChangedClubThisSeason = false;

  Negotiation().resetNegotiatedPlayers();

  //Zera Status dos jogadores
  globalJogadoresHealth = List.filled(globalMaxPlayersPermitted, 1.0);
  globalJogadoresMoral = List.filled(globalMaxPlayersPermitted, globalJogadoresMoralNames[Random().nextInt(globalJogadoresMoralNames.length)]);

  globalLeaguePlayers = {
    PlayerStatsKeys().keyPlayerMatchs: List.filled(globalMaxPlayersPermitted, 0),
    PlayerStatsKeys().keyPlayerGoals: List.filled(globalMaxPlayersPermitted, 0),
    PlayerStatsKeys().keyPlayerAssists: List.filled(globalMaxPlayersPermitted, 0),
    PlayerStatsKeys().keyPlayerCleanSheets: List.filled(globalMaxPlayersPermitted, 0),
    PlayerStatsKeys().keyPlayerGolsSofridos: List.filled(globalMaxPlayersPermitted, 0),
    PlayerStatsKeys().keyPlayerGrade: List.filled(globalMaxPlayersPermitted, 6),
  };

  globalInternationalPlayers = {
    PlayerStatsKeys().keyPlayerMatchs: List.filled(globalMaxPlayersPermitted, 0),
    PlayerStatsKeys().keyPlayerGoals: List.filled(globalMaxPlayersPermitted, 0),
    PlayerStatsKeys().keyPlayerAssists: List.filled(globalMaxPlayersPermitted, 0),
    PlayerStatsKeys().keyPlayerCleanSheets: List.filled(globalMaxPlayersPermitted, 0),
    PlayerStatsKeys().keyPlayerGolsSofridos: List.filled(globalMaxPlayersPermitted, 0),
    PlayerStatsKeys().keyPlayerGrade: List.filled(globalMaxPlayersPermitted, 0),
  };


  globalJogadoresRedCard = List.filled(globalMaxPlayersPermitted, 0);
  globalJogadoresYellowCard = List.filled(globalMaxPlayersPermitted, 0);
  globalJogadoresInjury = List.filled(globalMaxPlayersPermitted, 0);

  //Clubs
  globalClubsLeaguePoints = List.filled(globalMaxClubsPermitted, 0);
  globalClubsLeagueGM = List.filled(globalMaxClubsPermitted, 0);
  globalClubsLeagueGS = List.filled(globalMaxClubsPermitted, 0);
  globalClubsInternationalPoints = List.filled(globalMaxClubsPermitted, 0);
  globalClubsInternationalGM = List.filled(globalMaxClubsPermitted, 0);
  globalClubsInternationalGS = List.filled(globalMaxClubsPermitted, 0);

  globalHistoricLeagueGoalsLastRodada = {};

}


void relegateClubsOperation(){
  List leagueClassifications = [];
  LeagueOfficialNames l = LeagueOfficialNames();
  for (int index in leaguesListRealIndex){
    leagueClassifications.add(League(index: index).getClassification());
  }

  funcRelegationLeague(leagueClassifications,l.inglaterra1,l.inglaterra2,3);
  funcRelegationLeague(leagueClassifications,l.inglaterra2,l.inglaterra3,3);
  funcRelegationLeague(leagueClassifications,l.espanha1,l.espanha2,3);
  funcRelegationLeague(leagueClassifications,l.italia1,l.italia2,3);
  funcRelegationLeague(leagueClassifications,l.alemanha1,l.alemanha2,3);
  funcRelegationLeague(leagueClassifications,l.franca1,l.franca2,3);
  funcRelegationLeague(leagueClassifications,l.brasil1,l.brasil2,3);
  funcRelegationLeague(leagueClassifications,l.brasil2,l.brasil3,3);
  funcRelegationLeague(leagueClassifications,l.brasil3,l.brasil4,3);
}


void atualizaStatusJogadores(){
  for(int id=0; id<globalJogadoresIndex.length; id++){

    Jogador player = Jogador(index: id);
    //Set New Overall
    newOverall(player);

    //+1 Ano de idade
    globalJogadoresAge[id]++;

    //Transferencia
    transferPlayer(id);

    //aposentadoria
    AposentarJogador(player);
  }
  //Faz minha nova escalação titular, com base nos melhores jogadores que melhoraram
  Club newClubClass = Club(index: My().clubID);
  globalMyJogadores = newClubClass.escalacao; //global MyJogadores tem que ser declarado antes de usar qualquer getOverall();
  newClubClass.getOverall();
}

void saveCoachPoints(){
  int expectativa = My().getLastYearExpectativa();
  int classificacao = HistoricClubYear(ano).leaguePosition;
  double multiplicationFactor = (expectativa+1)/(classificacao+1); //Ex: 10/3  12/5
  globalCoachPoints += (multiplicationFactor*(100/classificacao)).round(); //100,50,33,25,20...


  CoachRankingController controller = CoachRankingController();
  controller.saveData();
}
