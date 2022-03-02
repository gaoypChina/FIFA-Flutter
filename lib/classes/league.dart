import 'package:fifa/classes/club.dart';
import 'package:fifa/functions/international_league.dart';
import 'package:fifa/values/club_names.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

class League{

  late int index;
  late int nClubs;
  late String name;
  late int internationalLeagueIndex;
  late String internationalLeagueName;
  late List allClubsName;

  League({required this.index}){
    name = getName();
    allClubsName = getAllClubsNameList();
    nClubs = allClubsName.length;
    internationalLeagueName = funcGetInternationalLeagueName(indexLeague: index);
    internationalLeagueIndex = funcGetInternationalLeagueIndex(internationalLeagueName: internationalLeagueName);
  }

  ///////////////////////////////////////////////////////////////////
  // VARIABLES
  String getName(){
    Map map = leaguesIndexFromName;
    //Search name by index;
    var name = map.keys.firstWhere((k) => map[k] == index, orElse: () => null);
    return name;
  }

  String getClubName(int indexClub){
    //indexClub: 0-16
    Map mapClubs = clubNameMap[name];
    return mapClubs[indexClub];
  }
  //getClubIndex: 0-257
  int getClubRealIndex(int indexClub){
    //indexClub: 0-16
    Map mapClubs = clubNameMap[name];
    String clubName = mapClubs[indexClub];
    List allClubsName = clubsAllNameList;//globalvariable
    return allClubsName.indexOf(clubName);
  }
  List getAllClubsNameList(){
    Map allClubsMap = clubNameMap[name];
    List allClubs = allClubsMap.values.toList();
    return allClubs;
  }
  List getAllClubsIDList(){
    List allClubsIndex = [];
    for(int i=0;i<nClubs;i++){
      allClubsIndex.add(getClubRealIndex(i));
    }
    return allClubsIndex;
  }

  int getNTeams(){
    return allClubsName.length;
  }

  List getClassification(){
    List classificationLeagueIndex = [];
    List points = [];
    List saldo = [];
    for(int i=0;i<nClubs;i++){
      int clubIndex = getClubRealIndex(i);
      classificationLeagueIndex.add(clubIndex);
      points.add(Club(index: clubIndex).leaguePoints);
      try {
        //A lista pode estar vazia quando é inicializada
        saldo.add(globalClubsLeagueGM[clubIndex] - globalClubsLeagueGS[clubIndex]);
      }catch(e){
        saldo.add(0);
      }
    }

    //Organiza em ordem decrescente
    dynamic help;
    for(int i=0;i<nClubs;i++){
      for(int k=i;k<nClubs;k++){
        if(points[i]<points[k] || (points[i]==points[k] && saldo[i] < saldo[k])){
          help = points[i];points[i] = points[k];points[k] = help;
          help = classificationLeagueIndex[i];classificationLeagueIndex[i] = classificationLeagueIndex[k];classificationLeagueIndex[k] = help;
          help = saldo[i];saldo[i] = saldo[k];saldo[k] = help;
        }
      }
    }

    return classificationLeagueIndex;
  }
}
//////////////////////////////////////////////////////////////////
//                          OTHERS                              //
//////////////////////////////////////////////////////////////////



