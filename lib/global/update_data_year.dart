import 'package:fifa/global/global_variables.dart';

void funcUpdateDataAfterSeason(){
  trocaClubesRebaixamento();
  transferenciasJogadoresFinalAno();
  atualizaStatusJogadores();
  zeraGlobalVariables();
  historico();
  resetData();
  ano++;
}

resetData(){
  semana=1;
  rodada=1;
  alreadyChangedClubThisSeason = false;

  //Jogadores
  globalJogadoresIndex = [];
  globalJogadoresName = [];
  globalJogadoresClubIndex = [];
  globalJogadoresPosition = [];
  globalJogadoresNationality = [];
  globalJogadoresAge = [];
  globalJogadoresOverall = [];

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
  globalClubsLeaguePoints = List.filled(500, 0);
  globalClubsLeagueGM = List.filled(500, 0);
  globalClubsLeagueGS = List.filled(500, 0);
  globalClubsInternationalPoints = List.filled(500, 0);
  globalClubsInternationalGM = List.filled(500, 0);
  globalClubsInternationalGS = List.filled(500, 0);
}



void trocaClubesRebaixamento(){

}

void transferenciasJogadoresFinalAno(){

}

void atualizaStatusJogadores(){

}
void zeraGlobalVariables(){
  globalJogadoresLeagueMatchs = List.filled(7000, 0);
  globalJogadoresLeagueGoals = List.filled(7000, 0);
  globalJogadoresLeagueAssists = List.filled(7000, 0);
  globalJogadoresInternationalMatchs = List.filled(7000, 0);
  globalJogadoresInternationalGoals = List.filled(7000, 0);
  globalJogadoresInternationalAssists = List.filled(7000, 0);
  globalJogadoresRedCard = List.filled(7000, 0);
  globalJogadoresYellowCard = List.filled(7000, 0);

  //Clubes
  globalClubsLeaguePoints = List.filled(500, 0);
  globalClubsLeagueGM = List.filled(500, 0);
  globalClubsLeagueGS = List.filled(500, 0);
  globalClubsInternationalPoints = List.filled(500, 0);
  globalClubsInternationalGM = List.filled(500, 0);
  globalClubsInternationalGS = List.filled(500, 0);
}

void historico(){

}