
import 'package:fifa/database/local_database/shared_preferences.dart';
import 'package:fifa/functions/countries_continents.dart';

class MapGameModeNames{

  String nivel1 = 'Nivel 1';
  String nivel2 = 'Nivel 2';
  String nivel3 = 'Nivel 3';

  String estadioTime = 'EstadioTime';
  String timeEstadio = 'TimeEstadio';
  String markers = 'Markers';
  String logos = 'Logos';

  String modeSemErrar = 'Sem Errar';
  String mode1minute = '1 minuto';
  String mode4options = 'Normal';

  mapStarsValue(String mode){
    Map map = {};
    map[modeSemErrar] = 10;
    map[mode1minute] = 20;
    map[mode4options] = 30;

    return map[mode];
  }

}

class MapGameSettings{
  List selectedContinents = [Continents().europa,Continents().americaSul,Continents().americaNorte,Continents().asia,Continents().africa];
  int difficulty = 2;
  String selectedNivel = '';
  int starCorrectValue = 0;
  int stadiumSizeMin = 0;
  String mode = MapGameModeNames().mode1minute;
  String gameplayName = '';
  List<String> saveNames = [];

  setDifficulty(){
    if(difficulty == 0 ){
      stadiumSizeMin = 45000;
    }
    if(difficulty == 1 ){
      stadiumSizeMin = 32000;
    }
    if(difficulty == 2 ){
      stadiumSizeMin = 0;
    }
  }


  ///////////////////////////////////////////////////////
  int getRecord({required String nivel, required String mode,required String gameplayName}){
    int record = 0;
    for (var saveName in saveNames) {
      if(saveName.contains(nivel) && saveName.contains(mode) && saveName.contains(gameplayName)){
        saveName = saveName.substring(saveName.length - 3);
        saveName = saveName.replaceAll(RegExp(r"\D"), "");
        record = int.parse(saveName);
      }
    }
    return record;
  }
  ///////////////////////////////////////////////////////
  saveKeys(int nCorrect) async {
    if(mode == MapGameModeNames().mode1minute && nCorrect>MapGameModeNames().mapStarsValue(mode) ||
        mode == MapGameModeNames().modeSemErrar && nCorrect>MapGameModeNames().mapStarsValue(mode) ||
        mode == MapGameModeNames().mode4options && nCorrect>MapGameModeNames().mapStarsValue(mode)
    ){
      //SE GANHAR A estrela
      String saveName = selectedNivel+mode+gameplayName+nCorrect.toString();
      List<String> ranking = await (SharedPreferenceHelper().getMapRanking()) ?? [];
      if(!ranking.contains(saveName)) {
        ranking.add(saveName);
        SharedPreferenceHelper().saveMapRanking(ranking);
      }
    }

  }

  Future getSaveNames() async{
    saveNames = await (SharedPreferenceHelper().getMapRanking()) ?? [];
  }

  int hasStar({required String nivel, required String mode,required String gameplayName}){
    int nStars = 0;
    for (var saveName in saveNames) {
      if(saveName.contains(nivel) && saveName.contains(mode) && saveName.contains(gameplayName)){
        nStars++;
      }
    }
    return nStars;
  }

  int hasStars3({required String nivel, required String mode}){
    int nStars = 0;
    for (var saveName in saveNames) {
      if(saveName.contains(nivel) && saveName.contains(mode)){
        nStars++;
      }
    }
    return nStars;
  }

  int hasStars9({required String nivel}){
    int nStars = 0;
    for (var saveName in saveNames) {
      if(saveName.contains(nivel)){
        nStars++;
      }
    }
    return nStars;
  }


}