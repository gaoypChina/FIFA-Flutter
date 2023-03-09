import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/countries/countries_continents.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/pages/map/map_list_all_clubs.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/back_button.dart';
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
              backButtonText(context,'Choose Continent'),

              menuButtonExpanded(Continents().europa,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapListAllClubs(continent: Continents().europa)));
              }),
              menuButtonExpanded(Continents().americaSul,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapListAllClubs(continent: Continents().americaSul)));
              }),
              menuButtonExpanded(Continents().asia,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapListAllClubs(continent: Continents().asia)));
              }),
              menuButtonExpanded(Continents().africa,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MapListAllClubs(continent: Continents().africa)));
              }),
              menuButtonExpanded(Continents().americaNorte,(){
                    Navigator.push(context,MaterialPageRoute(builder: (context) =>  MapListAllClubs(continent: Continents().americaNorte)));
              }),
              menuButtonExpanded(Continents().oceania,(){
                Navigator.push(context,MaterialPageRoute(builder: (context) =>  MapListAllClubs(continent: Continents().oceania)));
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
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Club(index: My().clubID).colors.primaryColor.withOpacity(0.4),
        border: Border.all(
          width: 2.0,
          color: Club(index: My().clubID).colors.secondColor,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: function,
                  child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.text22))),
            ),
          ),
        ],
      ),
    );
  }

}
