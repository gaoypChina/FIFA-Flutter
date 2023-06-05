import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget backButton(BuildContext context){
  return IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 30));
}

Widget backButtonText(BuildContext context, String text){
  return Container(
    margin: const EdgeInsets.only(top:30),
    child: Row(
      children: [
        const SizedBox(width: 8),
        backButton(context),
        Text(text,style: EstiloTextoBranco.text22),
      ],
    ),
  );
}