import 'package:fifa/classes/classification.dart';
import 'package:fifa/values/league_divisions.dart';
import 'package:fifa/values/league_names.dart';

class CupClassification{

  setClubs(String leagueName){
    definePrePhaseTeams(getDivisionClassification(leagueName), leagueName);
  }
  getDivisionClassification(String leagueName){
    List<String> divisionLeagueNames = Divisions().leagueDivisionsStructure(leagueName);
    //MAPA COM O HISTÓRICO DE CLASSIFICAÇÃO DE CADA DIVISÃO
    List listAllClubsClassificationsInLeague = [];
    for( String division in divisionLeagueNames){
      int leagueID = leaguesIndexFromName[division];
      List classificationClubsIndexes = Classification(leagueIndex: leagueID).classificationClubsIndexes;
      listAllClubsClassificationsInLeague.add(classificationClubsIndexes);
    }
    //ARRAY TO LIST
    listAllClubsClassificationsInLeague =  listAllClubsClassificationsInLeague.expand((list) => list).toList();

    return listAllClubsClassificationsInLeague;
  }

  definePrePhaseTeams(List allTeamsLeague, String leagueName){
    List classified = [];
    List prePhase = [];
    if(allTeamsLeague.length>=4 && allTeamsLeague.length<8){
       classified = allTeamsLeague.take(4).toList();
    }
    else if(allTeamsLeague.length>=8 && allTeamsLeague.length<16){
       classified = allTeamsLeague.take(8).toList();
    }
    else if(allTeamsLeague.length>=16 && allTeamsLeague.length<32){
       classified = allTeamsLeague.take(16).toList();
    }
    else if(allTeamsLeague.length>=32 && allTeamsLeague.length<64){
       classified = allTeamsLeague.take(32).toList();
    }
    else if(allTeamsLeague.length>=64){
       classified = allTeamsLeague.take(64).toList();
    }
    prePhase = (classified + allTeamsLeague).toSet().toList();

    Map mapa = {leagueName: {"Classificados": classified, "Pre-fase": prePhase}};
    return mapa;
  }

}