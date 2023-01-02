import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/player_past_clubs.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class ChooseContinentPage extends StatefulWidget {
  final String clubName;
  const ChooseContinentPage({Key? key,required this.clubName}) : super(key: key);

  @override
  State<ChooseContinentPage> createState() => _ChooseContinentPageState();
}

class _ChooseContinentPageState extends State<ChooseContinentPage> {

  Map yearPlayers = {};
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

    yearPlayers = getLegendsPerYear(widget.clubName);

    return Scaffold(
      body: Stack(
        children: [

          Images().getWallpaper(),

          Column(
            children: [
              backButtonText(context,'Jogadores Históricos'),

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for(int index=0;index<yearPlayers.keys.length;index++)
                          SizedBox(
                            height:35,
                            child: Row(
                              children: [
                                Text(yearPlayers.keys.elementAt(index).toString(),style: EstiloTextoBranco.text16),
                                Text(yearPlayers.values.elementAt(index).toString(),style: EstiloTextoBranco.text16),
                              ],
                            ),
                          ),
                      ],
                    ),
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
  getLegendsCarrerFullMap(){
    Map playersMap  = PlayerPastClubs().map;
    //TRANSFORM CARRER MAP
    Map carrerFull = {};
    playersMap.forEach((playerName, carrer) {
      Map carrerMap = {};
      List carrerClubs = carrer.values.toList();
      List carrerYears = carrer.keys.toList();
      String clubName = carrerClubs.first;
      int lastyear = anoInicial;
      if(carrerClubs.last == 'retired'){
        lastyear = carrerYears.last-1;
      }
      for (int year = carrerYears.first; year<=lastyear;year++) {
        if(carrerYears.contains(year)){
          clubName = carrerClubs[carrerYears.indexOf(year)];
        }
        carrerMap[year] = clubName;
      }
      carrerFull[playerName] = carrerMap;
    });

    return carrerFull;
  }

  legendsPlayers(String club){

    Map carrerFull = getLegendsCarrerFullMap();

    //PEGAR JOGADORES DO CLUBE
    Map legendPlayers = {};
    carrerFull.forEach((playerName, carrer) {
      List carrerClubs = carrer.values.toList();
      List carrerYears = carrer.keys.toList();


      if(carrerClubs.contains(club)){
        //print(playerName);
        //print(carrerClubs);
        List playedYears = [];
        for (int index=0;index < carrerClubs.length;index++) {
          if(carrerClubs[index]==club){
            playedYears.add(carrerYears[index]);
          }
        }
        legendPlayers[playerName] = playedYears;
      }
    });
    return legendPlayers; //{Benzema: [2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023], Casemiro: [2013, 2015, 2016, 2017, 2018, 2019, 2020, 2021], Courtois: [2018, 2019, 2020, 2021, 2022, 2023],
  }

  getLegendsPerYear(String clubName){
    Map legendPlayers = legendsPlayers(clubName);

    Map yearPlayers = {};
    for(int year = 1940; year<=anoInicial;year++){
      yearPlayers[year] = [];
    }

    legendPlayers.forEach((playerName,yearList) {
      List anos = yearList.toList();
        for (var element in anos) {
          List actual = yearPlayers[element];
          actual.add(playerName);
          yearPlayers[element] = actual;
        }
    });

    //Retirar anos sem jogadores
    yearPlayers.removeWhere((key, value) => value.isEmpty);
    return yearPlayers; //{1996: [Roberto Carlos], 1997: [Roberto Carlos], 1998: [Roberto Carlos], 1999: [Roberto Carlos], 2000: [Casillas, Figo, Roberto Carlos],
  }

}
