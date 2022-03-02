import 'package:fifa/global_variables.dart';

class DificuldadeClass{
  List<String> names = ['Amador','Fácil','Médio','Difícil','Expert'];

  getName(){
    return names[globalDificuldade];
  }

  double getDificuldadeMultiplicationValue(){
    double multiplicationDouble = 0;
    if(globalDificuldade==0){multiplicationDouble=2;}
    if(globalDificuldade==1){multiplicationDouble=1.25;}
    if(globalDificuldade==2){multiplicationDouble=1;}
    if(globalDificuldade==3){multiplicationDouble=0.8;}
    if(globalDificuldade==4){multiplicationDouble=0.6;}
    return multiplicationDouble;
  }
}