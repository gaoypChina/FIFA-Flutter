import 'package:fifa/classes/club.dart';
import 'package:fifa/theme/background/background_position.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget playersPerPosition(Club club){
  return                   Container(
    margin: const EdgeInsets.symmetric(vertical: 6),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i=0;i<club.nPlayersPerPositions().keys.length;i++)
            positionsCount(club.nPlayersPerPositions().keys.elementAt(i),club.nPlayersPerPositions().values.elementAt(i)),
        ],
      ),
    ),
  );
}
Widget positionsCount(String position, int number){
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 2.0),
    child: Column(
      children: [
        Container(
            color: colorPositionBackground(position),
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Text(position,style: EstiloTextoBranco.text16)),
        Text(number.toString(),style: EstiloTextoBranco.text16),
      ],
    ),
  );
}