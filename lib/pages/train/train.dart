import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/background_color/background_age.dart';
import 'package:fifa/theme/background_color/background_overall.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class TrainPlayersPage extends StatefulWidget {
  const TrainPlayersPage({Key? key}) : super(key: key);

  @override
  State<TrainPlayersPage> createState() => _TrainPlayersPageState();
}

class _TrainPlayersPageState extends State<TrainPlayersPage> {


  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          Images().getWallpaper(),

          Column(
            children: [
              backButtonText(context,'Treinar Jogadores'),
              Expanded(
                child: ListView.builder(
                    itemCount: My().jogadores.length,
                    itemBuilder: (c, i){
                      return rowTrain(Jogador(index: i));
                    }),
              )
            ],
          ),


        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget rowTrain(Jogador player){
    bool checkedValue = false;
    return Row(
      children: [
        Images().getPlayerPictureWidget(player),
        Column(
          children: [

            Row(
              children: [
                Container(width:Sized(context).width*0.6, child: Text(player.name,style: EstiloTextoBranco.text20)),
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
          ],
        ),
        Center(
          child: Container(
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
