import 'package:fifa/classes/club.dart';
import 'package:fifa/theme/background_color/background_position.dart';
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
  TextStyle textStyle = EstiloTextoBranco.text16;
  if(position == 'GOL' && number <3  ||
      position == 'ZAG' && number < 4 ||
      position == 'LE' && number < 2 ||
      position == 'LD' && number < 2 ||
      position == 'VOL' && number < 2 ||
      position == 'MC' && number < 2 ||
      position == 'MEI' && number < 3 ||
      position == 'ATA' && number < 3
  ){
    textStyle = EstiloTextoVermelho.text16;
  }
  if(position == 'GOL' && number >4  ||
      position == 'ZAG' && number >6 ||
      position == 'LE' && number >3 ||
      position == 'LD' && number >3 ||
      position == 'VOL' && number >4 ||
      position == 'MC' && number >4 ||
      position == 'MEI' && number > 6 ||
      position == 'ATA' && number > 6
  ){
    textStyle = EstiloTextoVerde.text16;
  }
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 2.0),
    child: Column(
      children: [
        Container(
            color: colorPositionBackground(position),
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Text(position,style: EstiloTextoBranco.text16)),
        Text(number.toString(),style: textStyle),
      ],
    ),
  );
}