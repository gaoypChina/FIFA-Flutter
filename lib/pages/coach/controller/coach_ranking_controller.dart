import 'package:fifa/classes/my.dart';
import 'package:fifa/database/local_database/shared_preferences.dart';
import 'package:fifa/global_variables.dart';

class CoachRankingIndividual{

  late String name;
  late String date;
  late int simulationYear;
  late String clubName;
  late int points;

  void printData(){
    print(name + points.toString()+ date+clubName+simulationYear.toString());
  }

}


class CoachRankingController{

  List<String> savedCoachsList = []; // [['name # 12/04/2022 # 1420],]
  List<List> savedCoachsListSeparated = [];
  CoachRankingIndividual coach = CoachRankingIndividual();


  //LOAD DATA
  getStoredDataList() async {
    savedCoachsList = await SharedPreferenceHelper().getCoachRanking() ?? [];

    //save savedCoachsListSeparated data
    savedCoachsListSeparated = [];
    for (var element in savedCoachsList) {
      getIndividualSavedData(element);
    }
    //organize it
    orderSavedData();

  }

  void getIndividualSavedData(String element){
    List variables = element.split('#');
    savedCoachsListSeparated.add(variables);
  }

  void listToClassCoach(List variables){
    coach.name = variables[0];
    coach.date = variables[1];
    coach.simulationYear = int.parse(variables[2]);
    coach.clubName = variables[3];
    coach.points = int.parse(variables[4]);
  }

  void orderSavedData() {
    for (int i = 0; i < savedCoachsListSeparated.length; i++) {
      for (int k = i + 1; k < savedCoachsListSeparated.length; k++) {
        //Compare points
        if (int.parse(savedCoachsListSeparated[i][4]) < int.parse(savedCoachsListSeparated[k][4])) {
          List aux = savedCoachsListSeparated[k];
          savedCoachsListSeparated[k] = savedCoachsListSeparated[i];
          savedCoachsListSeparated[i] = aux;
        }
      }
    }
  }




  //SAVE DATA
  void saveData() async{
    savedCoachsList = await SharedPreferenceHelper().getCoachRanking() ?? [];

    coach.name = globalCoachName;
    DateTime now = DateTime.now();
    coach.date = now.day.toString()+'/'+now.month.toString()+'/'+now.year.toString();
    coach.simulationYear = ano;
    coach.clubName = My().clubName;
    coach.points = globalCoachPoints;

    String str = coach.name + '#' +
        coach.date + '#' +
        coach.simulationYear.toString() + '#'+
        coach.clubName + '#'+
        coach.points.toStringAsFixed(0) + '#';
    if(!savedCoachsList.contains(str)){
      savedCoachsList.add(str);
    }
    SharedPreferenceHelper().saveCoachRanking(savedCoachsList);
  }


  
}
