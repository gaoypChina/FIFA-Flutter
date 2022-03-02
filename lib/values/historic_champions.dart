import 'package:fifa/values/club_names.dart';
import 'package:fifa/values/league_names.dart';


ClubName _clubName = ClubName();

  Map mapChampions(String leagueName){
    Map champions = {};
    if(leagueName == LeagueOfficialNames().inglaterra1){
      champions = {
        2021: [_clubName.manchestercity,],
        2020: [],
        2019: [],
        2018: [],
        2017: [],
        2016: [],
        2015: [],
      };
    }
    if(leagueName == LeagueOfficialNames().brasil1){
      champions = {
        2021: [],
        2020: [],
        2019: [],
        2018: [],
        2017: [],
        2016: [],
        2015: [],
      };
    }

    return champions;
  }
