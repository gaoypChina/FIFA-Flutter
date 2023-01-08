import 'package:fifa/classes/image_class.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/historic_champions/internationals.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class PreMatch extends StatefulWidget {
  const PreMatch({Key? key}) : super(key: key);

  @override
  State<PreMatch> createState() => _PreMatchState();
}

class _PreMatchState extends State<PreMatch> {

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
              backButtonText(context,'Pre Match'),
              const Text('Simular',style: EstiloTextoBranco.text16),
              const Text('Jogar',style: EstiloTextoBranco.text16),

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
