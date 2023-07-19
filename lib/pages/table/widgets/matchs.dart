import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/table/tabela_national.dart';
import 'package:fifa/theme/colors.dart';
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
