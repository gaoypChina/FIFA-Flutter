import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/classes/functions/internat_league_manipulation.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';

class HistoricChampionsLeague{

  List get32finalClassificationIDs(int year, String internationalLeague){
    if(InternationalLeagueManipulation().internationalLeagueHasSimulation(internationalLeague)){
      return [];
    }
    Map map = globalHistoricInternationalGoalsAll[year][internationalLeague][Name().oitavas];
    List clubs16ID = map.keys.toList();
    map = globalHistoricInternationalGoalsAll[year][internationalLeague][Name().quartas];
    List clubs8ID = map.keys.toList();
    map = globalHistoricInternationalGoalsAll[year][internationalLeague][Name().semifinal];
    List clubs4ID = map.keys.toList();
    List clubs2ID = getFinalClubsIDOrdered(year, internationalLeague);
    List finalClassificationIDs = [];
    clubs16ID.removeWhere((element) => clubs8ID.contains(element));
    clubs8ID.removeWhere((element) => clubs4ID.contains(element));
    clubs4ID.removeWhere((element) => clubs2ID.contains(element));
    finalClassificationIDs = clubs2ID + clubs4ID + clubs8ID + clubs16ID;
    return finalClassificationIDs;
  }


  List getFinalClubsIDOrdered(int year, String leagueName){
    Map map = globalHistoricInternationalGoalsAll[year][leagueName][Name().finale];
    //Final Result
    map = map[ResultDict().keyIda][1];

    List clubs2IDOrdered = [];
    if(map[ResultDict().keyGol1] > map[ResultDict().keyGol2]){
      int clubID1 = clubsAllNameList.indexOf(map[ResultDict().keyTeamName1]);
      int clubID2 = clubsAllNameList.indexOf(map[ResultDict().keyTeamName2]);
      clubs2IDOrdered = [clubID1, clubID2];
    }else{
      int clubID1 = clubsAllNameList.indexOf(map[ResultDict().keyTeamName2]);
      int clubID2 = clubsAllNameList.indexOf(map[ResultDict().keyTeamName1]);
      clubs2IDOrdered = [clubID1, clubID2];
    }
    return clubs2IDOrdered;
  }


}