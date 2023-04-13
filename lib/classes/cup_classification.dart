import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_divisions.dart';
import 'package:fifa/values/league_names.dart';

class CupClassification{
  String keyClassificados = "Classificados";
  String keyPrePhase = "Pre-fase";

  setClubs(){
    globalCup = {};
    for (String leagueName in getAvailableLeaguesNames()){
      Map<String, Map<String, dynamic>> mapa = definePrePhaseTeams(getDivisionClassification(leagueName), leagueName);
      globalCup = {...globalCup, ...mapa};
    }
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

  Map<String, Map<String, dynamic>> definePrePhaseTeams(List allTeamsLeague, String leagueName){
    List classified = [];
    List prePhase = [];
    if(allTeamsLeague.length>=4 && allTeamsLeague.length<8){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 4).toList();
    }
    else if(allTeamsLeague.length>=8 && allTeamsLeague.length<16){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 8).toList();
    }
    else if(allTeamsLeague.length>=16 && allTeamsLeague.length<32){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 16).toList();
    }
    else if(allTeamsLeague.length>=32 && allTeamsLeague.length<64){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 32).toList();
    }
    else if(allTeamsLeague.length>=64){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 64).toList();
    }

    prePhase = allTeamsLeague.where((team) => !classified.contains(team)).toList();

    Map<String, Map<String, dynamic>> mapa = {};
    mapa = {getCup(leagueName): {
                  "Classificados": classified,
                  "Pre-fase": prePhase,
    }};
    return mapa;
  }

  List<Club> getListClubsPrePhase(String cupName){
    Map<String, dynamic>? cupData = globalCup[cupName];
    List clubsIDs = cupData![CupClassification().keyPrePhase];
    List<Club> clubs = [];
    for (int clubID in clubsIDs) {
      clubs.add(Club(index: clubID));
    }
    return clubs;
  }

  List<Club> getListClubsClassificados(String cupName){
    Map<String, dynamic>? cupData = globalCup[cupName];
    List clubsIDs = cupData![CupClassification().keyClassificados];
    List<Club> clubs = [];
    for (int clubID in clubsIDs) {
      clubs.add(Club(index: clubID));
    }
    return clubs;
  }

}