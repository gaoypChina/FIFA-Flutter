import 'package:fifa/classes/functions/esquemas_taticos.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/match/match.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/background_color/background_overall.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/popup/popup_player_info.dart';
import 'package:flutter/material.dart';

Widget fieldWidgetSelection(BuildContext context, List playersIDs, My my, bool rotate){
  if(my.jogadores == playersIDs) {
    if (my.esquemaTatico == EsquemaTatico().e442) {
      return fieldGameplay442(context, my.jogadores, false, rotate);
    }

  }
    return fieldGameplay442(context, playersIDs, false, rotate);

}

Widget fieldGameplay442(BuildContext context, List playersIDs, bool isPlayingMatch, bool rotate){
  if(!rotate){
    return Column(
      children: [
        //ATACANTES
        playerWidgetRow(context, [playersIDs[9],playersIDs[10]], isPlayingMatch),
        //MEIAS
        playerWidgetRow(context, [playersIDs[7], playersIDs[8]], isPlayingMatch, true),
        //VOLANTES
        playerWidgetRow(context, [playersIDs[5], playersIDs[6]], isPlayingMatch),
        //ZAGUEIROS
        playerWidgetRow(context, [playersIDs[1],playersIDs[2],playersIDs[3],playersIDs[4]], isPlayingMatch),
        //GOLEIRO
        playerWidgetRow(context, [playersIDs[0]], isPlayingMatch),

      ],
    );
  }

  return Column(
    children: [
      //GOLEIRO
      playerWidgetRow(context, [playersIDs[0]], isPlayingMatch),
      //ZAGUEIROS
      playerWidgetRow(context, [playersIDs[1],playersIDs[2],playersIDs[3],playersIDs[4]], isPlayingMatch),
      //VOLANTES
      playerWidgetRow(context, [playersIDs[5], playersIDs[6]], isPlayingMatch),
      //MEIAS
      playerWidgetRow(context, [playersIDs[7], playersIDs[8]], isPlayingMatch, true),
      //ATACANTES
      playerWidgetRow(context, [playersIDs[9],playersIDs[10]], isPlayingMatch),

    ],
  );

}

Widget playerWidgetRow(BuildContext context, List playersID, bool isPlayingMatch, [bool spaceBetween=false]){
    return Row(
      mainAxisAlignment: spaceBetween ? MainAxisAlignment.spaceBetween : MainAxisAlignment.spaceAround,
      children: [
        for(int i=0;i<playersID.length;i++)
        playerFieldWidget(context, playersID, i, isPlayingMatch),
      ],
    );
}

Widget playerFieldWidget(BuildContext context, List jogadores, int playerIndex, bool isPlayingMatch){

  Jogador player = Jogador(index: jogadores[playerIndex]);

  bool yellowCard = false;
  bool redCard = false;
  bool injury = false;
  bool goal = false;
  double healthBar = 1.0;
  if(isPlayingMatch){
    MatchStats matchClass = MatchStats(playerID: playerIndex);
    yellowCard = matchClass.yellowCard>0;
    redCard = matchClass.redCard>0;
    injury = matchClass.injury>0;
    goal = matchClass.goals>0;
    healthBar = matchClass.health;
  }

  String name = player.nameResume;
  String position = player.position;
  double imageHeight = 45;
  double imageWidth = 70;

  String circleShow = player.overallDynamic.toStringAsFixed(0);
  Color colorBackground = colorOverallBackground(player.overallDynamic);

  if(injury || redCard){healthBar=0;}

  return GestureDetector(
    onTap:(){
      //PLAYER INFOS
      popUpOkShowPlayerInfos(
          context: context,
          playerID: player.index,
          funcSetState: (){}
      );
    },
    child: Center(
      child: Column(
        children: [

          SizedBox(
            height: imageHeight,
            width: imageWidth,
            child: Stack(
              children: [

                //Uniforme
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Opacity(
                  opacity: (player.injury >0 || player.redCard >0) ? 0.4 : 1,
                  child: Images().getUniformWidget(player.clubName,50,imageWidth)
                  ),
                ),

                //GOL
                Container(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 12,
                    width: 12,
                    margin: const EdgeInsets.all(4),
                    color: yellowCard ? Colors.yellow : redCard ? Colors.red : Colors.transparent,
                  ),
                ),

                //BOLA
                goal ? Container(
                    alignment: Alignment.bottomRight,
                    child: Image.asset('assets/icons/bola.png',height: 20,width: 20)
                )
                    : Container(),

                //CIRCULO
                Container(
                  alignment: Alignment.bottomRight,
                  child: Image.asset('assets/icons/circulo.png',height: 20),
                ),

                //OVR
                Container(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      padding: const EdgeInsets.only(top:3, left:1, right:2),
                      decoration: BoxDecoration(
                        color: colorBackground,
                        shape: BoxShape.circle,
                      ),
                      width: 20,
                      child: Text(circleShow,textAlign: TextAlign.center, style: EstiloTextoPreto.text14)),
                ),

                //POSIÇÃO
                Container(
                  alignment: Alignment.bottomLeft,
                  child: positionContainer(position),
                ),

              ],
            ),
          ),
          //Barra de saúde
          SizedBox(
            width: imageWidth+10,
            child: LinearProgressIndicator(
              value: healthBar,
              color: Colors.teal,
              backgroundColor: Colors.grey,
            ),
          ),
          //Nome do jogador
          Container(
              color: AppColors().greyTransparent,
              width: imageWidth+10,
              child: Text(name,textAlign: TextAlign.center,style: EstiloTextoBranco.text10)
          ),

        ],
      ),
    ),
  );
}