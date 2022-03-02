import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/international.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/international_league.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

import 'end_year_updates/ovr_update.dart';
import 'end_year_updates/player_transfer.dart';
import 'end_year_updates/rebaixamento.dart';

void funcUpdateDataAfterSeason(){
  saveHistoricalData();
  atualizaStatusJogadores(); //venda, update de overall, idade+1
  trocaClubesRebaixamento();
  resetData();
  ano++;
}

//HISTORICO
saveHistoricalData(){
  saveLeagueResults();
  saveInternationalLeagueResults();
  saveMyClubData();
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
  int nInternationalLeagues = funcNInternationalLeagues();
  for(int i=0;i<nInternationalLeagues;i++){
    String internationalLeagueName = funcGetInternationalLeagueNameFromIndex(internationalLeagueIndex: i);
    List clubsIDs = International(internationalLeagueName).getClassification();
    allLeaguesClassification[internationalLeagueName] = clubsIDs;
  }
  //salva o resultado final
  globalHistoricInternationalClassification[ano] = allLeaguesClassification;
}

saveMyClubData(){
  globalHistoricMyClub[ano] = {
    'clubID':My().clubID,
    'leagueID':My().campeonatoID,
    'players': My().jogadores,
  };
}
resetPlayersData(){
  //Reseta só antes de carregar o database
  //Jogadores
  globalJogadoresIndex = [];
  globalJogadoresName = [];
  globalJogadoresClubIndex = [];
  globalJogadoresPosition = [];
  globalJogadoresNationality = [];
  globalJogadoresAge = [];
  globalJogadoresOverall = [];

  //Limpa histórico
  globalHistoricLeagueClassification = {};
  globalHistoricInternationalClassification = {};
}
resetData(){
  semana= testInitRodada;//testInitRodada = variavel global
  rodada= testInitRodada;//testInitRodada = variavel global
  alreadyChangedClubThisSeason = false;

  //Zera Status dos jogadores
  globalJogadoresHealth = List.filled(7000, 1.0);
  globalJogadoresTotalMatchs = List.filled(7000, 0);
  globalJogadoresTotalGoals = List.filled(7000, 0);
  globalJogadoresTotalAssists = List.filled(7000, 0);
  globalJogadoresLeagueMatchs = List.filled(7000, 0);
  globalJogadoresLeagueGoals = List.filled(7000, 0);
  globalJogadoresLeagueAssists = List.filled(7000, 0);
  globalJogadoresInternationalMatchs = List.filled(7000, 0);
  globalJogadoresInternationalGoals = List.filled(7000, 0);
  globalJogadoresInternationalAssists = List.filled(7000, 0);
  globalJogadoresRedCard = List.filled(7000, 0);
  globalJogadoresYellowCard = List.filled(7000, 0);
  globalJogadoresInjury = List.filled(7000, 0);

  //Clubes
  //500 = numero com folga de clubes
  globalClubsLeaguePoints = List.filled(500, 0);
  globalClubsLeagueGM = List.filled(500, 0);
  globalClubsLeagueGS = List.filled(500, 0);
  globalClubsInternationalPoints = List.filled(500, 0);
  globalClubsInternationalGM = List.filled(500, 0);
  globalClubsInternationalGS = List.filled(500, 0);
  
}

void trocaClubesRebaixamento(){
  funcRebaixamentoLeague(LeagueOfficialNames().inglaterra1,LeagueOfficialNames().inglaterra2,3);
  funcRebaixamentoLeague(LeagueOfficialNames().brasil1,LeagueOfficialNames().brasil2,3);
}


void atualizaStatusJogadores(){
  for(int id=0;id<globalJogadoresIndex.length;id++){

    //Set New Overall
    globalJogadoresOverall[id] += newOverall(globalJogadoresAge[id]);

    //+1 Ano de idade
    globalJogadoresAge[id]++;

    //Transferencia
    transferenciaJogador(id);
  }
}