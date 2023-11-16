import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/countries/words.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/historic/real_classification.dart';
import 'package:fifa/pages/home/choose_team.dart';
import 'package:fifa/pages/map/choose_continent_page.dart';
import 'package:fifa/pages/map/map_exploration.dart';
import 'package:fifa/pages/save/choose_save.dart';
import 'package:fifa/pages/tournament_mode/single_match.dart';
import 'package:fifa/pages/tournament_mode/tournament.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_names.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
    doThisOnLaunch();
  }
  Map getCloneMap(Map data) {
    return data.map((k, v) => MapEntry(k, v is Map ? getCloneMap(v) : v));
  }
  doThisOnLaunch() async {
    //RESETA LISTA ORIGINAL A MOSTRAR CLUBES
    clubNameMap = getCloneMap(clubNameMapImmutable); //Mapa sem mudar mapa original
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

              const SizedBox(height: 70),
              title(),
              const SizedBox(height: 8),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buttonRow(
                          "New Carrer",
                          'assets/icons/home_coach.png',
                          160,
                              (){
                            navigatorPush(context, const ChooseTeam());
                          }
                      ),

                      buttonRow(
                          "Load Game",
                          'assets/icons/home_mourinho.png',
                          90,
                              (){navigatorPush(context, const ChooseSave());}
                      ),

                      buttonRow(
                          "Friendly Match",
                          'assets/icons/home_match.png',
                          90,
                              (){navigatorPush(context, const SingleMatch());}
                      ),

                      buttonRow(
                          "New\nTournament",
                          'assets/icons/home_trophy.png',
                          90,
                              (){navigatorPush(context, const Tournament());}
                      ),
                      buttonRow(
                          "Classification",
                          'assets/icons/home_table.png',
                          90,
                              (){navigatorPush(context, RealClassificationPage(chosenCountryName: const CountryNames().england));}
                      ),

                      buttonRow(
                          "List of Clubs",
                          'assets/icons/home_clubs.png',
                          90,
                              (){navigatorPush(context, const ChooseContinentPage());}
                      ),

                      buttonRow(
                          "Maps",
                          'assets/icons/home_map.png',
                          90,
                              (){navigatorPush(context, MapExploration(clubName: ClubName().arsenal));}
                      ),
                    ],
                  ),
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
  Widget title(){
    return Stack(
      children: const [
        Text('FSIM 2024',style: EstiloRowdies.titleWhite),
        Padding(
          padding: EdgeInsets.only(left:2.0,top: 1),
          child: Text('FSIM 2024',style: EstiloRowdies.titleGreen),
        ),
      ],
    );
  }

Widget buttonRow(String title, String imageName, double height, Function() onTap){
    return Container(
      height: height,
      margin: const EdgeInsets.all(8),
      child: Stack(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SizedBox(
              width: Sized(context).width*0.8,
              child: Image.asset(imageName, fit: BoxFit.fill,),
              ),
          ),

          PressableButton(
            onTap: onTap,
            borderRadiusValue: 8,
            child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: Sized(context).width,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.5, 0.65],
                      colors: [Colors.transparent, Colors.black],
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                  child: Text(
                    title,
                    textAlign: TextAlign.end,
                    style: EstiloRajdhani.hometitle,
                  ),
                ),
            ),
          ),

        ],
      ),
    );
}

}
