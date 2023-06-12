import 'package:fifa/values/league_names.dart';

class InternationalLeagueManipulation{

  String funcGetInternationalLeagueName({required int indexLeague}) {
    if(indexLeague<50){
      return LeagueOfficialNames().championsLeague;
    }else if(indexLeague>=50 && indexLeague <70){
      return LeagueOfficialNames().libertadores;
    }else{
      return LeagueOfficialNames().resto;
    }
  }

  bool internationalLeagueHasSimulation(String name){
    if(name == LeagueOfficialNames().resto){
      return true;
    }else{
      return false;
    }
  }
  String whenNotPlayInternationalLeague(String name){
    if(internationalLeagueHasSimulation(name)){
      return LeagueOfficialNames().championsLeague;
    }
    return name;
  }

  int funcGetInternationalLeagueIndex({required String internationalLeagueName}) {
    return internationalLeagueNames.indexOf(internationalLeagueName);
  }

  int funcNInternationalLeagues(){
    return internationalLeagueNames.length;
  }
  int funcNLeaguesInTargedInternationalLeague({required String internationalLeagueName}){
    int qntd = 0;
    for(int i=0;i<nLeaguesTotal;i++){
      int indexLeague = leaguesListRealIndex[i]; //index do campeonato brasileiro, premier league etc...
      String internationalNameToCompare = InternationalLeagueManipulation().funcGetInternationalLeagueName(indexLeague: indexLeague);
      if(internationalLeagueName == internationalNameToCompare){
        qntd++;
      }
    }
    return qntd;
  }
}





