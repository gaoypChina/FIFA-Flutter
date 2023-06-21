import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/tabela_national.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/background_color/match_x_testyle.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget wMatchsTable(int rodadaMatch, League leagueClass){
  return       Container(
    color: AppColors().greyTransparent,
    child: Table(
      columnWidths:
      (rodadaMatch<=rodada)
          ? const {0: FractionColumnWidth(.36),6: FractionColumnWidth(.36)}
          : const {0: FractionColumnWidth(.36),2: FractionColumnWidth(.0),4: FractionColumnWidth(.0),6: FractionColumnWidth(.36)},
      children: [
        for(int i=0; i<(leagueClass.getNTeams()/2);i++)
          wRowMatchesVersus(TableNational(
              chosenLeagueIndex: leagueClass.index,
              leagueClass: leagueClass,
              rodadaMatch: rodadaMatch,
              numeroDoConfronto: i*2
          )),
      ],
    ),
  );
}

TableRow wRowMatchesVersus(TableNational tableNational) {
  TextStyle style1 = matchStyle1(tableNational.goal1, tableNational.goal2, 14);
  TextStyle style2 = matchStyle2(tableNational.goal1, tableNational.goal2, 14);

  My my = My();
  return TableRow(
    children: [
      Container(
        color: tableNational.teamName1 == my.clubName ? Colors.teal : Colors.transparent,
          child: Text(tableNational.teamName1,textAlign:TextAlign.end,style: style1)),
      Images().getEscudoWidget(tableNational.teamName1,22,22),
      (tableNational.showGoals)
          ? Text(tableNational.goal1.toString(),textAlign:TextAlign.center,style: style1) : Container(),
      const Text('x',style: EstiloTextoBranco.text16,textAlign: TextAlign.center,),
      (tableNational.showGoals)
          ? Text(tableNational.goal2.toString(),textAlign: TextAlign.center,style: style2) : Container(),
      Images().getEscudoWidget(tableNational.teamName2,22,22),
      Container(
          color: tableNational.teamName2 == my.clubName ? Colors.teal : Colors.transparent,
          child: Text(tableNational.teamName2,textAlign:TextAlign.start,style: style2)),
    ],
  );
}