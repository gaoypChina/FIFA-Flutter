import 'package:fifa/classes/functions/internat_league_manipulation.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/values/league_divisions.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

class LeagueConfigController{
  late List leagueNames;
  late TabController tabController;

  LeagueConfigController(){
    leagueNames = getAvailableLeaguesNames();
  }

  LeagueConfigIndividual getData(String leagueName){
    return  LeagueConfigIndividual(leagueName);
  }



}

class LeagueConfigIndividual{

  late String leagueName;
  late int leagueID;
  late String relegatedLeagueName;
  late int relegatedLeagueID;
  late String internationalLeague;
  late int nRelegated;
  late int nInternationalClassified;
  late int nTeams;

  LeagueConfigIndividual(this.leagueName){
    init();
  }

  init(){
    leagueID = leaguesIndexFromName[leagueName];
    Map clubsInLeague = clubNameMapImmutable[leagueName];
    nTeams = clubsInLeague.keys.length;
    try{
      nRelegated = nTeamsRelegated[leagueName];
    }catch(e){nRelegated =0;}
    internationalLeague = InternationalLeagueManipulation().funcGetInternationalLeagueName(indexLeague: leagueID);
    try{
      nInternationalClassified = nTeamsClassified[leagueName];
    }catch(e){nInternationalClassified =0;}

    if(nRelegated>0){
      List listDivisions = Divisions().leagueDivisionsStructure(leagueName);
      int indexDivision = listDivisions.indexOf(leagueName);
      relegatedLeagueName = listDivisions[indexDivision+1];
      relegatedLeagueID = leaguesIndexFromName[relegatedLeagueName];
    }
  }

  ////////////////////////////////
  increaseNTeams(){
    if(nTeams<=gLOBALMAXCLUBSINLEAGUE  && nTeamsLeagueOutros()>2){
      addTeam(nTeams-1);
      addTeam(nTeams-2);
    }
  }
  addTeam(int index){
    String teamToAdd = clubNameMapImmutable[LeagueOfficialNames().outros][index];
    Map league = clubNameMapImmutable[leagueName];
    int nTeamsLeague = league.keys.length;
    clubNameMapImmutable[leagueName][nTeamsLeague] = teamToAdd;
    clubNameMapImmutable[LeagueOfficialNames().outros].remove(index);
  }

  decreaseNTeams(){
    if(nTeams>2 && nTeamsLeagueOutros()<=gLOBALMAXCLUBSINLEAGUE){
      removeTeam(nTeams-1);
      removeTeam(nTeams-2);
    }
  }
  nTeamsLeagueOutros(){
    Map leagueOutros = clubNameMapImmutable[LeagueOfficialNames().outros];
    return leagueOutros.keys.length;
  }

  removeTeam(int index){
    String teamToRemove = clubNameMapImmutable[leagueName][index];
    clubNameMapImmutable[LeagueOfficialNames().outros][nTeamsLeagueOutros()] = teamToRemove;
    clubNameMapImmutable[leagueName].remove(index);
  }


  ////////////////////////////////
  increaseRelegated(){
    if(nRelegated<8 && nRelegated<nTeams){
      nTeamsRelegated[leagueName]++;
      init();
    }
  }
  decreaseRelegated(){
    if(nRelegated>0){
      nTeamsRelegated[leagueName]--;
      init();
    }
  }

}
