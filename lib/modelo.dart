import 'package:fifa/classes/image_class.dart';
import 'package:fifa/values/historic_champions/internationals.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class HistoricPlayers extends StatefulWidget {
  const HistoricPlayers({Key? key}) : super(key: key);

  @override
  State<HistoricPlayers> createState() => _HistoricPlayersState();
}

class _HistoricPlayersState extends State<HistoricPlayers> {

  Map<double,dynamic> results = mapInternationals[LeagueOfficialNames().mundial];

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
              backButtonText(context,'HistoricPlayers'),


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
