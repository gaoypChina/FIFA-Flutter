import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/internat_league_manipulation.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

class League{

  late int index;
  late int nClubs;
  late String name;
  late int internationalLeagueIndex;
  late String internationalLeagueName;
  late String internationalLeagueNameWhenNotPlay;
  late List allClubsName;
  bool playInternational = false;

  League({required this.index}){
    InternationalLeagueManipulation internationalLeagueManipulation = InternationalLeagueManipulation();
    name = getName();
    allClubsName = getAllClubsNameList();
    nClubs = allClubsName.length;
    internationalLeagueName = internationalLeagueManipulation.funcGetInternationalLeagueName(indexLeague: index);
    internationalLeagueNameWhenNotPlay = internationalLeagueManipulation.whenNotPlayInternationalLeague(internationalLeagueName);
    internationalLeagueIndex = internationalLeagueManipulation.funcGetInternationalLeagueIndex(internationalLeagueName: internationalLeagueName);
    playInternational = leaguePlayInternationalCompetition(name);
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
    //indexClub: 0-12,14,16 ETC...
    Map mapClubs = clubNameMap[name];
    return mapClubs[indexClub];
  }
  //getClubID: 0-257
  int getClubRealID(int indexClub){
    //indexClub: 0-16
    Map mapClubs = clubNameMap[name];
    String clubName = mapClubs[indexClub];
    List allClubsName = clubsAllNameList;//globalvariable
    return allClubsName.indexOf(clubName);
  }
  List getAllClubsNameList(){
    print(clubNameMap);
    Map allClubsMap = clubNameMap[name];
    List allClubs = allClubsMap.values.toList();
    return allClubs;
  }
  List getAllClubsIDList(){
    List allClubsIndex = [];
    List names = getAllClubsNameList();
    for (var element in names) {
      allClubsIndex.add(clubsAllNameList.indexOf(element));
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
      int clubIndex = getClubRealID(i);
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
