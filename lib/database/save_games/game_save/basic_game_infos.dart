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

  printData(){
    print('ID: $id MYCLUBID: $myClubID YEAR: $year WEEK: $week MONEY: $money');
  }
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

  BasicGameInfos toClass(List<Map<String, dynamic>> maps, int i){
    return BasicGameInfos(
      id: maps[i][KeyNames().idKey],
      myClubID: maps[i][KeyNames().myClubIDKey],
      year: maps[i][KeyNames().yearKey],
      week: maps[i][KeyNames().weekKey],
      rodada0: maps[i][KeyNames().rodadaKey],
      money: maps[i][KeyNames().moneyKey],
      difficulty: maps[i][KeyNames().difficultyKey],
      expectativa: maps[i][KeyNames().expectativaKey],
      coachPoints: maps[i][KeyNames().coachPointsKey],
      coachName: maps[i][KeyNames().coachNameKey],
    );
  }


  saveGlobally(){
    globalMyClubID = myClubID;
    ano = year;
    semana = week;
    rodada = rodada0;
    globalMyMoney = money;
    globalDificuldade = difficulty;
    globalMyExpectativa = expectativa;
    globalCoachPoints = coachPoints;
    globalCoachName = coachName;
  }

}