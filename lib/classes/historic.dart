import 'package:fifa/classes/geral/name.dart';

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
    List allParticipantsClubsID = globalHistoricInternationalClassification[year][internationalLeagueName];
    if(allParticipantsClubsID.contains(clubID)){
      internationalLeaguePosition = Name().groupsPhase;
    }
  }

  checkPositionClubPlayedMataMata(int year){
    Map mataMataPhases = globalHistoricInternationalGoalsAll[year][internationalLeagueName];
    for(String phases in mataMataPhases.keys){
      if(mataMataPhases[phases].containsKey(clubID)){
        internationalLeaguePosition = phases;
      }
    }
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

  List funcHistoricListAll(int year, String leagueName){
    Map leagueClassification = globalHistoricLeagueClassification;
    leagueClassification = leagueClassification[year];
    List classificationIDs = leagueClassification[leagueName];
    return classificationIDs;
  }

}


