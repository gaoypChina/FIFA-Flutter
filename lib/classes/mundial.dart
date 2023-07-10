import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/mata_mata/knockout_international.dart';
import 'package:fifa/classes/mata_mata/knockout_stage.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/simulate/match_simulation.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_names.dart';

class MundialFinal{

  bool isChampionClub1 = true;
  late Confronto confronto;

  void getClubs(){
    LeagueOfficialNames l = LeagueOfficialNames();
    Club club1 = finalistName(l.championsLeague);
    Club club2 = finalistName(l.libertadores);
    confronto = Confronto(clubName1: club1.name, clubName2: club2.name);
  }

  void simulate(){
      getClubs();
      simulateScore();
      simulatePenaltis();

      saveResults();
  }

  Club finalistName(String competitionName){
    //Procura na liga ou na libertadores qual dos dois foi o campeao
    Confronto confronto = KnockoutInternational().getConfronto(competitionName, KnockoutStage().keyFinal, ResultDict().keyIda, 1);

    return Club(index: clubsAllNameList.indexOf(confronto.winnerName));
  }

  void simulateScore(){

    MatchSimulation match = MatchSimulation(Club(index: confronto.clubID1), Club(index: confronto.clubID2), My());
    confronto.setGoals(goal1: match.variableGol1, goal2: match.variableGol2);

    if(confronto.goal1 == confronto.goal2){
      simulatePenaltis();
    }
  }

  void simulatePenaltis(){
      confronto.setPenalties(
          penaltis1: Random().nextInt(5),
          penaltis2: Random().nextInt(5)
      );

      if(confronto.penaltis1 == confronto.penaltis2){
        simulatePenaltis();
      }
  }

  void saveResults(){
    Map result = {};
    if(isChampionClub1){
      result = {'goal_champion': confronto.goal1,'goal_vice': confronto.goal2,
                    'champion': confronto.clubName1,'vice':confronto.clubName2};
    }else{
      result = {'goal_champion': confronto.goal2,'goal_vice': confronto.goal1,
        'champion': confronto.clubName2,'vice':confronto.clubName1};
    }
    globalHistoricClassification['Mundial'][ano] = result;
  }

  void getResults(int year){
    Map result = globalHistoricClassification['Mundial'][year];
    confronto = Confronto(
        clubName1: result['champion'],
        clubName2: result['vice'],
    );
    confronto.setGoals(goal1: result['goal_champion'], goal2: result['goal_vice']);
  }

}

class HistoricSave{
  List typesChampionshipKeys = [LeagueOfficialNames().mundial,
                                  'Nacional',
                                  'Internacional'];
  List yearKeys = [];
  List infoKeys = ['goal_champion','goal_vice','champion','vice'];

  HistoricSave(){
    for (int year=anoInicial;year<ano;year++){
      yearKeys.add(year);
    }
  }

}