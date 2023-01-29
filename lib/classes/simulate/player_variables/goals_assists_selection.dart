import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/simulate/player_variables/origin/assists.dart';
import 'package:fifa/classes/simulate/player_variables/origin/goal.dart';

class GoalAssistsSelection{
  ////////////////////////////////////////////
  //GOALS E ASSISTENCIAS NACIONAIS
  goalsAssistsNational(Club clubClass){
    int jogadorID = Goal().setGoals(clubClass);
    Goal().saveGoalsNational(jogadorID);
    jogadorID = Assists().setAssists(clubClass);
    Assists().saveAssistsNational(jogadorID);
  }

  //GOALS E ASSISTENCIAS INTERNACIONAIS
  goalsAssistsInternational(Club clubClass){
    int jogadorID = Goal().setGoals(clubClass);
    Goal().saveGoalsInternational(jogadorID);

    jogadorID = Assists().setAssists(clubClass);
    Assists().saveAssistsInternational(jogadorID);
  }
}