
import 'package:fifa/values/club_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Testes', (){

    test('Club Details infos filled', () {
      ClubDetails clubDetails = ClubDetails();
      clubDetails.map.forEach((key, value) {
        List values = value;
        expect(values[5].isNotEmpty, true);
      });
    });

  });
}
