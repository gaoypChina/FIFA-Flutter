import 'package:fifa/classes/image_class.dart';
import 'package:fifa/page_controller/map/map_game_settings.dart';
import 'package:fifa/pages/map/map_gameplay.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class MapConfig extends StatefulWidget {
  const MapConfig({Key? key}) : super(key: key);

  @override
  State<MapConfig> createState() => _MapConfigState();
}

class _MapConfigState extends State<MapConfig> {

  MapGameSettings mapGameSettings = MapGameSettings();

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
              continents(),
              dificuldade(),

              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => MapGameplay(mapGameSettings: mapGameSettings)));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      child: Image.asset('assets/icons/button_right.png',height: 60,width: 60),
                    ),
                  ),

                ],
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
  Widget continents(){
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Text('Continentes',style: EstiloTextoBranco.negrito18,),
          continentRow('Europa'),
          continentRow('América do Sul'),
          continentRow('América do Norte'),
          continentRow('Ásia'),
          continentRow('África'),
        ],
      ),
    );
  }
  Widget continentRow(String text){
    return Row(
      children: [
        Checkbox(
          value: mapGameSettings.selectedContinents.contains(text),
          onChanged: (newValue) {
            if(mapGameSettings.selectedContinents.contains(text)){
              mapGameSettings.selectedContinents.remove(text);
            }else{
              mapGameSettings.selectedContinents.add(text);
            }
            setState(() {
            });
          },
        ),
        Image.asset(Images().getContinentLogo(text),height:40,width: 40),
        const SizedBox(width: 8),
        Text(text,style: EstiloTextoBranco.text16,),
      ],
    );
  }

  Widget dificuldade(){
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Text('Dificuldade',style: EstiloTextoBranco.negrito18,),
          checkbox('Fácil',0),
          checkbox('Médio',1),
          checkbox('Difícil',2),
        ],
      ),
    );
  }

  Widget checkbox(String text, int difficulty){
    return         Row(
      children: [
        Checkbox(
          value: mapGameSettings.difficulty == difficulty,
          onChanged: (newValue) {
            setState(() {
              mapGameSettings.difficulty = difficulty;
            });
          },
        ),
        Text(text,style: EstiloTextoBranco.text16,),
      ],
    );
  }

}
