
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

import 'popup/popup_player_info.dart';

Widget rowPlayer(BuildContext context, Jogador player, int result, String value){
  return GestureDetector(
    onTap: (){
      popUpOkShowPlayerInfos(context: context, playerID: player.index, funcSetState: (){});
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(width: 35,child: Text(result.toString()+"- ",style: EstiloTextoBranco.text14)),
          Images().getEscudoWidget(player.clubName,25,25),
          //Images().getPlayerPictureWidget(player, 35, 35),
          SizedBox(width: 40,child: Text(value,textAlign: TextAlign.center,style: EstiloTextoBranco.negrito16)),

          positionContainer(player.position,size: 30,style: EstiloTextoPreto.text12),
          SizedBox(width:180,child: Text(player.name,style: EstiloTextoBranco.text16)),
        ],
      ),
    ),
  );
}