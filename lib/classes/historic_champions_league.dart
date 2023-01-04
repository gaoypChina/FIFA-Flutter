import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/functions/international_league.dart';
import 'package:fifa/global_variables.dart';

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
    List clubs2IDOrdered = map.keys.toList();
    //Ve quem ganhou a final
    if (map[clubs2IDOrdered.last][0] > map[clubs2IDOrdered.first][1]) {
      clubs2IDOrdered = [clubs2IDOrdered.last, clubs2IDOrdered.first];
    }
    return clubs2IDOrdered;
  }


}