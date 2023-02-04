import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/values/league_divisions.dart';
import 'package:fifa/values/league_names.dart';

class RankingClubsControl{

  List clubsOVR = []; //criado no init
  List<Club> clubs = [];
  List copyClubsName = [];
  List<Club> copyClubsNational = [];
  List<Club> copyClubsContinental = [];
  My my = My();

  organizeRanking(){
    //REORGANIZA ORDEM
    for (var leagueID in leaguesListRealIndex) {//element: 0-70
      //Search name by index;
      String leagueName = leaguesIndexFromName.keys.firstWhere((k) => leaguesIndexFromName[k] == leagueID, orElse: () => null);
      Map allClubsMap = clubNameMap[leagueName];
      List allClubsNameList = allClubsMap.values.toList();
      //List allClubsIDList = League(index: leagueID).getAllClubsIDList();
      customToast('LOADING: $leagueName');
      for(int i=0; i<allClubsNameList.length; i++) {
        int clubID = clubsAllNameList.indexOf(allClubsNameList[i]);
        Club clubClass = Club(index: clubID);
        clubs.add(clubClass);
        clubsOVR.add(clubClass.getOverall());
        copyClubsName.add(clubClass.name);
      }
    }

    for(int i=0; i<clubsOVR.length-1; i++) {
      for(int k=i+1; k<clubsOVR.length; k++) {
        if(clubsOVR[k] > clubsOVR[i]){
          late double auxiliarDouble;
          late String auxiliarString;
          late Club auxiliarClub;
          auxiliarDouble = clubsOVR[i];clubsOVR[i] = clubsOVR[k]; clubsOVR[k] = auxiliarDouble;
          auxiliarString = copyClubsName[i];copyClubsName[i] = copyClubsName[k]; copyClubsName[k] = auxiliarString;
          auxiliarClub = clubs[i];clubs[i] = clubs[k]; clubs[k] = auxiliarClub;
        }
      }
    }

  }

  organizeMyContinentalRanking(){
    String myContinent = Club(index: my.clubID).continent;
    copyClubsContinental = List.from(clubs);
    copyClubsContinental.removeWhere((club) => !club.continent.contains(myContinent));
  }

  organizeMyNationalRanking(){
    List divisionsName = Divisions().leagueDivisionsStructure(my.campeonatoName);
    List allClubsName = [];
    for(String leagueName in divisionsName){
      int leagueIndex = leaguesIndexFromName[leagueName];
      allClubsName += League(index: leagueIndex).allClubsName;
    }

    copyClubsNational = List.from(copyClubsContinental);
    copyClubsNational.removeWhere((club) => !allClubsName.contains(club.name));
  }

}