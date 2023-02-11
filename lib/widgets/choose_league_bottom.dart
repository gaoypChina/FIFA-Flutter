import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

Widget selectLeagueWidget(BuildContext context, Map leaguesMap, int choosenLeagueIndex, Function() funcSetState){
  return              Container(
    padding: EdgeInsets.only(top:Sized(context).height- 50),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i=0;i<leaguesListRealIndex.length;i++)
            leagueRow(leaguesMap[leaguesListRealIndex[i]],choosenLeagueIndex, funcSetState)
        ],
      ),
    ),
  );
}
Widget leagueRow(League league, int choosenLeagueIndex, Function() funcSetState){
  return GestureDetector(
    onTap: (){
      choosenLeagueIndex = league.index;
      funcSetState();
    },
    child: Container(
      padding: const EdgeInsets.all(2),
      color: choosenLeagueIndex == league.index ? Colors.redAccent: Colors.white54,
      child: Image.asset(FIFAImages().campeonatoLogo(league.name),height: 50,width: 50,),
    ),
  );
}