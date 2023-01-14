import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget cupStatistics(){
  return SingleChildScrollView(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            statisticsBox('Artilheiros'),
            statisticsBox('Assistências'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            statisticsBox('Melhores Jogadores'),
            statisticsBox('Clean Sheets'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            statisticsBox('Cartão Amarelo'),
            statisticsBox('Cartão Vermelho'),
          ],
        ),
      ],
    ),
  );
}

Widget statisticsBox(String title){
  return Flexible(
    child: Container(
      height: 200,
      color: AppColors().greyTransparent,
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.all(4),
      child: Column(
        children: [
          Text(title,style: EstiloTextoBranco.negrito18),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(int i=1;i<=20;i++)
                    rowPlayer(Jogador(index: i*37),i),
                ],
              ),
            ),
          ),

        ],
      ),
    ),
  );
}

Widget rowPlayer(Jogador player, int result){
  return Row(
    children: [
        Images().getEscudoWidget(player.clubName,20,20),
        SizedBox(width:120,child: Text(player.name,style: EstiloTextoBranco.text14)),
        Text(result.toString(),style: EstiloTextoBranco.text14),
    ],
  );
}