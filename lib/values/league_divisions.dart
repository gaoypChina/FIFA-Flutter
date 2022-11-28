import 'package:fifa/values/league_names.dart';

class Divisions{

  List<String> leagueDivisionsStructure(String leagueName){
    List<String> leagueNames = [];
    leagueNames = [LeagueOfficialNames().inglaterra1,LeagueOfficialNames().inglaterra2,LeagueOfficialNames().inglaterra3];
    if(checkDivision(leagueNames,leagueName)){
      return leagueNames;
    }
    leagueNames = [LeagueOfficialNames().italia1,LeagueOfficialNames().italia2];
    if(checkDivision(leagueNames,leagueName)){
      return leagueNames;
    }
    leagueNames = [LeagueOfficialNames().espanha1,LeagueOfficialNames().espanha2];
    if(checkDivision(leagueNames,leagueName)){
      return leagueNames;
    }
    leagueNames = [LeagueOfficialNames().alemanha1,LeagueOfficialNames().alemanha2];
    if(checkDivision(leagueNames,leagueName)){
      return leagueNames;
    }
    leagueNames = [LeagueOfficialNames().franca1,LeagueOfficialNames().franca2];
    if(checkDivision(leagueNames,leagueName)){
      return leagueNames;
    }
    leagueNames = [LeagueOfficialNames().brasil1,LeagueOfficialNames().brasil2,LeagueOfficialNames().brasil3];
    if(checkDivision(leagueNames,leagueName)){
      return leagueNames;
    }
    return [leagueName];
  }
  bool checkDivision(List leagueNames,String leagueName){
    if(leagueNames.contains(leagueName)){
      return true;
    }else{
      return false;
    }
  }

  String league1stDivisionName(String name){
    return leagueDivisionsStructure(name)[0];
  }

  bool is1stDivision(String name){
    if(leagueDivisionsStructure(name)[0] == name){
      return true;
    }else{
      return false;
    }
  }

  bool is2ndDivision(String name){
    if(leagueDivisionsStructure(name).length>1 && leagueDivisionsStructure(name)[1] == name){
      return true;
    }else{
      return false;
    }
  }
  bool is3ndDivision(String name){
    if(leagueDivisionsStructure(name).length>2  && leagueDivisionsStructure(name)[2] == name){
      return true;
    }else{
      return false;
    }
  }

}
