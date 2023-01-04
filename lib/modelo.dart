import 'package:fifa/classes/image_class.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/historic_champions/internationals.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class ChooseContinentPage extends StatefulWidget {
  const ChooseContinentPage({Key? key}) : super(key: key);

  @override
  State<ChooseContinentPage> createState() => _ChooseContinentPageState();
}

class _ChooseContinentPageState extends State<ChooseContinentPage> {

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
              backButtonText(context,'ChooseContinentPage'),
              const Text('a',style: EstiloTextoBranco.text16),

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
