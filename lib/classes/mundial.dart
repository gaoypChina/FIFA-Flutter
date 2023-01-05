import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/confronto.dart';
import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

class MundialFinal{

  Club club1 = Club(index: 25);
  Club club2 = Club(index: 57);
  bool isChampionClub1 = true;
  bool hasPenaltis = false;
  int _goal1 = 0;
  int _goal2 = 0;
  late Confronto confronto;

  void simulate(){
      club1 = finalistName(LeagueOfficialNames().championsLeague);
      club2 = finalistName(LeagueOfficialNames().libertadores);
      simulateScore();
      confronto = Confronto(clubName1: club1.name, clubName2: club2.name, goal1: _goal1, goal2: _goal2);
      simulatePenaltis();

      saveResults();
  }

  Club finalistName(String leagueInternational){
    //Procura na liga ou na libertadores qual dos dois foi o campeao
    int idaVolta = 0;
    List finalists = List.from(globalInternationalMataMataClubsID[leagueInternational][Name().finale]);
    int clubIndex1 = finalists[0];
    int goal1 = globalInternationalMataMataGoals[leagueInternational][Name().finale][clubIndex1][idaVolta];

    int clubIndex2 = finalists[1];
    int goal2 = globalInternationalMataMataGoals[leagueInternational][Name().finale][clubIndex2][idaVolta];
    if(goal1 > goal2){
      return Club(index: clubIndex1);
    }else{
      return Club(index: clubIndex2);
    }
  }
  simulateScore(){
    _goal1 = Random().nextInt(3);
    _goal2 = Random().nextInt(3);
    if(_goal1>_goal2){
      isChampionClub1 = true;
    }else{
      isChampionClub1 = false;
    }
    if(_goal1==_goal2){
      hasPenaltis = true;
    }
  }
  simulatePenaltis(){
    if(hasPenaltis){
      confronto.penaltis1 = Random().nextInt(5);
      confronto.penaltis2 = Random().nextInt(5);
      if(confronto.penaltis1 > confronto.penaltis2){
        isChampionClub1 = true;
      }else{
        isChampionClub1 = false;
      }
      if(confronto.penaltis1 == confronto.penaltis2){
        simulatePenaltis();
      }
    }
  }

  saveResults(){
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

  getResults(int year){
    print(globalHistoricClassification);
    Map result = globalHistoricClassification['Mundial'][year];
    confronto = Confronto(
        clubName1: result['champion'],
        clubName2: result['vice'],
        goal1: result['goal_champion'],
        goal2: result['goal_vice']
    );
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