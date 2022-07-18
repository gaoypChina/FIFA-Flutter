import 'package:fifa/functions/contries_continents.dart';

class MapGameSettings{
  List selectedContinents = [Continents().europa,Continents().americaSul,Continents().americaNorte,Continents().asia,Continents().africa];
  int difficulty = 0;
  int stadiumSizeMin = 45000;

  setDifficulty(){
    if(difficulty == 0 ){
      stadiumSizeMin = 45000;
    }
    if(difficulty == 1 ){
      stadiumSizeMin = 32000;
    }
    if(difficulty == 2 ){
      stadiumSizeMin = 15000;
    }
    if(difficulty == 3 ){
      stadiumSizeMin = 0;
    }
  }
}