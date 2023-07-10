import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/table/tabela_national.dart';
import 'package:fifa/theme/background_color/match_x_testyle.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/decoration/my_team_gradient.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/match_row.dart';
import 'package:flutter/material.dart';

Widget wMatchsTable(int rodadaMatch, League leagueClass){
  My my = My();
  return       Container(
    color: AppColors().greyTransparent,
    child: Column(
      children: [
        for(int i=0; i<(leagueClass.getNTeams()/2);i++)
          matchRowWidget(
              TableNational(
                chosenLeagueIndex: leagueClass.index,
                leagueClass: leagueClass,
                rodadaMatch: rodadaMatch,
                matchNumber: i*2
              ).confronto,
              my),
      ],
    ),
  );
}

Widget wRowMatchesVersus(TableNational tableNational, My my) {
  TextStyle style1 = matchStyle1(0, 0, 14);
  TextStyle style2 = matchStyle2(0, 0, 14);

  if (tableNational.confronto.hasGoals){
    style1 = matchStyle1(tableNational.confronto.goal1, tableNational.confronto.goal2, 14);
    style2 = matchStyle2(tableNational.confronto.goal1, tableNational.confronto.goal2, 14);
  }

  BoxDecoration backgroundColor1 = const BoxDecoration();
  BoxDecoration backgroundColor2 = const BoxDecoration();
  if(tableNational.confronto.clubName1 == my.clubName){
    backgroundColor1 = BoxDecoration(
      gradient: gradientMyTeam(false),
    );
  }else if(tableNational.confronto.clubName2 == my.clubName){
    backgroundColor2 = BoxDecoration(
      gradient: gradientMyTeam(true),
    );
  }

  return Row(
    children: [
      Expanded(
        child: Container(
          decoration: backgroundColor1,
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(tableNational.confronto.clubName1,textAlign:TextAlign.end,style: style1),
              const SizedBox(width: 4),
              Images().getEscudoWidget(tableNational.confronto.clubName1,22,22),
            ],
          ),
        ),
      ),

      const SizedBox(width: 4),
      (tableNational.confronto.hasGoals)
          ? Text(tableNational.confronto.goal1.toString(),textAlign:TextAlign.center,style: style1) : Container(),

      const SizedBox(width: 4),
      const Text('x',style: EstiloTextoBranco.text16,textAlign: TextAlign.center,),
      const SizedBox(width: 4),

      (tableNational.confronto.hasGoals)
          ? Text(tableNational.confronto.goal2.toString(),textAlign: TextAlign.center,style: style2) : Container(),
      const SizedBox(width: 4),

      Expanded(
        child: Container(
          decoration: backgroundColor2,
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Images().getEscudoWidget(tableNational.confronto.clubName2,22,22),
              const SizedBox(width: 4),
              Text(tableNational.confronto.clubName2,textAlign:TextAlign.start,style: style1),
            ],
          ),
        ),
      ),
    ],
  );
}