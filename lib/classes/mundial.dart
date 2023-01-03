import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/functions/mata_mata/mata_mata_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/values/league_names.dart';

class MundialFinal{

  Club club1 = Club(index: 25);
  Club club2 = Club(index: 57);
  int goal1 = Random().nextInt(3);
  int goal2 = Random().nextInt(3);
  bool isAlreadyPlayed = true;

  MundialFinal(){
      club1 = finalistName(LeagueOfficialNames().championsLeague);
      club2 = finalistName(LeagueOfficialNames().libertadores);
  }

  Club finalistName(String leagueInternational){
    int idaVolta = 0;
    List finalists = List.from(globalInternationalMataMataClubsID[leagueInternational][Name().finale]);
    customToast(finalists.toString());
    int clubIndex1 = finalists[0];
    int gol1 = globalInternationalMataMataGoals[leagueInternational][Name().finale][clubIndex1][idaVolta];

    int clubIndex2 = finalists[1];
    int gol2 = globalInternationalMataMataGoals[leagueInternational][Name().finale][clubIndex2][idaVolta];
    if(gol1>gol2){
      return Club(index: clubIndex1);
    }else{
      return Club(index: clubIndex2);
    }
  }

}