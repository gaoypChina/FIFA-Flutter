import 'package:fifa/global_variables.dart';

class GoalMyMatch{
  late int minute;
  late int playerID;
  late String playerName;

  getMyGoal(int i){
    minute = globalMatchGoalsMinutesMy[i];
    playerID = globalMatchGoalScorerIDMy[i];
    playerName = globalJogadoresName[playerID];
  }
  getAdvGoal(int i){
    minute = globalMatchGoalsMinutesAdv[i];
    playerID = globalMatchGoalScorerIDAdv[i];
    playerName = globalJogadoresName[playerID];
  }

}