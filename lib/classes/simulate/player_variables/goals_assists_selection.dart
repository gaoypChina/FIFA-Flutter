import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/simulate/player_variables/origin/assists.dart';
import 'package:fifa/classes/simulate/player_variables/origin/goal.dart';

class GoalAssistsSelection{
  ////////////////////////////////////////////
  goalsAssistsNational(Club clubClass){
    int playerID = Goal().setGoals(clubClass);
    Goal().saveGoalsNational(playerID);
    playerID = Assists().setAssists(clubClass);
    Assists().saveAssistsNational(playerID);
  }

  goalsAssistsInternational(Club clubClass){
    int playerID = Goal().setGoals(clubClass);
    Goal().saveGoalsInternational(playerID);

    playerID = Assists().setAssists(clubClass);
    Assists().saveAssistsInternational(playerID);
  }

  goalsAssistsCup(Club clubClass){
    int playerID = Goal().setGoals(clubClass);
    Goal().saveGoalsCup(playerID);

    playerID = Assists().setAssists(clubClass);
    Assists().saveAssistsCup(playerID);
  }
}