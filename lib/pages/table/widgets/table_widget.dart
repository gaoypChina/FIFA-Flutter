import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/background_color/color_class_table.dart';
import 'package:fifa/theme/decoration/my_team_gradient.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:fifa/widgets/number_circle.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

Widget tabelaClassificacaoWidget(BuildContext context,League league){
  List classificationClubsIndexes = Classification(leagueIndex: league.index).classificationClubsIndexes;

  return Column(
    children: [
      Container(
        color: AppColors().greyTransparent,
        child: Row(
          children: [
            const Spacer(),
            SizedBox(width:30, child: Center(child: Text(Translation(context).text.points3,style:EstiloTextoBranco.negrito14))),
            SizedBox(width:30, child: Center(child: Text(Translation(context).text.goalsFor3,style:EstiloTextoBranco.negrito14))),
            SizedBox(width:30, child: Center(child: Text(Translation(context).text.goalsAgainst,style:EstiloTextoBranco.negrito14))),
            SizedBox(width:30, child: Center(child: Text(Translation(context).text.goalDifference3,style:EstiloTextoBranco.negrito14))),
            SizedBox(width:35, child: Center(child: Text(Translation(context).text.ovr3,style:EstiloTextoBranco.negrito14))),
          ],
        ),
      ),

      //TABELA DE CLASSIFICAÇÃO
      Container(
        color: AppColors().greyTransparent,
        child: Column(
          children: [
            for(int i=0; i<league.nClubs;i++)
              rowTableNacionalLayout(context, i, classificationClubsIndexes[i], league)
          ],
        ),
      ),
    ],
  );
}

Widget rowTableNacionalLayout(BuildContext context, int position, int indexClub, League league) {

  Club clubClass = Club(index: indexClub);
  String clubName = clubClass.name;
  int points = clubClass.leaguePoints;
  int golsMarcados = clubClass.leagueGM;
  int golsSofridos = clubClass.leagueGS;
  int saldo = golsMarcados - golsSofridos;
  double overall = clubClass.getOverall();

  Color backgroundColor = colorBackgroundNationalTable(position,league,clubName);
  TextStyle textStyle = EstiloTextoBranco.text14;
  TextStyle textStyle2 = EstiloTextoBranco.text16;
  TextStyle textStyle3 = EstiloTextoBranco.negrito14;
  bool isMyClub = false;
  if(clubName == My().clubName){
    isMyClub = true;
    textStyle = EstiloTextoVerdee.text14;
    textStyle2 = EstiloTextoVerdee.text16;
    textStyle3 = EstiloTextoVerdee.negrito14;
  }

  return PressableButton(
    onTap: (){
      clickClubProfilePage(context,clubClass);
    },
    child: Container(
      width: Sized(context).width,
      decoration: isMyClub
          ? BoxDecoration(gradient: gradientMyTeam(true))
          : BoxDecoration(gradient: gradientTeam(backgroundColor)),
      child: Row(
        children: [

          Stack(
            children: [
              Row(
                children: [
                  numberCircle(position+1, 30),
                  Images().getEscudoWidget(clubClass.name,26,26),
                  const SizedBox(width: 4),
                ],
              )
            ],
          ),
          const SizedBox(width: 4),
          Expanded(
            child: GestureDetector(
              onTap: (){
                clickClubProfilePage(context,clubClass);
              },
              child: Container(
                  height: 28,
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.all(1),
                  child: Text(clubName, style: textStyle2)
              ),
            ),
          ),
          SizedBox(width: 30, child: Center(child: Text(points.toString(),style: textStyle3))),
          SizedBox(width: 30, child: Center(child: Text(golsMarcados.toString(),style: textStyle))),
          SizedBox(width: 30, child: Center(child: Text(golsSofridos.toString(),style: textStyle))),
          SizedBox(width: 30, child: Center(child: Text(saldo.toString(),style: textStyle))),
          Text(overall.toStringAsFixed(2),style: textStyle),

        ],
      ),
    ),
  );
}

