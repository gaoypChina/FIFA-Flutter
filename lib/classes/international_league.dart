import 'package:fifa/global_variables.dart';

class InternationalLeague{

  String clubsIDkey = 'clubsID';

  ////////////////////////////////////////////////////////
  // RESET
  ///////////////////////////////////////////////////////
  resetFilled(String leagueName){
    globalInternational[leagueName] = {};
    globalInternational[leagueName][clubsIDkey] = List.filled(32, 0);
  }
  reset(String leagueName){
    globalInternational[leagueName] = {};
    globalInternational[leagueName][clubsIDkey] = [];
  }
  ////////////////////////////////////////////////////////
  // SET
  ///////////////////////////////////////////////////////
  addClub(String leagueName, int clubID){
    List atual = List.from(globalInternational[leagueName][clubsIDkey]);
    atual.add(clubID);
    globalInternational[leagueName][clubsIDkey] = atual;
  }

  setClub(String leagueName, int clubID, int position){
    globalInternational[leagueName][clubsIDkey][position] = clubID;
  }

  sortClubs({required String leagueName, required int position1,required int position2}){
    int aux = globalInternational[leagueName][clubsIDkey][position1];
    globalInternational[leagueName][clubsIDkey][position1] = globalInternational[leagueName][clubsIDkey][position2];
    globalInternational[leagueName][clubsIDkey][position2] = aux;
  }


  ////////////////////////////////////////////////////////
  // GET
  ///////////////////////////////////////////////////////
  List getClubs(String leagueName){
    return globalInternational[leagueName][clubsIDkey];
  }
  int getClub(String leagueName, int position){
    return globalInternational[leagueName][clubsIDkey][position];
  }
  int searchClub(String leagueName, int clubID){
    List clubs = List.from(globalInternational[leagueName][clubsIDkey]);
    return clubs.indexOf(clubID);
  }

  String checkContains(int clubID, String leagueName, String val){
    if(globalInternational[leagueName][clubsIDkey].contains(clubID)){
      return leagueName;
    }else{
      return val;
    }
  }

}

