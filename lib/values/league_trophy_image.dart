import 'package:fifa/values/league_names.dart';

getTrophyImage(String leagueName){
  String trophyName = 'trophyliga';
  if(leagueName == LeagueOfficialNames().brasil1){'trophybrasileirao';}
  if(leagueName == LeagueOfficialNames().inglaterra1){'trophypremier';}
  if(leagueName == LeagueOfficialNames().italia1){'trophyitalia';}
  if(leagueName == LeagueOfficialNames().alemanha1){'trophybundesliga';}
  if(leagueName == LeagueOfficialNames().espanha1){'trophylaliga';}
  if(leagueName == LeagueOfficialNames().franca1){'trophyligue1';}
  if(leagueName == LeagueOfficialNames().brasil2){'trophy2division';}

  if(leagueName == LeagueOfficialNames().libertadores){'trophylibertadores';}
  if(leagueName == LeagueOfficialNames().championsLeague){'trophychampions';}

}
