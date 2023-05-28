import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/widgets/best_player_box/best_player_box.dart';
import 'package:flutter/material.dart';

Widget bestPlayers(Club club) {
  List jogadores = club.getJogadores();
  List<Jogador> jogadoresClass = [];
  List craqueValue=[],artilheiroValue=[],assistenteValue=[],mvpValue=[];

  for(int playerID in jogadores){
    jogadoresClass.add(Jogador(index: playerID));
    craqueValue.add(jogadoresClass.last.overall);
    mvpValue.add(jogadoresClass.last.price.floor());
    artilheiroValue.add(jogadoresClass.last.goalsLeague);
    assistenteValue.add(jogadoresClass.last.assistsLeague);
  }

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        bestPlayerBox('Craque', jogadoresClass.elementAt(getMaxIndex(craqueValue)),"${getValue(craqueValue).toString()} OVR"),
        bestPlayerBox('MVP', jogadoresClass.elementAt(getMaxIndex(mvpValue)),"\$ ${getValue(mvpValue).toString()}"),
        bestPlayerBox('Artilheiro', jogadoresClass.elementAt(getMaxIndex(artilheiroValue)),"${getValue(artilheiroValue).toString()} G"),
        bestPlayerBox('Assistente', jogadoresClass.elementAt(getMaxIndex(assistenteValue)),"${getValue(assistenteValue).toString()} A"),
      ],
    ),
  );
}
getValue(List lista){
  return lista.elementAt(getMaxIndex(lista));
}
getMaxIndex(List lista){
  //pega o index na lista com o valor máximo
  int maxValue = lista.reduce((curr, next) => curr > next? curr: next);
  int index = lista.indexOf(maxValue);
  return index;
}