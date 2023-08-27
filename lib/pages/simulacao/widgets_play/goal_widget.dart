import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/match/goal_my_match.dart';
import 'package:fifa/classes/simulate/my_match/my_match_simulation.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget goalWidget(BuildContext context, bool isTeam1, MyMatchSimulation myMatchSimulation){
  int lengthWidget = myMatchSimulation.meuGolSofrido;
  bool isMy = false;
  if((isTeam1 && !myMatchSimulation.visitante) || (!isTeam1 && myMatchSimulation.visitante)) {//
    lengthWidget = myMatchSimulation.meuGolMarcado;
    isMy = true;
  }
  return   lengthWidget > 0
      ? SingleChildScrollView(
    child: Column(
      children: [
        for(int i=0; i<lengthWidget; i++)
          goalWidgetRow(i, isMy)
      ],
    ),
  )
      : SizedBox(width: (Sized(context).width/2)-15);
}

Widget goalWidgetRow(int i,bool isMy){
  GoalMyMatch goalMyMatch = GoalMyMatch();
  if(isMy){
    goalMyMatch.getMyGoal(i);
  }else {
    goalMyMatch.getAdvGoal(i);
  }
  return
    Row(
      children: [
        Image.asset('assets/icons/bola.png',height:15,width: 15),
        Text(goalMyMatch.minute.toString()+'\'  ',style: EstiloTextoBranco.text14),
        SizedBox(width:70,
            child: Text(goalMyMatch.playerName,overflow: TextOverflow.ellipsis,style: EstiloTextoBranco.text12)
        ),
        goalMyMatch.playerNameAssist.isNotEmpty ? SizedBox(width:70,
            child: Text(", "+goalMyMatch.playerNameAssist,overflow: TextOverflow.ellipsis,style: EstiloTextoBranco.text10)
        ) : Container(width:70),
      ],
    );

}