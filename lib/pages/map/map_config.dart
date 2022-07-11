import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/database/local_database/shared_preferences.dart';
import 'package:fifa/pages/map/map_gameplay.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

import '../../classes/words.dart';

class MapConfig extends StatefulWidget {
  const MapConfig({Key? key}) : super(key: key);

  @override
  State<MapConfig> createState() => _MapConfigState();
}

class _MapConfigState extends State<MapConfig> {

  List selectedContinents = ['Europa','América do Sul','América do Norte','Ásia','África'];
  String difficulty = 'Fácil';
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
              continents(),
              dificuldade(),

              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const MapGameplay()));
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
          Text('Continentes',style: EstiloTextoBranco.negrito18,),
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
          value: selectedContinents.contains(text),
          onChanged: (newValue) {
            if(selectedContinents.contains(text)){
              selectedContinents.remove(text);
            }else{
              selectedContinents.add(text);
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
          Text('Dificuldade',style: EstiloTextoBranco.negrito18,),
          checkbox('Fácil'),
          checkbox('Médio'),
          checkbox('Difícil'),
        ],
      ),
    );
  }

  Widget checkbox(String text){
    return         Row(
      children: [
        Checkbox(
          value: difficulty == text,
          onChanged: (newValue) {
            setState(() {
              difficulty = text;
            });
          },
        ),
        Text(text,style: EstiloTextoBranco.text16,),
      ],
    );
  }

}
