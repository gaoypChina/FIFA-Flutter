import 'package:fifa/classes/club.dart';
import 'package:fifa/global/global_variables.dart';

class League{

  late int index;
  late int nClubs;
  late String name;
  late List allClubsName;

  League({required this.index}){
    name = getName();
    allClubsName = getAllClubsNameList();
    nClubs = allClubsName.length;
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
    Map mapClubs = clubNameMap(name);
    return mapClubs[indexClub];
  }
  //getClubIndex: 0-257
  int getClubIndex(int indexClub){
    //indexClub: 0-16
    Map mapClubs = clubNameMap(name);
    String clubName = mapClubs[indexClub];
    List allClubsName = clubsName;//globalvariable
    return allClubsName.indexOf(clubName);
  }
  List getAllClubsNameList(){
    Map allClubsMap = clubNameMap(name);
    List allClubs = allClubsMap.values.toList();
    return allClubs;
  }
  List getAllClubsIDList(){
    List allClubsIndex = [];
    for(int i=0;i<nClubs;i++){
      allClubsIndex.add(getClubIndex(i));
    }
    return allClubsIndex;
  }

  int getNTeams(){
    int indexList = leagueNames.indexOf(getName());
    return leaguesListNClubs[indexList];
  }

  List getClassification(){
    List classificationLeagueIndex = [];
    List points = [];
    List saldo = [];
    for(int i=0;i<nClubs;i++){
      int clubIndex = getClubIndex(i);
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



