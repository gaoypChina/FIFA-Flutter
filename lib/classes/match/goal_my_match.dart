import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';

class GoalMyMatch{
  late int minute;
  late int playerID;
  late String playerName;
  late int playerIDAssist;
  String playerNameAssist = "";
  late int clubID;

  void getMyGoal(int i){
    minute = globalMatchGoalsMinutesMy[i];
    playerID = globalMatchGoalScorerIDMy[i];
    Jogador jogador = Jogador(index: playerID);
    playerName = jogador.resumeName();
    playerIDAssist = globalMatchAssistsIDMy[i];
    if(playerIDAssist>0){
      jogador.name = globalJogadoresName[playerIDAssist];
      playerNameAssist = jogador.resumeName();
    }
    clubID = globalJogadoresClubIndex[playerID];
  }
  void getAdvGoal(int i){
    minute = globalMatchGoalsMinutesAdv[i];
    playerID = globalMatchGoalScorerIDAdv[i];
    Jogador jogador = Jogador(index: playerID);
    playerName = jogador.resumeName();
    playerIDAssist = globalMatchAssistsIDAdv[i];
    if(playerIDAssist>0){
      jogador.name = globalJogadoresName[playerIDAssist];
      playerNameAssist = jogador.resumeName();
    }
    clubID = globalJogadoresClubIndex[playerID];
  }

}