import 'package:fifa/classes/image_class.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class MapStatistics extends StatefulWidget {
  const MapStatistics({Key? key}) : super(key: key);

  @override
  State<MapStatistics> createState() => _MapStatisticsState();
}

class _MapStatisticsState extends State<MapStatistics> {
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
              backButtonText(context, 'Statistcs'),

              const Text('Statistcs',style: EstiloTextoBranco.text14,),
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
