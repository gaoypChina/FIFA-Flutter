import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';
import 'package:flutter/material.dart';

Widget moralContainer(Jogador jogador,{double size = 25.0}){
  Color colorBackground = Colors.transparent;
  double angle = 0;
  if(jogador.moral == globalJogadoresMoralNames[0]){
    colorBackground = Colors.green;
    angle = 60;
  }
  if(jogador.moral == globalJogadoresMoralNames[1]){
    colorBackground = Colors.greenAccent;
    angle = 30;
  }
  if(jogador.moral == globalJogadoresMoralNames[2]){
    colorBackground = Colors.yellow;
  }
  if(jogador.moral == globalJogadoresMoralNames[3]){
    colorBackground = Colors.redAccent;
    angle = -30;
  }
  if(jogador.moral == globalJogadoresMoralNames[4]){
    colorBackground = Colors.red;
    angle = -60;
  }
  return Container(
    height: size,
    width: size,
    color: colorBackground,
    child: Transform.rotate(
      angle: -(angle * 3.1415) / 180,
      child: const Icon(Icons.arrow_forward,color: Colors.white,),
    ),
  );
}