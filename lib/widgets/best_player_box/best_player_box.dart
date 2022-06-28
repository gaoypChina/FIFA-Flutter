import 'package:fifa/classes/jogador.dart';
import 'package:fifa/theme/decoration/black_decoration.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget bestPlayerBox(String atribute, Jogador player){
  return Container(
    width: 100,
    padding: const EdgeInsets.all(4),
    margin: const EdgeInsets.all(4),
    decoration: blackDecoration(),
    child: Column(
      children: [
        Text(atribute,style: EstiloTextoBranco.negrito18),
        Image.network(player.imageUrl,height: 50,width: 50),
        Text(player.name,style: EstiloTextoBranco.text14),
      ],
    ),
  );
}