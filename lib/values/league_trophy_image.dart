import 'package:fifa/values/league_names.dart';

getTrophyImage(String leagueName){
  String trophyName = 'trophyliga';
  if(leagueName == LeagueOfficialNames().inglaterra1){trophyName = 'trophypremier';}
  if(leagueName == LeagueOfficialNames().inglaterra2){trophyName = 'trophy2division';}
  if(leagueName == LeagueOfficialNames().inglaterra3){trophyName = 'trophy2division';}
  if(leagueName == LeagueOfficialNames().italia1){trophyName = 'trophyitalia';}
  if(leagueName == LeagueOfficialNames().italia2){trophyName = 'trophyitalia';}
  if(leagueName == LeagueOfficialNames().alemanha1){trophyName = 'trophybundesliga';}
  if(leagueName == LeagueOfficialNames().alemanha2){trophyName = 'trophybundesliga';}
  if(leagueName == LeagueOfficialNames().espanha1){trophyName = 'trophylaliga';}
  if(leagueName == LeagueOfficialNames().espanha2){trophyName = 'trophylaliga';}
  if(leagueName == LeagueOfficialNames().franca1){trophyName = 'trophyligue1';}
  if(leagueName == LeagueOfficialNames().franca2){trophyName = 'trophyligue1';}
  if(leagueName == LeagueOfficialNames().ptHol){trophyName = 'trophyportugal';}
  if(leagueName == LeagueOfficialNames().turquiaGrecia){trophyName = 'trophyturquia';}
  if(leagueName == LeagueOfficialNames().ligaEuropa){trophyName = 'trophyeuropaleague';}
  if(leagueName == LeagueOfficialNames().lesteEuropeu){trophyName = 'trophyrussia';}
  if(leagueName == LeagueOfficialNames().brasil1){trophyName = 'trophybrasileirao';}
  if(leagueName == LeagueOfficialNames().brasil2){trophyName = 'trophy2division';}
  if(leagueName == LeagueOfficialNames().brasil3){trophyName = 'trophy2division';}
  if(leagueName == LeagueOfficialNames().argentina){trophyName = 'trophyargentina';}
  if(leagueName == LeagueOfficialNames().sulamericano){trophyName = 'trophysulamericana';}
  if(leagueName == LeagueOfficialNames().colombia){trophyName = 'trophyliga';}
  if(leagueName == LeagueOfficialNames().mexico){trophyName = 'trophymexico';}
  if(leagueName == LeagueOfficialNames().estadosUnidos){trophyName = 'trophymls';}
  if(leagueName == LeagueOfficialNames().asia){trophyName = 'trophyasia';}
  if(leagueName == LeagueOfficialNames().africa){trophyName = 'trophyafrica';}
  if(leagueName == LeagueOfficialNames().outros){trophyName = 'trophychile';}

  if(leagueName == LeagueOfficialNames().libertadores){trophyName = 'trophylibertadores';}
  if(leagueName == LeagueOfficialNames().championsLeague){trophyName = 'trophychampions';}
  if(leagueName == LeagueOfficialNames().resto){trophyName = 'trophychampions';}

  if(leagueName == LeagueOfficialNames().mundial){trophyName = 'trophymundial';}

  return trophyName;
}
