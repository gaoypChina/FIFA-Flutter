import 'package:fifa/global_variables.dart';

class Match{

  late int playerID;
  late int goals;
  late int assists;
  late int redCard;
  late int yellowCard;
  late int injury;
  late double health;

  Match({required this.playerID}){
    playerID = playerID;
    goals = globalJogadoresMatchGoals[playerID];
    assists = globalJogadoresMatchAssists[playerID];
    redCard = globalJogadoresMatchRedCards[playerID];
    yellowCard = globalJogadoresMatchYellowCards[playerID];
    injury = globalJogadoresMatchInjury[playerID];
    health = globalJogadoresMatchHealth[playerID];
  }


}