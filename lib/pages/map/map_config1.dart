import 'package:fifa/classes/image_class.dart';
import 'package:fifa/page_controller/map/map_game_settings.dart';
import 'package:fifa/pages/map/map_config2.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class MapConfig1 extends StatefulWidget {
  final MapGameSettings mapGameSettings;
  const MapConfig1({Key? key, required this.mapGameSettings}) : super(key: key);

  @override
  State<MapConfig1> createState() => _MapConfig1State();
}

class _MapConfig1State extends State<MapConfig1> {

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
              backButtonText(context, 'Configurações'),

              Text('Modo: '+widget.mapGameSettings.selectedNivel,style: EstiloTextoBranco.negrito22),

              optionsRow('Normal',MapGameModeNames().mode4options,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapConfig2(mapGameSettings: widget.mapGameSettings)));
              }),
              optionsRow('1 minuto',MapGameModeNames().mode1minute,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapConfig2(mapGameSettings: widget.mapGameSettings)));
              }),
              optionsRow('Sem errar',MapGameModeNames().modeSemErrar,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapConfig2(mapGameSettings: widget.mapGameSettings)));
              }),


            ],
          ),
        ],
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

  Widget optionsRow(String text, String mode, Function function){
    int nStars = 0;
    int maxStars = 3;

    nStars = widget.mapGameSettings.hasStars3(
      nivel: widget.mapGameSettings.selectedNivel,
      mode: mode,
    );

    return GestureDetector(
       onTap: (){
         widget.mapGameSettings.mode = mode;
        function();
      },
      child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
        decoration: decorations(),
          child: Row(
        children: [
          const SizedBox(width: 8),
          Text(text,style: EstiloTextoBranco.text20,),
          const Spacer(),
          Icon(Icons.star,color: nStars == maxStars ? Colors.yellow : Colors.white),
          Text(nStars.toString()+'/'+maxStars.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text14,),

        ],
      )
      ),
    );
  }

  BoxDecoration decorations(){
    return BoxDecoration(
        color: AppColors().greyTransparent,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          width: 2.0,
          color: Colors.greenAccent,
        )
    );
  }

}
