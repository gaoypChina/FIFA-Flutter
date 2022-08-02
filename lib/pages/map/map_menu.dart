import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/functions/contries_continents.dart';
import 'package:fifa/page_controller/map/map_game_settings.dart';
import 'package:fifa/pages/map/map_config1.dart';
import 'package:fifa/pages/map/map_exploration.dart';
import 'package:fifa/pages/map/map_list_all_clubs.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class MapMenu extends StatefulWidget {
  const MapMenu({Key? key}) : super(key: key);

  @override
  State<MapMenu> createState() => _MapMenuState();
}

class _MapMenuState extends State<MapMenu> {


  MapGameSettings mapGameSettings = MapGameSettings();
 bool loaded = false;
////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    onInit();
    super.initState();
  }
  onInit() async{
    mapGameSettings = MapGameSettings();
    mapGameSettings.setDifficulty();
    await mapGameSettings.getSaveNames();
    print(mapGameSettings.saveNames);
    loaded=true;
    setState((){});
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
                backButtonText(context, 'Mapa'),
                const Text('MAP GAME',style: EstiloTextoBranco.text40),

                loaded ? SingleChildScrollView(
                  child: Container(
                    width: Sized(context).width,
                    margin: const EdgeInsets.all(12),
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.6,1],
                          colors: [
                            Colors.white24,
                            Colors.transparent,
                          ],
                        ),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            gameButton('Nível 1',MapGameModeNames().nivel1,(){
                              mapGameSettings.difficulty == 0;
                              Navigator.push(context,MaterialPageRoute(builder: (context) => MapConfig1(mapGameSettings: mapGameSettings)));
                            }),
                            gameButton('Nível 2',MapGameModeNames().nivel2,(){
                              mapGameSettings.difficulty == 1;
                              Navigator.push(context,MaterialPageRoute(builder: (context) => MapConfig1(mapGameSettings: mapGameSettings)));
                            }),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            gameButton('Nível 3',MapGameModeNames().nivel3,(){
                              mapGameSettings.difficulty == 2;
                              Navigator.push(context,MaterialPageRoute(builder: (context) => MapConfig1(mapGameSettings: mapGameSettings)));
                            }),
                            gameButton('Europa',Continents().europa,(){
                              mapGameSettings.selectedContinents.add(Continents().europa);
                              Navigator.push(context,MaterialPageRoute(builder: (context) => MapConfig1(mapGameSettings: mapGameSettings)));
                            }),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            gameButton('América do Sul',Continents().americaSul,(){
                              mapGameSettings.selectedContinents = [Continents().americaSul];
                              Navigator.push(context,MaterialPageRoute(builder: (context) => MapConfig1(mapGameSettings: mapGameSettings)));
                            }),
                            gameButton('América do Norte',Continents().americaNorte,(){
                              mapGameSettings.selectedContinents = [Continents().americaNorte];
                              Navigator.push(context,MaterialPageRoute(builder: (context) => MapConfig1(mapGameSettings: mapGameSettings)));
                            }),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            gameButton('África', Continents().africa,(){
                              mapGameSettings.selectedContinents = [Continents().africa];
                              Navigator.push(context,MaterialPageRoute(builder: (context) => MapConfig1(mapGameSettings: mapGameSettings)));
                            }),
                            gameButton('Ásia',Continents().asia,(){
                              mapGameSettings.selectedContinents = [Continents().asia,Continents().oceania];
                              Navigator.push(context,MaterialPageRoute(builder: (context) => MapConfig1(mapGameSettings: mapGameSettings)));
                            }),
                          ],
                        ),

                      ],
                    ),
                  ),
                ) : Container(),

                const Spacer(),
                Container(
                  margin: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      gameButton2('Exploração Livre',(){Navigator.push(context,MaterialPageRoute(builder: (context) => const MapPage()));}),
                      gameButton2('Lista de Clubes',(){Navigator.push(context,MaterialPageRoute(builder: (context) => const MapListAllClubs()));}),

                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

Widget gameButton(String text, selectedNivel, Function function){
    int nStars = 0;
    int maxStars = 9;

    nStars = mapGameSettings.hasStars9(
      nivel: selectedNivel,
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          mapGameSettings.selectedNivel = selectedNivel;
          function();
        },
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(8),
        decoration: decorations(),
        child: Column(
          children: [
            Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.text20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star,color: nStars == maxStars ? Colors.yellow : Colors.white),
                Text(nStars.toString()+'/'+maxStars.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text14,),

              ],
            )
          ],
        ),
      ),
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

  Widget gameButton2(String text, Function function){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          function();
        },
        child: Container(
          width: 100,
          height: 60,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColors().greyTransparent,
              borderRadius: const BorderRadius.all(Radius.circular(5))
          ),
          child: Center(child: Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.text16,)),
        ),
      ),
    );
  }

}
