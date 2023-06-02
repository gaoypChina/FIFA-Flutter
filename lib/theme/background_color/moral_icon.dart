import 'package:fifa/global_variables.dart';
import 'package:flutter/material.dart';

Widget moralContainer(String moral,{double size = 25.0}){
  Color colorBackground = Colors.transparent;
  double angle = 0;
  if(moral == globalJogadoresMoralNames[0]){
    colorBackground = Colors.green;
    angle = 60;
  }
  else if(moral == globalJogadoresMoralNames[1]){
    colorBackground = Colors.greenAccent;
    angle = 30;
  }
  else if(moral == globalJogadoresMoralNames[2]){
    colorBackground = Colors.yellow;
  }
  else if(moral == globalJogadoresMoralNames[3]){
    colorBackground = Colors.redAccent;
    angle = -30;
  }
  else if(moral == globalJogadoresMoralNames[4]){
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