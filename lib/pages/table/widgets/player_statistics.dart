
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/player_stats_keys.dart';
import 'package:fifa/pages/table/widgets/organize_league_statistics.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/popup/popup_player_info.dart';
import 'package:fifa/widgets/row_player_stats.dart';
import 'package:flutter/material.dart';

Widget wYellowRedCardWidget(BuildContext context, League league, int goalOrYellowOrRed){

  List leaguePlayers = organizarVariavelLeague(league,  goalOrYellowOrRed);

  String playerStats(String title, Jogador player){
    String value = "";
    if(title == FilterPlayersTitle().bestPlayer){ value =  player.grade.toStringAsFixed(1);}
    if(title == FilterPlayersTitle().artilheiros){ value =  player.goalsLeague.toString();}
    if(title == FilterPlayersTitle().assists){ value =  player.assistsLeague.toString();}
    if(title == FilterPlayersTitle().cleanSheets){ value =  player.cleanSheetsLeague.toString();}
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              for(int i=0; i<70 && i < leaguePlayers.length; i++)
                rowPlayer(context, Jogador(index: leaguePlayers[i]), i+1, playerStats(title, Jogador(index: leaguePlayers[i]))),
            ],
          ),
        ),
      ),
    ],
  );
}
TableRow yellowRedCardWidgetRow(BuildContext context, int playerID,int goalOrYellowOrRed){
  Jogador player = Jogador(index: playerID);

  return TableRow(
    children: [
      positionContainer(player.position),
      Images().getEscudoWidget(player.clubName,25,25),
      ClipOval(child: Images().getPlayerPictureWidget(player,30,30)),
      GestureDetector(
        onTap: (){
          popUpOkShowPlayerInfos(context: context, playerID: player.index, funcSetState: (){});
        },
        child: Container(
            color: player.clubID == My().clubID ? Colors.teal : Colors.transparent,
            child: Text(" "+player.name,style: EstiloTextoBranco.text16)),
      ),
          goalOrYellowOrRed==0 ? Text(player.goalsLeague.toString(),style: EstiloTextoBranco.negrito16)
            : goalOrYellowOrRed==1 ? Text(player.yellowCard.toString(),style: EstiloTextoBranco.negrito16)
            : goalOrYellowOrRed==2 ? Text(player.redCard.toString(),style: EstiloTextoBranco.negrito16)
            : goalOrYellowOrRed==3 ? Text(player.assistsLeague.toString(),style: EstiloTextoBranco.negrito16)
            : goalOrYellowOrRed==4 ? Text(player.grade.toString(),style: EstiloTextoBranco.negrito16)
              : goalOrYellowOrRed==5 ? Text(player.cleanSheetsLeague.toString(),style: EstiloTextoBranco.negrito16)
          : Container(),
    ],
  );
}