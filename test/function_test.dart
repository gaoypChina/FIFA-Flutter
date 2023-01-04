
import 'package:fifa/functions/mata_mata/mata_mata_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Mata-Mata', (){
    int clubID1 = 10;
    int clubID2 = 3;
    int clubID3 = 15;
    int clubID4 = 21;

    test('Clubs in the final', () {
      String previousPhase = 'Semifinal';
      String nextPhase = 'Final';
      internationalLeagueNames = ['Champions'];

      globalInternationalMataMataClubsID[internationalLeagueNames[0]] = {};
      globalInternationalMataMataClubsID[internationalLeagueNames[0]][previousPhase] = [clubID1,clubID2,clubID3,clubID4];

      globalInternationalMataMataGoals[internationalLeagueNames[0]] = {};
      globalInternationalMataMataGoals[internationalLeagueNames[0]][previousPhase] = {};
      globalInternationalMataMataGoals[internationalLeagueNames[0]][previousPhase][clubID1] = [3,0];
      globalInternationalMataMataGoals[internationalLeagueNames[0]][previousPhase][clubID2] = [1,4];
      globalInternationalMataMataGoals[internationalLeagueNames[0]][previousPhase][clubID3] = [2,1];
      globalInternationalMataMataGoals[internationalLeagueNames[0]][previousPhase][clubID4] = [0,1];


      //FUNÇÃO A SER TESTADA
      MataMata().defineClubsFinal();

      expect(globalInternationalMataMataClubsID['Champions'][nextPhase], [clubID2,clubID3]);
    });


    test('data', () {
      //DateTime now = DateTime.now();
      //String dia = now.day.toString();

      });

  });
}
