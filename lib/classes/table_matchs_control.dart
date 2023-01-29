import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/chaves.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

class MatchResultInternational{

  late int clubID1;
  late int clubID2;
  late String clubName1;
  late String clubName2;
  late int goals1;
  late int goals2;
  bool isAlreadyPlayed = false;

  MatchResultInternational({required int rodadaNumber, required int groupNumber, required int nConfronto, required String competitionName}){
    int internationalIndex = getInternationalLeagueNumber(competitionName); //0,1
      //PRA CHAMPIONS E PARA A LIBERTADORES
      int semanaDoJogo = semanasGruposInternacionais[rodadaNumber];
      List chave = Chaves().obterChave(semanaDoJogo, 0);
          int chaveConfronto = chave[nConfronto * 2];

          try{
            clubID1 = globalInternational32ClubsID[internationalIndex][4 * groupNumber + chaveConfronto];
          }catch(e){
            //CASO SEJA O PRIMEIRO ANO
            //Todo: refazer isso aqui
            clubName1 = getClubName(competitionName, 4 * groupNumber + chaveConfronto);
            clubID1 = clubsAllNameList.indexOf(clubName1);
          }

          int indexAdv04 = Chaves().chaveIndexAdvCampeonato(semanaDoJogo, 0, chaveConfronto)[0];


    try{
          clubID2 = globalInternational32ClubsID[internationalIndex][(4 * groupNumber) + indexAdv04];
    }catch(e){
      //CASO SEJA O PRIMEIRO ANO
      clubName2 = getClubName(competitionName, 4 * groupNumber + indexAdv04);
      clubID2 = clubsAllNameList.indexOf(clubName2);
    }
    clubName1 = Club(index: clubID1).name;
    clubName2 = Club(index: clubID2).name;

    goals1 = 0;
    goals2 = 0;

    try{
      goals1 = globalHistoricInternationalGoalsAll[competitionName][rodadaNumber][clubID1];
      goals2 = globalHistoricInternationalGoalsAll[competitionName][rodadaNumber][clubID2];
    }catch(e){
      //print('Significa que a variavel foi chamada em uma rodada que ainda nao foi simulada');
    }

    if(semanaDoJogo < semana) {
      isAlreadyPlayed = true;
    }
  }


  getClubName(String competitionName, int position){
    if(competitionName == LeagueOfficialNames().championsLeague){
      return defaultChampionsLeagueClubs[position];
    }
    if(competitionName == LeagueOfficialNames().libertadores){
      return defaultLibertadoresClubs[position];
    }
    if(competitionName == LeagueOfficialNames().europaLeagueOficial){
      return defaultEuropaLeagueClubs[position];
    }
    if(competitionName == LeagueOfficialNames().copaSulAmericana){
      return defaultSulAmericanaClubs[position];
    }
  }

}
