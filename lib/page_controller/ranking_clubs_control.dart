import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_divisions.dart';
import 'package:fifa/values/league_names.dart';

class RankingClubsControl{

  List clubsOVR = []; //criado no init
  List copyClubsName = [];
  List copyClubsNameNational = [];
  List copyClubsNameContinental = [];
  My my = My();

  organizeRanking(){

    //REORGANIZA ORDEM
    for (var leagueID in leaguesListRealIndex) {//element: 0-70
      List allClubsIDList = League(index: leagueID).getAllClubsIDList();
      for(int i=0; i<allClubsIDList.length; i++) {
        Club clubClass = Club(index: allClubsIDList[i]);
        clubsOVR.add(clubClass.getOverall());
        copyClubsName.add(clubClass.name);
      }
    }

    for(int i=0; i<clubsOVR.length-1; i++) {
      for(int k=i+1; k<clubsOVR.length; k++) {
        if(clubsOVR[k] > clubsOVR[i]){
          late double auxiliarDouble;
          late String auxiliarString;
          auxiliarDouble = clubsOVR[i];clubsOVR[i] = clubsOVR[k]; clubsOVR[k] = auxiliarDouble;
          auxiliarString = copyClubsName[i];copyClubsName[i] = copyClubsName[k]; copyClubsName[k] = auxiliarString;
        }
      }
    }

  }

  organizeMyNationalRanking(){
    copyClubsNameNational = List.from(copyClubsName);
    List allClubsName = [];
    List divisionsName = Divisions().leagueDivisionsStructure(my.campeonatoName);
    for(String leagueName in divisionsName){
        int leagueIndex = leaguesIndexFromName[leagueName];
        allClubsName += League(index: leagueIndex).allClubsName;
    }
    copyClubsNameNational.removeWhere((element) => !allClubsName.contains(element) );
  }

  organizeMyContinentalRanking(){
    copyClubsNameContinental = List.from(copyClubsName);
    String myContinent = Club(index: my.clubID).continent;
    List allClubsName = [];
    for(String clubName in copyClubsName){
      int leagueIndex = clubsAllNameList.indexOf(clubName);
      if(Club(index: leagueIndex).continent.contains(myContinent)){
        allClubsName.add(clubName);
      }
    }
    copyClubsNameContinental.removeWhere((element) => !allClubsName.contains(element) );
  }

}