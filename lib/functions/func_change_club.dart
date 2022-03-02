import 'package:fifa/classes/club.dart';
import 'package:fifa/values/club_names.dart';

import '../global_variables.dart';

funcChangeClub(String newClubName, int newLeagueID, int posicao){

  globalMyClubName = newClubName;
  globalMyPosicaoChave = posicao;
  int clubIndex = clubsAllNameList.indexOf(newClubName);
  globalMyClubID = clubIndex;
  Club newClubClass = Club(index: clubIndex);
  globalMyJogadores = newClubClass.escalacao; //global MyJogadores tem que ser declarado antes de usar qualquer getOverall();
  double overall = newClubClass.getOverall();
  globalMyMoney = ((overall-68)*(overall-68)/5)*0.7;

}