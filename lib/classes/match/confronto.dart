import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';

class Confronto{

  late String clubName1;
  late String clubName2;
  late int clubID1;
  late int clubID2;
  late int goal1;
  late int goal2;
  late String result;
  bool isMyMatch = false;
  bool hasGoals = false;

  bool hasPenaltis = false;
  int penaltis1 = -1;
  int penaltis2 = -1;

  String victory = 'Victory';
  String draw = 'Draw';
  String loss = 'Loss';

  Confronto({required this.clubName1, required this.clubName2}){
    clubID1 = clubsAllNameList.indexOf(clubName1);
    clubID2 = clubsAllNameList.indexOf(clubName2);
    if(clubID1 == globalMyClubID || clubID2 == globalMyClubID){
      isMyMatch = true;
    }

  }

  setGoals({required goal1,required goal2}){
    hasGoals = true;
    this.goal1 = goal1;
    this.goal1 = goal2;

    if(goal1>goal2){
      result = victory;
    }
    if(goal1==goal2){
      result = draw;
    }
    if(goal2>goal1){
      result = loss;
    }
  }

  setPenalties({required penaltis1,required penaltis2}){
    hasPenaltis = true;
    this.penaltis1 = penaltis1;
    this.penaltis2 = penaltis2;
  }

  fromMap(){

  }

}