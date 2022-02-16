
import 'package:flutter/material.dart';

import 'button_style.dart';

Widget returnButton(BuildContext context){
  double _height = MediaQuery.of(context).size.height;
  return Container(
    alignment: Alignment.bottomRight,
    height: _height,
    padding: const EdgeInsets.only(right: 12.0,bottom: 4),
    child:                     //VOLTAR
    customButtonContinue(
        title: 'VOLTAR',
        function: (){
          Navigator.pop(context);
        }
    ),
  );
}