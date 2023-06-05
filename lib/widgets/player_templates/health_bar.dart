
import 'package:fifa/classes/jogador.dart';
import 'package:flutter/material.dart';

Widget healthBar(BuildContext context, Jogador player, {required double width}){
  return SizedBox(
    width: width,
    height: 6,
    child: LinearProgressIndicator(
      value: player.health,
      color: Colors.teal,
      backgroundColor: Colors.grey,
    ),
  );
}

Widget trainBar(BuildContext context, Jogador player, {required double width}){
  return SizedBox(
    width: width,
    height: 6,
    child: LinearProgressIndicator(
      value: player.trainLevel,
      color: Colors.teal,
      backgroundColor: Colors.grey,
    ),
  );
}