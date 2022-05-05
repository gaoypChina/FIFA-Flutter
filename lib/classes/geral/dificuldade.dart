import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/cupertino.dart';

class DificuldadeClass{
  List<String> names = ['Amateur','Easy','Medium','Hard','Expert'];

  getNameTranslated(BuildContext context){
    if(globalDificuldade == 0){return Translation(context).text.amateur;}
    else if(globalDificuldade == 1){return Translation(context).text.easy;}
    else if(globalDificuldade == 2){return Translation(context).text.medium;}
    else if(globalDificuldade == 3){return Translation(context).text.hard;}
    else{
      return Translation(context).text.expert;
    }
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