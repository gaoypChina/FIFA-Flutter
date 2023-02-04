import 'package:fifa/classes/functions/international_league_manipulation.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/international_league.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

bool isPlayingInternationalFunc(int clubID, String internationalLeagueName){
  return InternationalLeague().checkContains(clubID, internationalLeagueName);
}

String getPlayingInternationalName(int clubID, String originalIntName){
  String val = originalIntName;
  //FASE DE GRUPOS
  if(Semana(semana).isJogoGruposInternacional){
    //CONFERE SE JOGA EUROPA LEAGUE, LIBERTADORES, CHAMPIONS...
    for (var internationalLeagueName in internationalLeagueNames) {
      val = InternationalLeague().checkContainsStr(clubID, internationalLeagueName, val);
    }
  }
  //MATA-MATA
  else if(Semana(semana).isJogoMataMataInternacional){
    for(int i=0; i<InternationalLeagueManipulation().funcNInternationalLeagues();i++){
      String internationalName = InternationalLeagueManipulation().funcGetInternationalLeagueNameFromIndex(internationalLeagueIndex: i);
      try{
        List listIDs = globalInternationalMataMataClubsID[internationalName][Semana(semana).semanaStr];
        if(listIDs.contains(clubID)){
          val = internationalName;
        }
      }catch(e){
        //print('variavel globalInternationalMataMataClubsID ainda nao criada');
      }

    }
  }

  return val;
}