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

  int getFinalScore(int time, int nCorrect){
    int score = 0;
    if(difficulty == 0 ){      score = nCorrect;    }
    if(difficulty == 1 ){      score = nCorrect*2;    }
    if(difficulty == 2 ){      score = nCorrect*3;    }
    if(difficulty == 3 ){      score = nCorrect*5;    }
    score = score * selectedContinents.length;
    score = (100*score/time).round();
    return score;
  }
}