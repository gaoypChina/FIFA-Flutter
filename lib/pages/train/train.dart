import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/pages/train/widgets/row_train.dart';
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
                      return WTrainRow(player: Jogador(index: i));
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


}
