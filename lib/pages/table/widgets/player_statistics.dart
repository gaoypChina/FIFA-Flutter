import 'package:fifa/classes/dict_keys/player_stats_keys.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/pages/table/widgets/organize_league_statistics.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/player_templates/row_player_stats.dart';
import 'package:flutter/material.dart';

Widget wYellowRedCardWidget(BuildContext context, League league, int goalOrYellowOrRed){

  List leaguePlayers = organizarVariavelLeague(league,  goalOrYellowOrRed);

  String playerStats(String title, Jogador player){
    String value = "";
    if(title == FilterPlayersTitle().bestPlayer){ value =  player.gradeLeague.toStringAsFixed(1);}
    if(title == FilterPlayersTitle().artilheiros){ value =  player.goalsLeague.toString();}
    if(title == FilterPlayersTitle().assists){ value =  player.assistsLeague.toString();}
    if(title == FilterPlayersTitle().cleanSheets){ value =  player.cleanSheetsLeague.toString();}
    if(title == FilterPlayersTitle().golsSofridos){ value =  player.golsSofridosLeague.toString();}
    if(title == FilterPlayersTitle().redCards){ value =  player.redCard.toString();}
    if(title == FilterPlayersTitle().yellowCards){ value =  player.yellowCard.toString();}
    return value;
  }

  Map map = {
    0: FilterPlayersTitle().artilheiros,
    1: FilterPlayersTitle().yellowCards,
    2: FilterPlayersTitle().redCards,
    3: FilterPlayersTitle().assists,
    4: FilterPlayersTitle().bestPlayer,
    5: FilterPlayersTitle().cleanSheets,
    6: FilterPlayersTitle().golsSofridos,
  };
  String title = map[goalOrYellowOrRed];

  return Column(
    children: [
      Row(
        children: [
          Text(title,style: EstiloTextoBranco.negrito18)
        ],
      ),

      Expanded(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: leaguePlayers.length > 50 ? 50 : leaguePlayers.length,
          itemBuilder: (context, index) {
            return rowPlayer(
              context,
              Jogador(index: leaguePlayers[index]),
              index + 1,
              playerStats(title, Jogador(index: leaguePlayers[index])),
            );
          },
        ),
      ),
    ],
  );
}