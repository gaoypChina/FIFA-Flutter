import 'package:fifa/classes/countries/countries_continents.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/map/map_list_all_clubs.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:flutter/material.dart';

class ChooseContinentPage extends StatefulWidget {
  const ChooseContinentPage({Key? key}) : super(key: key);

  @override
  State<ChooseContinentPage> createState() => _ChooseContinentPageState();
}

class _ChooseContinentPageState extends State<ChooseContinentPage> {

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

              backButtonText(context,'Choose Continent', true),

              const SizedBox(height: 20),

              menuButtonExpanded(Continents().oceania,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  MapListAllClubs(continent: Continents().oceania)));
              }),
              menuButtonExpanded(Continents().africa,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapListAllClubs(continent: Continents().africa)));
              }),
              menuButtonExpanded(Continents().asia,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapListAllClubs(continent: Continents().asia)));
              }),
              menuButtonExpanded(Continents().americaNorte,(){
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>  MapListAllClubs(continent: Continents().americaNorte)));
              }),
              menuButtonExpanded(Continents().americaSul,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapListAllClubs(continent: Continents().americaSul)));
              }),
              menuButtonExpanded(Continents().europa,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapListAllClubs(continent: Continents().europa)));
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
  Widget menuButtonExpanded(String text, Function() function){
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors().greyTransparent,
        border: Border.all(
          width: 2.0,
          color: AppColors().green,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(2.0)),
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          Images().getContinentLogo(text),
          Expanded(
            child: PressableButton(
                onTap: function,
                child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.text22)
                )
            ),
          ),
        ],
      ),
    );
  }

}
