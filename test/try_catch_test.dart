import 'package:fifa/classes/geral/try_catch.dart';
import 'package:fifa/classes/historic/total_victories.dart';
import 'package:fifa/global_variables.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('TRY-CATCH', (){
    test('try catch simple', () {
      Map mapData = {};
      tryCatchCreateMap(mapData, '2022', 0);
      expect(mapData, {'2022':0});
    });
    test('try catch double', () {
      Map mapData = {};
      tryCatchCreateMap2(mapData, '2022','Vitória', 0);
      expect(mapData, {'2022': {'Vitória': 0 } });
    });
    test('Total Victories creation', (){
      TotalVictories totalVictories = TotalVictories();
      expect(globalHistoricCoachResults[ano][totalVictories.victoryField], 0);
      expect(globalHistoricCoachResults[ano][totalVictories.drawField], 0);
      expect(globalHistoricCoachResults[ano][totalVictories.lossField], 0);
    });
  });
}