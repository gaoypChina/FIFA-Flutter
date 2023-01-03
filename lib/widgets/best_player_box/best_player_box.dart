import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/theme/decoration/black_decoration.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget bestPlayerBox(String atribute, Jogador player, String info){
  return Container(
    width: 90,
    padding: const EdgeInsets.all(4),
    margin: const EdgeInsets.all(4),
    decoration: blackDecoration(),
    child: Column(
      children: [
        Text(atribute,textAlign:TextAlign.center, style: EstiloTextoBranco.negrito16),
        Images().getPlayerPictureWidget(player,60,60),
        const SizedBox(height: 4),
        Text(player.name,textAlign:TextAlign.center, maxLines: 2, style: EstiloTextoBranco.text12),
        const SizedBox(height: 4),
        Text(info,textAlign:TextAlign.center, maxLines: 2, style: EstiloTextoBranco.text12),
        const SizedBox(height: 4),
      ],
    ),
  );
}