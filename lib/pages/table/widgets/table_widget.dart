import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/theme/background_color/color_class_table.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
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
            const SizedBox(width: 220),
            Text(Translation(context).text.points3,style:EstiloTextoBranco.negrito14),
            const SizedBox(width: 10),
            Text(Translation(context).text.goalsFor3,style:EstiloTextoBranco.negrito14),
            const SizedBox(width: 15),
            Text(Translation(context).text.goalsAgainst,style:EstiloTextoBranco.negrito14),
            const SizedBox(width: 15),
            Text(Translation(context).text.goalDifference3,style:EstiloTextoBranco.negrito14),
            const SizedBox(width: 15),
            Text(Translation(context).text.ovr3,style: EstiloTextoBranco.negrito14),
          ],
        ),
      ),

      //TABELA DE CLASSIFICAÇÃO
      Container(
        color: AppColors().greyTransparent,
        child: Table(
          columnWidths: const {
            0: FractionColumnWidth(.06),
            1: FractionColumnWidth(.07),
            2: FractionColumnWidth(.4),
            7: FractionColumnWidth(.1)
          },
          children: [
            for(int i=0; i<league.nClubs;i++)
              rowTableNacionalLayout(context, i, classificationClubsIndexes[i], league)
          ],
        ),
      ),
    ],
  );
}

TableRow rowTableNacionalLayout(BuildContext context, int position, int indexClub, League league) {
  Club clubClass = Club(index: indexClub);
  String clubName = clubClass.name;
  int points = clubClass.leaguePoints;
  int golsMarcados = clubClass.leagueGM;
  int golsSofridos = clubClass.leagueGS;
  int saldo = golsMarcados - golsSofridos;
  double overall = clubClass.getOverall();

  Color backgroundColor = colorBackgroundNationalTable(position,league,clubName);

  return TableRow(
    children: [
      Center(child: Text((position+1).toString()+'°',style: EstiloTextoBranco.text14)),
      GestureDetector(
        onTap: (){
          clickClubProfilePage(context,clubClass);
          },
          child: Images().getEscudoWidget(clubClass.name,26,26)),
      GestureDetector(
        onTap: (){
          clickClubProfilePage(context,clubClass);
        },
        child: Container(
            width: 170,
            height: 28,
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.all(1),
            color: backgroundColor,
            child: Text(clubName, style: EstiloTextoBranco.text16)
        ),
      ),
      Center(child: Text(points.toString(),style: EstiloTextoBranco.text14)),
      Center(child: Text(golsMarcados.toString(),style: EstiloTextoBranco.text14)),
      Center(child: Text(golsSofridos.toString(),style: EstiloTextoBranco.text14)),
      Center(child: Text(saldo.toString(),style: EstiloTextoBranco.text14)),
      Text(overall.toStringAsFixed(2),style: EstiloTextoBranco.text14),

    ],
  );
}

