
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/pages/table/widgets/organize_league_statistics.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/popup/popup_player_info.dart';
import 'package:flutter/material.dart';

Widget wYellowRedCardWidget(BuildContext context, League league, int goalOrYellowOrRed){

  List leaguePlayers = organizarVariavelLeague(league,  goalOrYellowOrRed);

  return Column(
    children: [
      Row(
        children: [
              goalOrYellowOrRed==0 ? Text(Translation(context).text.topScorers,style: EstiloTextoBranco.negrito18)
              : goalOrYellowOrRed==1 ? Text(Translation(context).text.yellowCards,style: EstiloTextoBranco.negrito18)
              : goalOrYellowOrRed==2 ? Text(Translation(context).text.redCards,style: EstiloTextoBranco.negrito18)
              : goalOrYellowOrRed==3 ? Text(Translation(context).text.assists,style: EstiloTextoBranco.negrito18)
              : goalOrYellowOrRed==4 ? Text(Translation(context).text.bestPlayers,style: EstiloTextoBranco.negrito18)
                  : Container(),
        ],
      ),

      SizedBox(
        height: 205,
        child: SingleChildScrollView(
          child: Table(
            columnWidths: const{
              0: FractionColumnWidth(.07),
              1: FractionColumnWidth(.1),
              2: FractionColumnWidth(.07),
              3: FractionColumnWidth(.45),
              4: FractionColumnWidth(.2)},
            children: [
              for(int i=0; i<70; i++)
                yellowRedCardWidgetRow(context, leaguePlayers[i],goalOrYellowOrRed)
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
      Container(color: colorPositionBackground(player.position),
        child: Center(child: Text(" "+player.position,style: EstiloTextoBranco.text12))),
      Images().getEscudoWidget(player.clubName,25,25),
      Images().getPlayerPictureWidget(player,30,30),
      GestureDetector(
        onTap: (){
          popUpOkShowPlayerInfos(context: context, playerID: player.index, funcSetState: (){});
        },
        child: Container(
            color: player.clubID == My().clubID ? Colors.teal : Colors.transparent,
            child: Text(" "+player.name,style: EstiloTextoBranco.text16)),
      ),
          goalOrYellowOrRed==0 ? Text(player.goalsLeague.toString(),style: EstiloTextoBranco.text16)
            : goalOrYellowOrRed==1 ? Text(player.yellowCard.toString(),style: EstiloTextoBranco.text16)
            : goalOrYellowOrRed==2 ? Text(player.redCard.toString(),style: EstiloTextoBranco.text16)
            : goalOrYellowOrRed==3 ? Text(player.assistsLeague.toString(),style: EstiloTextoBranco.text16)
            : goalOrYellowOrRed==4 ? Text(player.grade.toString(),style: EstiloTextoBranco.text16)
          : Container(),
    ],
  );
}