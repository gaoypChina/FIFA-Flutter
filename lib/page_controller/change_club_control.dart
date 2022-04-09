import 'dart:math';

import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/functions/func_number_clubs_total.dart';

class OptionsClubs{

  List teams = [];

  OptionsClubs(){
    for(int i=0; i<6 ;i++){
      teams.add(chooseClub());
    }
  }

  int chooseClub(){
    //Checa se o clube tem alguma liga
    int clubID = -1;
    bool clubHasLeague = false;
    while(!clubHasLeague && !teams.contains(clubID)){
      try{
        clubID = Random().nextInt(funcNumberClubsTotal());
        Club(index: clubID).getChaveLeague();
        clubHasLeague = true;
      }catch(e){
        clubHasLeague = false;
      }
    }
    return clubID;
  }

}

class ClubClassification{
  late int clubID;
  late String clubName;
  late int posicaoTabela;
  late int chaveClub;
  late int indexLeague;

  ClubClassification({required int clubID}){
    chaveClub = Club(index: clubID).getChaveLeague();
    indexLeague = Club(index: clubID).getLeagueID();
    posicaoTabela = Classification(leagueIndex: indexLeague).getClubPosition(clubID);
    clubName = Club(index: clubID).name;
  }
}