import 'dart:math';

import 'package:fifa/global_variables.dart';

import '../../classes/jogador.dart';

newOverall(Jogador player){

  int randomSum = 0;
  int age = player.age;
  if(age<19){randomSum = Random().nextInt(4)+2;}//2,5  ,avr:2.5
  else if(age<22){randomSum = Random().nextInt(5);}//0,4 ,avr:2
  else if(age<25){randomSum = Random().nextInt(5)-1;}//-1,3 avr:1
  else if(age<28){randomSum = Random().nextInt(5)-2;}//-2,3 avr:0.3
  else if(age<32){randomSum = Random().nextInt(4)-2;}//-2,2 avr:0
  else if(age<36){randomSum = Random().nextInt(4)-3;}//-3,0 avr:-1.5
  else if(age>=36){randomSum = Random().nextInt(4)-4;}//-4,-1 avr:-2.25

  globalJogadoresOverall[player.index] += randomSum;

  //OVR Máximo permitido
  if(globalJogadoresOverall[player.index] > 95){
    globalJogadoresOverall[player.index] = 95;
  }
}