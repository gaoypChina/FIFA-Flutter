import 'dart:math';

newOverall(int age){

  int randomSum = 0;
  if(age<19){randomSum = Random().nextInt(5)+2;}//2,6  ,avr:4
  else if(age<22){randomSum = Random().nextInt(6);}//0,5 ,avr:2.5
  else if(age<25){randomSum = Random().nextInt(5)-1;}//-1,3 avr:1
  else if(age<28){randomSum = Random().nextInt(5)-2;}//-2,3 avr:0.3
  else if(age<32){randomSum = Random().nextInt(4)-2;}//-2,2 avr:0
  else if(age<36){randomSum = Random().nextInt(4)-3;}//-3,0 avr:-1.5
  else if(age>=36){randomSum = Random().nextInt(4)-4;}//-4,-1 avr:-2.25
  return randomSum;
}