import 'package:fifa/classes/image_class.dart';
import 'package:fifa/page_controller/map/map_game_settings.dart';
import 'package:fifa/pages/map/map_gameplay.dart';
import 'package:fifa/pages/map/map_gameplay_club_stadium.dart';
import 'package:fifa/pages/map/map_gameplay_logo.dart';
import 'package:fifa/pages/map/map_gameplay_markers.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class MapConfig2 extends StatefulWidget {
  final MapGameSettings mapGameSettings;
  const MapConfig2({Key? key, required this.mapGameSettings}) : super(key: key);

  @override
  State<MapConfig2> createState() => _MapConfig2State();
}

class _MapConfig2State extends State<MapConfig2> {

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

              Text('Modo: '+widget.mapGameSettings.selectedNivel+" "+widget.mapGameSettings.mode,style: EstiloTextoBranco.negrito22),

              optionsRow('Estádio-time',MapGameModeNames().estadioTime,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapGameplayStadium4Club(mapGameSettings: widget.mapGameSettings)));
              }),
              optionsRow('time-estádio',MapGameModeNames().timeEstadio,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapGameplayClubStadium(mapGameSettings: widget.mapGameSettings)));
              }),
              optionsRow('Markers',MapGameModeNames().markers,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapGameplayMarkers(mapGameSettings: widget.mapGameSettings)));
              }),
              optionsRow('Logos',MapGameModeNames().logos,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapGameplayLogo(mapGameSettings: widget.mapGameSettings)));
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

  Widget optionsRow(String text, String gameplayName, Function function){
    int nStars = 0;
    int maxStars = 1;

    nStars = widget.mapGameSettings.hasStar(
        nivel: widget.mapGameSettings.selectedNivel,
        mode: widget.mapGameSettings.mode,
        gameplayName: gameplayName,
    );

    String recordText = '';

    int record = widget.mapGameSettings.getRecord(
      nivel: widget.mapGameSettings.selectedNivel,
      mode: widget.mapGameSettings.mode,
      gameplayName: gameplayName
    );

    recordText = '${record.toString()}/'+MapGameModeNames().mapStarsValue(widget.mapGameSettings.mode).toString();

    return GestureDetector(
      onTap: (){
        widget.mapGameSettings.gameplayName = gameplayName;
        function();
      },
      child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          decoration: decorations(),
          child: Row(
            children: [
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text,style: EstiloTextoBranco.text20,),
                  Text('Recorde: '+recordText,style: EstiloTextoBranco.text12,),
                ],
              ),
              const Spacer(),
              Icon(Icons.star,color: nStars == maxStars ? Colors.yellow : Colors.white),
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
