import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/background_color/match_x_testyle.dart';
import 'package:fifa/theme/decoration/my_team_gradient.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget matchRowWidget(Confronto confronto, My my) {

  TextStyle style1 = matchStyle1(0, 0, 14);
  TextStyle style2 = matchStyle2(0, 0, 14);

  if (confronto.hasGoals){
    style1 = matchStyle1(confronto.goal1, confronto.goal2, 14);
    style2 = matchStyle2(confronto.goal1, confronto.goal2, 14);
  }

  BoxDecoration backgroundColor1 = const BoxDecoration();
  BoxDecoration backgroundColor2 = const BoxDecoration();
  if(confronto.clubName1 == my.clubName){
    backgroundColor1 = BoxDecoration(
      gradient: gradientMyTeam(false),
    );
  }else if(confronto.clubName2 == my.clubName){
    backgroundColor2 = BoxDecoration(
      gradient: gradientMyTeam(true),
    );
  }

  return Row(
    children: [

      //TIME 1
      Expanded(
        child: Container(
          decoration: backgroundColor1,
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(confronto.clubName1,textAlign:TextAlign.end, style: style1),
              const SizedBox(width: 4),
              Images().getEscudoWidget(confronto.clubName1,22,22),
            ],
          ),
        ),
      ),


      //PLACAR
      const SizedBox(width: 4),
      (confronto.hasGoals)
          ? Text(confronto.goal1.toString(),textAlign:TextAlign.center,style: style1) : Container(),

      const SizedBox(width: 4),
      const Text('x',style: EstiloTextoBranco.text16,textAlign: TextAlign.center,),
      const SizedBox(width: 4),

      (confronto.hasGoals)
          ? Text(confronto.goal2.toString(),textAlign: TextAlign.center,style: style2) : Container(),
      const SizedBox(width: 4),

      //TIME 2
      Expanded(
        child: Container(
          decoration: backgroundColor2,
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Images().getEscudoWidget(confronto.clubName2,22,22),
              const SizedBox(width: 4),
              Text(confronto.clubName2,textAlign:TextAlign.start,style: style2),
            ],
          ),
        ),
      ),


    ],
  );
}