import 'package:fifa/values/league_names.dart';

class Divisions{

  List<String> leagueDivisionsStructure(String leagueName){

    LeagueOfficialNames l = LeagueOfficialNames();
    List<List<String>> leagueNames = [
      [l.inglaterra1, l.inglaterra2, l.inglaterra3],
      [l.italia1, l.italia2],
      [l.espanha1, l.espanha2],
      [l.alemanha1, l.alemanha2],
      [l.franca1, l.franca2],
      [l.brasil1, l.brasil2, l.brasil3, l.brasil4],
    ];

    for (List<String> divisions in leagueNames) {
      if (divisions.contains(leagueName)) {
        return divisions;
      }
    }

    return [leagueName];
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
    if(leagueDivisionsStructure(name).length > 1 && leagueDivisionsStructure(name)[1] == name){
      return true;
    }else{
      return false;
    }
  }
  bool is3ndDivision(String name){
    if(leagueDivisionsStructure(name).length > 2  && leagueDivisionsStructure(name)[2] == name){
      return true;
    }else{
      return false;
    }
  }

}
