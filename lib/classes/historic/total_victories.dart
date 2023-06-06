import 'package:fifa/classes/functions/try_catch.dart';
import 'package:fifa/global_variables.dart';

class TotalVictories{
  String victoryField = 'V';
  String drawField = 'D';
  String lossField = 'L';
  int totalVictory = 0;
  int totalDraw = 0;
  int totalLoss = 0;


  TotalVictories(){
    tryCatchCreateMap2(globalHistoricCoachResults, ano, victoryField,0);
    tryCatchCreateMap2(globalHistoricCoachResults, ano, drawField,0);
    tryCatchCreateMap2(globalHistoricCoachResults, ano, lossField,0);
  }

  void getTotalResults(){
    for(var keys in globalHistoricCoachResults.keys){
      try{
        int years = keys;
        for(String fieldNames in globalHistoricCoachResults[years].keys){
          if(fieldNames == victoryField){
            totalVictory += int.parse(globalHistoricCoachResults[years][fieldNames].toString());
          }
          if(fieldNames == drawField){
            totalDraw += int.parse(globalHistoricCoachResults[years][fieldNames].toString());
          }
          if(fieldNames == lossField){
            totalLoss += int.parse(globalHistoricCoachResults[years][fieldNames].toString());
          }
        }
      }catch(e){
        //print('Mapa: $globalHistoricCoachResults');
        //print('O campo $keys não é um ano');
      }

    }
  }
  void add1Victory(){
    add1(victoryField);
  }
  void add1Draw(){
    add1(drawField);
  }
  void add1Loss(){
    add1(lossField);
  }

  void add1(String fieldName){
    globalHistoricCoachResults[ano][fieldName] = globalHistoricCoachResults[ano][fieldName]+1;
  }
}