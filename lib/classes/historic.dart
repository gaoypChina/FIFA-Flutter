import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/values/league_divisions.dart';

import '../global_variables.dart';
import 'club.dart';
import 'league.dart';

class HistoricClubYear{

  late int clubID;
  late String clubName;
  late int leagueID;
  late String leagueName;
  late int leaguePosition;
  late String internationalLeagueName;
  late String internationalLeaguePosition;
  late bool isInternationalChampion;

  HistoricClubYear(int year){
    Map data = globalHistoricMyClub[year];
    clubID = data['clubID'];
    clubName = Club(index: clubID).name;
    leagueID = data['leagueID'];
    leagueName = League(index: leagueID).name;
    List clubsIDs = HistoricFunctions().funcHistoricListAll(year, leagueName);
    leaguePosition = clubsIDs.indexOf(clubID)+1;

    internationalLeagueName = League(index: leagueID).internationalLeagueName;
    internationalLeaguePosition = '';
    checkPositionClubPlayedGroupPhase(year);
    checkPositionClubPlayedMataMata(year);

  }

  checkPositionClubPlayedGroupPhase(int year){
    try {
      List allParticipantsClubsID = globalHistoricInternationalClassification[year][internationalLeagueName];
      if (allParticipantsClubsID.contains(clubID)) {
        internationalLeaguePosition = Name().groupsPhase;
      }
    }catch(e){
      //print('O clube joga um campeonato internacional que nao existe Ex: Resto do mundo);
    }
  }

  checkPositionClubPlayedMataMata(int year){
    isInternationalChampion = false;

    try {
      Map mataMataPhases = globalHistoricInternationalGoalsAll[year][internationalLeagueName];
      for (String phases in mataMataPhases.keys) {
        if (mataMataPhases[phases].containsKey(clubID)) {
          internationalLeaguePosition = phases;
          if (phases == Name().finale) {
            List clubsFinalID = listTeamsInFinal(mataMataPhases[phases]);
            if (mataMataPhases[phases][clubID].first >
                mataMataPhases[phases][clubsFinalID[0]].first) {
              isInternationalChampion = true;
            }
          }
        }
      }
    }catch(e){
      //print('O clube joga um campeonato internacional que nao existe Ex: Resto do mundo);
    }
  }
  List listTeamsInFinal(Map mapData){
    List clubsFinalID = [];
    for(int finalClubID in mapData.keys){
      clubsFinalID.add(finalClubID);
    }
    clubsFinalID.remove(clubID);
    return clubsFinalID;
  }
}



class HistoricFunctions{

  int myLeagueTitles(){
    int leagueTitlesQntd = 0;
    for(int year=anoInicial;year<ano;year++){
      int position = HistoricClubYear(year).leaguePosition;
      if(position == 1){
        leagueTitlesQntd++;
      }
    }
    return leagueTitlesQntd;
  }

  int myInternationalTitle(){
    int internationalTitlesQntd = 0;
    for(int year=anoInicial;year<ano;year++) {
      if(HistoricClubYear(year).isInternationalChampion){
        internationalTitlesQntd++;
      }
    }
    return internationalTitlesQntd;
  }

  List funcHistoricListAll(int year, String leagueName){
    Map leagueClassification = globalHistoricLeagueClassification;
    leagueClassification = leagueClassification[year];
    List classificationIDs = leagueClassification[leagueName];
    return classificationIDs;
  }

  int funcHistoricListFromClubID(int year, String leagueName, int clubID){
    List divisionsNames = Divisions().leagueDivisionsStructure(leagueName);
    for(String division in divisionsNames){
      List classificationIDs = funcHistoricListAll(year, division);
      if(classificationIDs.contains(clubID)){
        int position = classificationIDs.indexOf(clubID) + 1;
        if(Divisions().is2ndDivision(division)){
          position += 20;
        }
        else if(Divisions().is3ndDivision(division)){
          position += 40;
        }
        return position;
      }
    }
    return 0;
  }

}
