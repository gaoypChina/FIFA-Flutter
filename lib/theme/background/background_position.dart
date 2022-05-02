
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget positionContainer(String position){
  return Container(
    width: 25,
    decoration: BoxDecoration(
      color: colorPositionBackground(position),
      borderRadius: const BorderRadius.all(Radius.circular(5.0) ),
    ),
    padding: const EdgeInsets.all(2),
    child: Text(position, textAlign: TextAlign.center, style: EstiloTextoBranco.text10),
  );
}
Color colorPositionBackground(String position){
  Color colorBackground = Colors.green;
  if(position == 'GOL'){colorBackground = Colors.purple;}
  else if(position == 'LE' || position == 'LD'){colorBackground = const Color(0xFF035821);}
  else if(position == 'ZAG'){colorBackground = Colors.green.shade500;}
  else if(position == 'VOL' || position == 'MC'){colorBackground = Colors.blue;}
  else if(position == 'MEI' || position == 'ME' || position == 'MD'){colorBackground = Colors.orange.shade400;}
  else if(position == 'ATA' || position == 'PE' || position == 'PD'){colorBackground = Colors.red.shade400;}
  else{colorBackground = Colors.red;}
  return colorBackground;
}