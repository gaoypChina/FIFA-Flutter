
import 'package:flutter/cupertino.dart';

Widget fieldSizeWidget(Widget childrenWidget){
  return SizedBox(
    height: 342,
    child: Stack(
      children: [
        //Campo
        Image.asset('assets/icons/campo metade.png',height:double.infinity,width:double.infinity,fit:BoxFit.fill),

        childrenWidget,
      ],
    ),
  );
}