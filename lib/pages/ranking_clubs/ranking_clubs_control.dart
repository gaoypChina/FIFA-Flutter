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
  Map<String, double> leagueNames = {};
  My my = My();

  organizeRanking(){
    //REORGANIZA ORDEM
    for (var leagueID in leaguesListRealIndex) {//element: 0-70
      //Search name by index;
      String leagueName = leaguesIndexFromName.keys.firstWhere((k) => leaguesIndexFromName[k] == leagueID, orElse: () => null);
      Map allClubsMap = clubNameMap[leagueName];
      //Filtra os clubes da liga
      List allClubsNameList = allClubsMap.values.toList();
      //List allClubsIDList = League(index: leagueID).getAllClubsIDList();
      leagueNames[leagueName] = 0;
      customToast('LOADING: $leagueName');
      for(int i=0; i < allClubsNameList.length; i++) {
        int clubID = clubsAllNameList.indexOf(allClubsNameList[i]);
        Club clubClass = Club(index: clubID);
        clubs.add(clubClass);
        double ovr = clubClass.getOverall();
        clubsOVR.add(ovr);
        copyClubsName.add(clubClass.name);

        leagueNames[leagueName] = leagueNames[leagueName]! + ovr;
      }

      leagueNames[leagueName] = leagueNames[leagueName]! / allClubsNameList.length;

      List<MapEntry<String, double>> sortedEntries = leagueNames.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      leagueNames = Map.fromEntries(sortedEntries);

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

  organizeContinentalRanking(String continent){
    copyClubsContinental = List.from(clubs);
    copyClubsContinental.removeWhere((club) => !club.continent.contains(continent));
  }

  organizeNationalRanking(String leagueName){
    List divisionsName = Divisions().leagueDivisionsStructure(leagueName);
    List allClubsName = [];
    for(String leagueName in divisionsName){
      int leagueIndex = leaguesIndexFromName[leagueName];
      allClubsName += League(index: leagueIndex).allClubsName;
    }

    copyClubsNational = List.from(clubs);
    copyClubsNational.removeWhere((club) => !allClubsName.contains(club.name));
  }

}