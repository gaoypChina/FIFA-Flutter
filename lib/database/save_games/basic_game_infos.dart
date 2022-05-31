
import 'dart:convert';

import 'package:fifa/database/key_names.dart';
import 'package:fifa/global_variables.dart';

class BasicGameInfos{
  int id = 0;
  late int myClubID;
  late int year;
  late int week;
  late int rodada0;
  late double money;
  late int difficulty;
  late int expectativa;
  late int coachPoints;
  late String coachName;

  BasicGameInfos({
    required this.id,
    required this.myClubID,
    required this.year,
    required this.week,
    required this.rodada0,
    required this.money,
    required this.difficulty,
    required this.expectativa,
    required this.coachPoints,
    required this.coachName,
});

  // Convert a Favorite into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      KeyNames().idKey: id,
      KeyNames().myClubIDKey: myClubID,
      KeyNames().yearKey: year,
      KeyNames().weekKey: week,
      KeyNames().rodadaKey: rodada,
      KeyNames().moneyKey: money,
      KeyNames().difficultyKey: difficulty,
      KeyNames().expectativaKey: expectativa,
      KeyNames().coachPointsKey: coachPoints,
      KeyNames().coachNameKey: coachName,
    };
  }

  uploadData(){
    globalMyClubID = myClubID;
    ano = year;
    semana = week;
    rodada = rodada0;
    globalMyMoney = money;
    globalDificuldade = difficulty;
    globalMyExpectativa = expectativa;
    globalCoachPoints = coachPoints;
    globalCoachName = coachName;
    //List<int> list = json.decode(myPlayers);
    //globalMyJogadores = list;
  }

}