import 'package:fifa/theme/translation.dart';
import 'package:flutter/cupertino.dart';

class CoachAchievementsController{
  late List<String> achievements;
  Map<String,bool> achievementsCheck = {};

  CoachAchievementsController(BuildContext context){

    achievementsCreateInitialList(context);
    achievementsCreateCheckMap();

  }

  achievementsCreateInitialList(BuildContext context){
    achievements = [
      Translation(context).text.play100matchs,
    Translation(context).text.win100matchs,
    Translation(context).text.win1nationalChampionship,
    Translation(context).text.win5nationalChampionship,
    Translation(context).text.win1internationalChampionship,
    Translation(context).text.sellExpensivePlayer,
    Translation(context).text.bestTeamInTheWorld,
    Translation(context).text.play5seasons,
    Translation(context).text.play10seasons,
      Translation(context).text.invencibles,
    ];
  }

  achievementsCreateCheckMap(){
    for(String name in achievements) {
      achievementsCheck[name] = false;
    }
  }

  achievementsUpdateCheckMap(String name){
    if(achievementsCheck.containsKey(name)){
      achievementsCheck[name] = !achievementsCheck[name]!;  //!opposite state/ not null!
    }
  }



}