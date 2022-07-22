import 'dart:math';

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
    double score = 0;
    if(difficulty == 0 ){      score = pow(nCorrect,1.5).toDouble();    }
    if(difficulty == 1 ){      score = pow(nCorrect,1.5).toDouble()*2;    }
    if(difficulty == 2 ){      score = pow(nCorrect,1.5).toDouble()*3;    }
    if(difficulty == 3 ){      score = pow(nCorrect,1.5).toDouble()*5;    }
    score = score * selectedContinents.length;
    score = (100*score/time);
    return score.round();
  }
}