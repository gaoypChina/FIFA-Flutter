import 'package:fifa/classes/classification.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_names.dart';

class HistoricPositionsThisYear{



  resetGlobal(){
    globalHistoricPositionsThisYear = {};
  }

  setGlobal(){
    for(int leagueID in leaguesListRealIndex){
      List classificationClubsIndexes = Classification(leagueIndex: leagueID).classificationClubsIndexes;
      for(int clubID in classificationClubsIndexes){
        saveClub(clubID, classificationClubsIndexes.indexOf(clubID)+1);
      }
    }
  }

  saveClub(int clubID, int position){
    String clubName = clubsAllNameList[clubID];
    List<int> listNow = [];
    if(existData(clubName)){
      listNow = globalHistoricPositionsThisYear[clubName]!;
    }
    listNow.add(position);
    globalHistoricPositionsThisYear[clubName] = listNow;
  }

  List<int> getGlobal(String clubName){
    if(existData(clubName)) {
      return globalHistoricPositionsThisYear[clubName]!;
    }else{
      return [];
    }
  }

  existData(String clubName){
    try{
      if(globalHistoricPositionsThisYear[clubName]!.isNotEmpty){
        return true;
      }
    }catch(e){
      return false;
    }
  }



}