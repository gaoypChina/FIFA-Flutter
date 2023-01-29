import 'package:fifa/classes/league.dart';
import 'package:fifa/values/league_names.dart';

int funcNumberClubsTotal(){
  int numberClubsTotal = 0;
  for (var leagueID in leaguesListRealIndex) {//element: 0-70
    numberClubsTotal += League(index: leagueID).nClubs;
  }
  return numberClubsTotal;
}