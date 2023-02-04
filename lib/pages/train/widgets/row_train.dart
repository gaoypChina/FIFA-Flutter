import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/theme/background_color/background_age.dart';
import 'package:fifa/theme/background_color/background_overall.dart';
import 'package:flutter/material.dart';

import '../../../theme/textstyle.dart';

class WTrainRow extends StatefulWidget {
  final Jogador player;
  const WTrainRow({Key? key,required this.player}) : super(key: key);
  @override
  State<WTrainRow> createState() => _WTrainRowState();
}

class _WTrainRowState extends State<WTrainRow> {
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    Jogador player = widget.player;
    return Row(
      children: [
        Images().getPlayerPictureWidget(player),
        Column(
          children: [

            Row(
              children: [
                SizedBox(width:Sized(context).width*0.6, child: Text(player.name,style: EstiloTextoBranco.text20)),
                Container(color: colorOverallBackground(player.overall),
                    child: Text(player.overall.toString(),style: EstiloTextoPreto.text20)),
                Container(color: colorAgeBackground(player.age),
                    child: Text(player.age.toString(),style: EstiloTextoPreto.text20)),
              ],
            ),

            const SizedBox(height: 8),
            //Barra de saúde
            SizedBox(
              width: Sized(context).width*0.7,
              height: 6,
              child: LinearProgressIndicator(
                value: player.health,
                color: Colors.teal,
                backgroundColor: Colors.grey,
              ),
            ),
            //Barra de saúde
            SizedBox(
              width: Sized(context).width*0.7,
              height: 6,
              child: LinearProgressIndicator(
                value: player.trainLevel,
                color: Colors.blue,
                backgroundColor: Colors.grey,
              ),
            ),
          ],
        ),
        Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: Checkbox(
              value: checkedValue,
              onChanged: (newValue) {
                setState(() {
                  // checkedValue = newValue;
                });
              },
            ),
          ),
        ),

      ],
    );
  }
}
