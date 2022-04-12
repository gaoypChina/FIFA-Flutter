import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button_continue.dart';

Widget returnButton(BuildContext context){
  double _height = MediaQuery.of(context).size.height;
  return Container(
    alignment: Alignment.bottomRight,
    height: _height,
    padding: const EdgeInsets.only(bottom: 4),
    child:                     //VOLTAR
    customButtonContinue(
        title: 'VOLTAR',
        function: (){
          Navigator.pop(context);
        }
    ),
  );
}