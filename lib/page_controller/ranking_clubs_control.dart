import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/values/league_names.dart';

class RankingClubsControl{

  List clubsOVR = []; //criado no init, e reutilizado depois no widget
  List copyClubsName = [];

  organizarRanking(){

    //REORGANIZA ORDEM
    for (var leagueID in leaguesListRealIndex) {//element: 0-70
      List allClubsIDList = League(index: leagueID).getAllClubsIDList();
      for(int i=0; i<allClubsIDList.length; i++) {
        clubsOVR.add(Club(index: allClubsIDList[i]).getOverall());
        copyClubsName.add(Club(index: allClubsIDList[i]).name);
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

}