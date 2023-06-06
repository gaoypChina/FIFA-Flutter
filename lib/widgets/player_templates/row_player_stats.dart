
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:flutter/material.dart';

import '../popup/popup_player_info.dart';

Widget rowPlayer(BuildContext context, Jogador player, int result, String value){
  return GestureDetector(
    onTap: (){
      popUpOkShowPlayerInfos(context: context, playerID: player.index, funcSetState: (){});
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(width: 35,child: Center(child: Text(result.toString()+"° ",style: EstiloTextoBranco.text14))),
          positionContainer(player.position,size: 30,style: EstiloTextoPreto.text12),
          PlayerCircle(player: player, scale: 1.0, hasPosition: true),
          SizedBox(width: 40,child: Text(value,textAlign: TextAlign.center,style: EstiloTextoBranco.negrito16)),

          SizedBox(width:Sized(context).width*0.5,child: Text(player.name,style: EstiloTextoBranco.text16)),

        ],
      ),
    ),
  );
}

class PlayerCircle extends StatelessWidget {
  final Jogador player;
  final double scale;
  final bool hasPosition;
  const PlayerCircle({Key? key, required this.player, required this.scale, required this.hasPosition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClubColors clubColors = ClubDetails().getColors(player.clubName);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: clubColors.secondColor, width: 1.0),
          ),
          child: ClipOval(
            child: Container(
                color: clubColors.primaryColor,
                child: Images().getPlayerPictureWidget(player, 35*scale, 35*scale)),
          ),
        ),

        //POSITION OR CLUB LOGO
        hasPosition
        ?  Padding(
          padding: EdgeInsets.only(top: 24*scale,left: 20*scale),
          child: positionContainer(player.position),
        )
        : Padding(
          padding: EdgeInsets.only(top: 20*scale,left: 20*scale),
          child: Images().getEscudoWidget(player.clubName,22*scale,22*scale),
        ),
      ],
    );
  }
}
