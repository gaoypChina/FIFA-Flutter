import 'package:fifa/classes/international_league.dart';
import 'package:fifa/values/league_names.dart';

bool isPlayingInternationalFunc(int clubID, String internationalLeagueName){
  return InternationalLeague().checkContains(clubID, internationalLeagueName);
}

String getPlayingInternationalName(int clubID, String originalIntName){
  String val = originalIntName;
    //CONFERE SE JOGA EUROPA LEAGUE, LIBERTADORES, CHAMPIONS...
    for (String internationalLeagueName in internationalLeagueNames) {
      val = InternationalLeague().checkContainsStr(clubID, internationalLeagueName, val);
    }
  return val;
}