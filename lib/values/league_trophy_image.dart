import 'package:fifa/values/league_names.dart';

getTrophyImage(String leagueName){
  String trophyName = 'trophyliga';
  if(leagueName == LeagueOfficialNames().brasil1){trophyName = 'trophybrasileirao';}
  if(leagueName == LeagueOfficialNames().inglaterra1){trophyName = 'trophypremier';}
  if(leagueName == LeagueOfficialNames().italia1){trophyName = 'trophyitalia';}
  if(leagueName == LeagueOfficialNames().alemanha1){trophyName = 'trophybundesliga';}
  if(leagueName == LeagueOfficialNames().espanha1){trophyName = 'trophylaliga';}
  if(leagueName == LeagueOfficialNames().franca1){trophyName = 'trophyligue1';}
  if(leagueName == LeagueOfficialNames().brasil2){trophyName = 'trophy2division';}

  if(leagueName == LeagueOfficialNames().libertadores){trophyName = 'trophylibertadores';}
  if(leagueName == LeagueOfficialNames().championsLeague){trophyName = 'trophychampions';}

  return trophyName;
}
