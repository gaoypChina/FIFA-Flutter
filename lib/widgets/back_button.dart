import 'package:flutter/material.dart';

Widget backButton(BuildContext context){
  return Row(
    children: [
      IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: const Icon(Icons.keyboard_return,color: Colors.white,size: 40)
      ),
    ],
  );
}