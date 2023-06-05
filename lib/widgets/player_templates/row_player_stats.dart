
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
          Stack(
            children: [
              ClipOval(
                child: Container(
                    color: ClubDetails().getColors(player.clubName).primaryColor,
                    child: Images().getPlayerPictureWidget(player, 35, 35)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20),
                child: Images().getEscudoWidget(player.clubName,22,22),
              ),
            ],
          ),
          SizedBox(width: 40,child: Text(value,textAlign: TextAlign.center,style: EstiloTextoBranco.negrito16)),

          SizedBox(width:Sized(context).width*0.5,child: Text(player.name,style: EstiloTextoBranco.text16)),

        ],
      ),
    ),
  );
}