
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Testes', (){

    test('Json Encode', () {
      List<int> myPlayers = [1,3,52,5,23,54,76];
      List list = json.decode(myPlayers.toString());
      expect(list, myPlayers);
    });

    test('Teste maps', () {
      Map global = {'Mundial':{}};
      global['Mundial'][2012] = ['oi','boi'];
      global['Mundial'][2013] = ['oi','boi'];
    });

  });
}
