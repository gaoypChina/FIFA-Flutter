
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/widgets/player_templates/health_bar.dart';
import 'package:fifa/widgets/player_templates/row_player_stats.dart';
import 'package:fifa/widgets/popup/popup_player_info.dart';
import 'package:flutter/material.dart';

class PlayerRowAllInfos extends StatelessWidget {
  final int row;
  final int playerIndex;
  final int option;
  final Widget child;
  final Function() notifyParent;
  const PlayerRowAllInfos({Key? key,
    required this.row, required this.playerIndex, required this.option, required this.child, required this.notifyParent}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Jogador player = Jogador(index: playerIndex);
    Color background = Colors.transparent;

    if(row < 11){
      background = Colors.black;
    }

    return Container(
      decoration: BoxDecoration(
        color: background,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Row(
          children: [
            const SizedBox(width: 5),

            PlayerCircle(player: player, scale: 0.9, hasPosition: true),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                playerNameWidget(context, player, notifyParent),
                Row(
                  children: [
                    funcFlagsList(player.nationality, 10, 15),
                    const SizedBox(width: 4),
                    healthBar(context, player, width: Sized(context).width*0.4),
                  ],
                ),
              ],
            ),
            const Spacer(),
            child,

          ],
        ),
      ),
    );
  }

  Widget playerNameWidget(BuildContext context, Jogador player, Function() setState){

    Color nameColor = Colors.white;
    if(player.injury>0 || player.redCard>0 || player.yellowCard==3){
      nameColor = Colors.red;
    }
    return GestureDetector(
      onTap:(){
        popUpOkShowPlayerInfos(
          context: context,
          playerID: player.index,
          funcSetState: setState,
        );
      },
      child: Text(player.name, style: TextStyle(
        color: nameColor,
        fontFamily: 'Rajdhani',
        fontSize: 16,
      )),
    );
  }

}
