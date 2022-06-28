import 'package:fifa/theme/translation.dart';
import 'package:flutter/cupertino.dart';

class CoachAchievementsController{
  late Map<String,int> achievements;
  Map<String,bool> achievementsCheck = {};

  CoachAchievementsController(BuildContext context){

    achievementsCreateInitialList(context);
    achievementsCreateCheckMap();

  }

  achievementsCreateInitialList(BuildContext context){
    achievements = {
    Translation(context).text.play100matchs: 100,
    Translation(context).text.win100matchs: 150,
    Translation(context).text.win1nationalChampionship: 50,
    Translation(context).text.win5nationalChampionship: 300,
    Translation(context).text.win1internationalChampionship: 150,
    Translation(context).text.win3internationalChampionship: 400,
    Translation(context).text.sellExpensivePlayer: 40,
    Translation(context).text.buyExpensivePlayer: 40,
    Translation(context).text.bestTeamInTheWorld: 100,
    Translation(context).text.play5seasons: 50,
    Translation(context).text.play10seasons: 150,
    Translation(context).text.winAll: 200,
    Translation(context).text.winMundial: 200,
    Translation(context).text.win6goalsDifference: 40,
    Translation(context).text.haveTopScorer: 30,
    Translation(context).text.invencibles: 500,
    };
  }

  achievementsCreateCheckMap(){
    for(String name in achievements.keys) {
      achievementsCheck[name] = false;
    }
  }

  achievementsUpdateCheckMap(String name){
    if(achievementsCheck.containsKey(name)){
      achievementsCheck[name] = !achievementsCheck[name]!;  //!opposite state/ not null!
    }
  }



}