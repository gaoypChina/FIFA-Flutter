import 'package:fifa/database/local_database/shared_preferences.dart';
class MapRankingIndividual{
  late int score;
  late int nCorrect;
  late String date;
  late int milis;
  late int difficulty;

  printData(){
    print(score.toString() + nCorrect.toString()+ milis.toString()+ date+ difficulty.toString());
  }
}

class MapRankingController{
  List<String> savedList = []; // [['name # 12/04/2022 # 1420],]
  List<List> savedListSeparated = [];
  MapRankingIndividual mapRankingIndividual = MapRankingIndividual();

  //SAVE DATA
  saveData(int score, int nCorrect, int milis, int difficulty) async{
    DateTime now = DateTime.now();
    String scoreData = '$score #$nCorrect #$milis #${now.day.toString()}/${now.month.toString()}/${now.year.toString()} #$difficulty';
    List<String> listRanking = await SharedPreferenceHelper().getMapRanking() ?? [];
    listRanking.add(scoreData);
    SharedPreferenceHelper().saveMapRanking(listRanking);
    print(scoreData);
  }
  
  //LOAD DATA
  getStoredDataList() async {
    savedList = await SharedPreferenceHelper().getMapRanking() ?? [];

    //save savedListSeparated data
    savedListSeparated = [];
    for (var element in savedList) {
      getIndividualSavedData(element);
    }
    //organize it
    orderSavedData();

  }
  getIndividualSavedData(String element){
    List variables = element.split('#');
    for (var element in variables) {
      element.replaceAll(' ', '');
    }
    savedListSeparated.add(variables);
  }

  listToClass(List variables){
    mapRankingIndividual.score = int.parse(variables[0]);
    mapRankingIndividual.nCorrect = int.parse(variables[1]);
    mapRankingIndividual.milis = int.parse(variables[2]);
    mapRankingIndividual.date = variables[3];
    mapRankingIndividual.difficulty = int.parse(variables[4]);
  }


  orderSavedData() {
    
  }
}
