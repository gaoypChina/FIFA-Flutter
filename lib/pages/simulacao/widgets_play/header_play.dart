import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/simulate/my_match/my_match_simulation.dart';
import 'package:fifa/pages/simulacao/pre_match.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget headerPlay(BuildContext context, MyMatchSimulation myMatchSimulation){

  String textRodada = getTextRodada(context, myMatchSimulation.myClubClass.leagueID);

  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors().greyTransparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Escudo time 1
          Images().getEscudoWidget(myMatchSimulation.myClubClass.name,80,80),

          Column(
            children: [
              Images().getWeekCompetitionLogo(myMatchSimulation.myClass),
              Text(textRodada,style: EstiloTextoBranco.text16),
              myMatchSimulation.visitante
                  ? Text(myMatchSimulation.meuGolSofrido.toString() +'X'+ myMatchSimulation.meuGolMarcado.toString(),style: EstiloTextoBranco.text30)
                  : Text(myMatchSimulation.meuGolMarcado.toString() +'X'+ myMatchSimulation.meuGolSofrido.toString(),style: EstiloTextoBranco.text30),
              Text(myMatchSimulation.milis.toString()+'\'',style: EstiloTextoBranco.text16),
            ],
          ),

          //Escudo time 2
          Images().getEscudoWidget(myMatchSimulation.adversarioClubClass.name,80,80),

        ],
      ),
    ),
  );
}