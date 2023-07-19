import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_names.dart';

import '../values/league_clubs.dart';

class InternationalLeague{

  LeagueOfficialNames leagueOfficialNames = LeagueOfficialNames();
  String clubsIDkey = 'clubsID';

  ////////////////////////////////////////////////////////
  // RESET
  ///////////////////////////////////////////////////////
  resetAll(){
    reset(leagueOfficialNames.championsLeague);
    reset(leagueOfficialNames.libertadores);
    reset(leagueOfficialNames.europaLeagueOficial);
    reset(leagueOfficialNames.copaSulAmericana);

    reset32Zeros(leagueOfficialNames.libertadores);
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
    // Tirar essa parte comentada
    //if(semana<semanasJogosInternacionais.first && ano==anoInicial || semanasJogosInternacionais.first==1) {
      for (var internationalName in internationalLeagueNames) {
        reset32Zeros(internationalName);
        defineDefaultTeams(internationalName);
      }
    //}
  }
  defineDefaultTeams(String leagueInternational){
      for(int i=0; i<32; i++) {
        if(leagueInternational == leagueOfficialNames.championsLeague) {
          setClub(leagueInternational, clubsAllNameList.indexOf(defaultChampionsLeagueClubs[i]), i);
        }
        if(leagueInternational == leagueOfficialNames.libertadores){
          setClub(leagueInternational, clubsAllNameList.indexOf(defaultLibertadoresClubs[i]), i);
        }
        if(leagueInternational == leagueOfficialNames.europaLeagueOficial){
          setClub(leagueInternational, clubsAllNameList.indexOf(defaultEuropaLeagueClubs[i]), i);
        }
        if(leagueInternational == leagueOfficialNames.copaSulAmericana){
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

  getGoal(String internationalName, int rodadaNumber, int clubID){
    return globalHistoricInternationalGoalsAll[ano][internationalName][rodadaNumber][clubID];
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

  String checkContainsStr(int clubID, String internationalName, String val){
    if(checkContains(clubID, internationalName)){
      return internationalName;
    }else{
      return val;
    }
  }

  bool checkContains(int clubID, String internationalName){
    try{
      if(globalInternational[internationalName][clubsIDkey].contains(clubID)){
        return true;
      }else{
        return false;
      }
    }catch(e){
      return false;
    }
  }

}

