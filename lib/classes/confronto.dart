class Confronto{

  late String clubName1;
  late String clubName2;
  late int goal1;
  late int goal2;
  late String result;

  int penaltis1 = 0;
  int penaltis2 = 0;

  String victory = 'Victory';
  String draw = 'Draw';
  String loss = 'Loss';

  Confronto({required this.clubName1, required this.clubName2, required this.goal1,required this.goal2}){
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
    this.penaltis1 = penaltis1;
    this.penaltis2 = penaltis2;
  }

}