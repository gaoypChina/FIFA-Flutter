import 'dart:math';

import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';

class AposentarJogador{

  AposentarJogador(Jogador player){
    if(isRetired(player.age)){
      updatePlayerAge(player);
      updatePlayerOVR(player);
      resetCarrerData(player.index);
    }
  }

  bool isRetired(int age){

    int randomSum = Random().nextInt(100);
    bool isRetired = false;
    if(age>39 && randomSum < 50){isRetired = true;}
    else if(age>37 && randomSum < 25){isRetired = true;}
    else if(age>34 && randomSum<10){isRetired = true;}

    return isRetired;
  }

  updatePlayerAge(Jogador player){
    int randomAge = Random().nextInt(5)+17;//17-21
    globalJogadoresAge[player.index] = randomAge;
  }
  updatePlayerOVR(Jogador player){
    int randomOVR = Random().nextInt(5)+16;//16-20
    globalJogadoresOverall[player.index] = player.overall - randomOVR;
  }

  resetCarrerData(int playerID){
    globalJogadoresCarrerMatchs[playerID] = 0;
    globalJogadoresCarrerGoals[playerID] = 0;
    globalJogadoresCarrerAssists[playerID] = 0;
  }

}



