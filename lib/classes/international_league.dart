import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_names.dart';

import '../values/league_clubs.dart';

class InternationalLeague{

  String clubsIDkey = 'clubsID';

  ////////////////////////////////////////////////////////
  // RESET
  ///////////////////////////////////////////////////////
  resetAll(){
    reset(LeagueOfficialNames().championsLeague);
    reset(LeagueOfficialNames().libertadores);
    reset(LeagueOfficialNames().europaLeagueOficial);
    reset(LeagueOfficialNames().copaSulAmericana);
  }
  reset(String internationalName){
    globalInternational[internationalName] = {};
    globalInternational[internationalName][clubsIDkey] = [];
  }
  reset32Zeros(String internationalName){
    globalInternational[internationalName][clubsIDkey] = List.filled(32, 0);
  }
  ////////////////////////////////////////////////////////
  // SET
  ///////////////////////////////////////////////////////
  setDefaultTeams(){
    if(semana<semanasJogosInternacionais[0] && ano==anoInicial || semanasJogosInternacionais[0]==1) {
      for (var internationalName in internationalLeagueNames) {
        reset32Zeros(internationalName);
        defineDefaultTeams(internationalName);
      }
    }
  }
  defineDefaultTeams(String leagueInternational){
      for(int i=0; i<32; i++) {
        if(leagueInternational == LeagueOfficialNames().championsLeague) {
          setClub(leagueInternational, clubsAllNameList.indexOf(defaultChampionsLeagueClubs[i]), i);
        }
        if(leagueInternational == LeagueOfficialNames().libertadores){
          setClub(leagueInternational, clubsAllNameList.indexOf(defaultLibertadoresClubs[i]), i);
        }
        if(leagueInternational == LeagueOfficialNames().europaLeagueOficial){
          setClub(leagueInternational, clubsAllNameList.indexOf(defaultEuropaLeagueClubs[i]), i);
        }
        if(leagueInternational == LeagueOfficialNames().copaSulAmericana){
          setClub(leagueInternational, clubsAllNameList.indexOf(defaultSulAmericanaClubs[i]), i);
        }
      }
  }
  addClub(String internationalName, int clubID){
    List atual = List.from(globalInternational[internationalName][clubsIDkey]);
    atual.add(clubID);
    globalInternational[internationalName][clubsIDkey] = atual;
  }

  setClub(String internationalName, int clubID, int position){
    globalInternational[internationalName][clubsIDkey][position] = clubID;
  }

  sortClubs({required String internationalName, required int position1,required int position2}){
    int aux = globalInternational[internationalName][clubsIDkey][position1];
    globalInternational[internationalName][clubsIDkey][position1] = globalInternational[internationalName][clubsIDkey][position2];
    globalInternational[internationalName][clubsIDkey][position2] = aux;
  }


  ////////////////////////////////////////////////////////
  // GET
  ///////////////////////////////////////////////////////
  List getClubs(String internationalName){
    return globalInternational[internationalName][clubsIDkey];
  }
  int getClub(String internationalName, int position){
    return globalInternational[internationalName][clubsIDkey][position];
  }
  int searchClub(String internationalName, int clubID){
    List clubs = List.from(globalInternational[internationalName][clubsIDkey]);
    return clubs.indexOf(clubID);
  }

  String checkContains(int clubID, String internationalName, String val){
    if(globalInternational[internationalName][clubsIDkey].contains(clubID)){
      return internationalName;
    }else{
      return val;
    }
  }

}

