import 'package:fifa/classes/club.dart';
import 'package:fifa/values/clubs_all_names_list.dart';

import '../global_variables.dart';

funcChangeClub(String newClubName, int newLeagueID){

  globalMyClubName = newClubName;
  int clubID = clubsAllNameList.indexOf(newClubName);
  globalMyClubID = clubID;
  Club newClubClass = Club(index: clubID);
  globalMyJogadores = newClubClass.escalacao; //global MyJogadores tem que ser declarado antes de usar qualquer getOverall();
  double overall = newClubClass.getOverall();
  globalMyMoney = ((overall-68)*(overall-68)/5)*0.7;

}