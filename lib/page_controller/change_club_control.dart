import 'dart:math';

import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';

class OptionsClubs{

  late int team1;
  late int team2;
  late int team3;
  late int team4;
  late int team5;
  late int team6;

  OptionsClubs(){
    team1 = Random().nextInt(160);
    team2 = Random().nextInt(160);
    team3 = Random().nextInt(160);
    team4 = Random().nextInt(160);
    team5 = Random().nextInt(160);
    team6 = Random().nextInt(160);
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