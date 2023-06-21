import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';

class Confronto{

  late String clubName1;
  late String clubName2;
  late String winnerName;
  late int clubID1;
  late int clubID2;
  late int goal1;
  late int goal2;
  late String result;
  bool isMyMatch = false;
  bool hasGoals = false;

  bool hasPenaltis = false;
  late int penaltis1;
  late int penaltis2;

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

  void printar(){
    if(hasGoals){
      print("$clubName1 $goal1 x $goal2 $clubName2");
    }else{
      print("$clubName1 x $clubName2");
    }
  }

  void setGoals({required int goal1,required int goal2}){
    hasGoals = true;
    this.goal1 = goal1;
    this.goal2 = goal2;

    if(goal1 > goal2){
      result = victory;
      winnerName = clubName1;
    }
    if(goal1 == goal2){
      result = draw;
    }
    if(goal2 > goal1){
      result = loss;
      winnerName = clubName2;
    }
  }

  void setPenalties({required penaltis1,required penaltis2}){
    hasPenaltis = true;
    this.penaltis1 = penaltis1;
    this.penaltis2 = penaltis2;

    if(penaltis1 > penaltis2){
      result = victory;
      winnerName = clubName1;
    }
    if(penaltis1 == penaltis2){
      result = draw;
    }
    if(penaltis1 > penaltis2){
      result = loss;
      winnerName = clubName2;
    }

  }

  void invertTeams(){
    String aux = clubName1;clubName1 = clubName2;clubName2 = aux;
    int auxInt = clubID1;clubID1 = clubID2;clubID2 = auxInt;
    if(hasGoals){
    auxInt = goal1;goal1 = goal2;goal2 = auxInt;
      if(result == victory){
        result = loss;
      }
      else if(result == loss){
        result = victory;
      }
    }
    if(hasPenaltis){
      auxInt = penaltis1;penaltis1 = penaltis2;penaltis2 = auxInt;
    }
  }


}