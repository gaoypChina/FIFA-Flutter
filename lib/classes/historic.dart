import '../global_variables.dart';
import 'club.dart';
import 'league.dart';

class HistoricClubYear{

  late String clubName;
  late String leagueName;
  late int position;
  late String internationalLeagueName;

  HistoricClubYear(int year){
    Map data = globalHistoricMyClub[year];
    clubName = Club(index: data['clubID']).name;
    leagueName = League(index: data['leagueID']).name;
    List clubsIDs = HistoricFunctions().funcHistoricListAll(year, leagueName);
    position = clubsIDs.indexOf(data['clubID'])+1;
    internationalLeagueName = League(index: data['leagueID']).internationalLeagueName;
  }

}

class HistoricFunctions{

  int myLeagueTitles(){
    int leagueTitlesQntd = 0;
    for(int year=anoInicial;year<ano;year++){
      int position = HistoricClubYear(year).position;
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


