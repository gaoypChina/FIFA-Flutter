import 'package:fifa/classes/jogador.dart';
import 'package:fifa/theme/decoration/black_decoration.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget bestPlayerBox(String atribute, Jogador player, String info){
  return Container(
    width: 95,
    padding: const EdgeInsets.all(4),
    margin: const EdgeInsets.all(4),
    decoration: blackDecoration(),
    child: Column(
      children: [
        Text(atribute,textAlign:TextAlign.center, style: EstiloTextoBranco.negrito16),
        Image.network(player.imageUrl,height: 60,width: 60),
        const SizedBox(height: 4),
        Text(player.name,textAlign:TextAlign.center, maxLines: 2, style: EstiloTextoBranco.text12),
        const SizedBox(height: 4),
        Text(info,textAlign:TextAlign.center, maxLines: 2, style: EstiloTextoBranco.text12),
        const SizedBox(height: 4),
      ],
    ),
  );
}