import 'package:fifa/classes/jogador.dart';
import 'package:fifa/theme/decoration/black_decoration.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget bestPlayerBox(String atribute, Jogador player){
  return Container(
    width: 120,
    padding: const EdgeInsets.all(4),
    margin: const EdgeInsets.all(4),
    decoration: blackDecoration(),
    child: Column(
      children: [
        Text(atribute,textAlign:TextAlign.center, style: EstiloTextoBranco.negrito18),
        Image.network(player.imageUrl,height: 60,width: 60),
        Text(player.name,textAlign:TextAlign.center, style: EstiloTextoBranco.text14),
      ],
    ),
  );
}