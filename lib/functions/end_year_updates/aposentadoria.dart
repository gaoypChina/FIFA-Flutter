import 'dart:math';

import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';


funcAposentadoriaJogador(Jogador player){
  if(isRetired(player.age)){
    int randomAge = Random().nextInt(5)+17;//17-21
    globalJogadoresAge[player.index] = randomAge;
    globalJogadoresOverall[player.index] = player.overall - 20;
  }
}

bool isRetired(int age){

  int randomSum = Random().nextInt(100);
  bool isRetired = false;
  if(age>34){randomSum < 10;}
  if(age>37){randomSum < 25;}
  if(age>39){randomSum < 50;}
  return isRetired;
}