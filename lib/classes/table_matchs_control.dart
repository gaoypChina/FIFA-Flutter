import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/chaves.dart';
import 'package:fifa/classes/international_league.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

class MatchResultInternational{

  late Confronto confronto;

  MatchResultInternational({required int rodadaNumber, required int groupNumber, required int nConfronto, required String competitionName}){

      //PRA CHAMPIONS E PARA A LIBERTADORES
      int semanaDoJogo = semanasGruposInternacionais[rodadaNumber];
      List chave = Chaves().obterChave(semanaDoJogo, 0);
          int chaveConfronto = chave[nConfronto * 2];

          try{
            confronto.clubID1 = InternationalLeague().getClub(competitionName, 4 * groupNumber + chaveConfronto);
          }catch(e){
            //CASO SEJA O PRIMEIRO ANO
            confronto.clubName1 = getClubName(competitionName, 4 * groupNumber + chaveConfronto);
            confronto.clubID1 = clubsAllNameList.indexOf(confronto.clubName1);
          }

          int indexAdv04 = Chaves().chaveIndexAdvCampeonato(semanaDoJogo, 0, chaveConfronto)[0];


    try{
      confronto.clubID2 = InternationalLeague().getClub(competitionName, (4 * groupNumber) + indexAdv04);
    }catch(e){
      //CASO SEJA O PRIMEIRO ANO
      confronto.clubName2 = getClubName(competitionName, 4 * groupNumber + indexAdv04);
      confronto.clubID2 = clubsAllNameList.indexOf(confronto.clubName2);
    }
      confronto.clubName1 = Club(index: confronto.clubID1).name;
      confronto.clubName2 = Club(index: confronto.clubID2).name;


    try{
      confronto.setGoals(
          goal1: globalHistoricInternationalGoalsAll[competitionName][rodadaNumber][confronto.clubID1],
          goal2: globalHistoricInternationalGoalsAll[competitionName][rodadaNumber][confronto.clubID2],
      );
    }catch(e){
      //print('Significa que a variavel foi chamada em uma rodada que ainda nao foi simulada');
    }

    if(semanaDoJogo < semana) {
      confronto.hasGoals = true;
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
    //OUTRAS COMPETIÇÕES
    return "Arsenal";
  }

}
