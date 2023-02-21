
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/club_profile/best_players.dart';
import 'package:fifa/widgets/number_player_position.dart';
import 'package:flutter/material.dart';

Widget analiseElenco(BuildContext context, Club club){
  return                 //ANALISE DO ELENCO
    Container(
      height: 200,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      width: Sized(context).width,
      color: AppColors().greyTransparent,
      child: Column(
        children: [
          const Text('Análise do Elenco',style: EstiloTextoBranco.negrito16),

          //BEST PLAYERS BOX
          bestPlayers(club),

          //Jogadores por posição
          playersPerPosition(club),

        ],
      ),
    );
}