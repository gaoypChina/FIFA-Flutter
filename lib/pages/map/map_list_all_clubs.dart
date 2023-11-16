import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/countries/countries_continents.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/classes/countries/words.dart';
import 'package:fifa/classes/data_graphics.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/club_profile/all_infos_club_not_playable.dart';
import 'package:fifa/pages/historic/leagues_historic.dart';
import 'package:fifa/pages/historic/real_classification.dart';
import 'package:fifa/theme/decoration/black_decoration.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:fifa/widgets/league_selection_row.dart';
import 'package:fifa/widgets/stars.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapListAllClubs extends StatefulWidget {
  final String continent;
  const MapListAllClubs({Key? key, required this.continent}) : super(key: key);

  @override
  State<MapListAllClubs> createState() => _MapListAllClubsState();
}

class _MapListAllClubsState extends State<MapListAllClubs> {

  List<String> countryOptions = [];
  String selectedCountry = Words.country.brazil;
  ClubDetails clubDetails = ClubDetails();

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    getFlagsList();
    super.initState();
  }
  getFlagsList(){
    Continents continents = Continents();
    clubDetails.map.forEach((clubName, value) {
      String countryName = clubDetails.getCountry(clubName);
      if(!countryOptions.contains(countryName)){
        if(continents.funcCountryContinents(countryName) == widget.continent){
          countryOptions.add(countryName);
        }
      }
    });
    countryOptions.sort();
    selectedCountry = countryOptions.first;
    setState((){});

  }

  Future<DataGraphics> loadClubData(String clubName) async{
    DataGraphics dataGraphics = DataGraphics();
    await dataGraphics.getDataNotPlayabale(clubName, clubDetails);
    return dataGraphics;
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    //Filtra os clubes do país
    Iterable keysIterable = clubDetails.map.keys;
    Iterable showList = keysIterable.where((clubName) => selectedCountry == clubDetails.getCountry(clubName));
    showList = showList.where((clubName) => clubDetails.getCoordinate(clubName).latitude != 0);

    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Column(
            children: [

              //APPBAR
              Container(
                color: appBarMyClubColor(),
                child: appBarButtons(showList),
              ),

              Expanded(
                child: Scrollbar(
                  child: FutureBuilder<List<DataGraphics>>(
                    future: Future.wait(showList.map((clubName) => loadClubData(clubName))),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<DataGraphics> dataGraphicsList = snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: dataGraphicsList.length,
                          itemBuilder: (context, index) {
                            DataGraphics dataGraphics = dataGraphicsList[index];
                            // Create your custom widget to display the club data
                            return clubRow(showList.elementAt(index), clubDetails, dataGraphics);
                          },
                        );
                      }
                    },
                  ),
                ),
              ),


              selectCountryRow(),

            ],
          ),
        ],
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget appBarButtons(Iterable showList){
    return Row(
      children: [

        backButtonText(context, 'Lista de Clubes'),
        const Spacer(),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(
            onTap:(){
              navigatorPush(context, RealClassificationPage(chosenCountryName: selectedCountry));
            },
            child: const Icon(Icons.table_chart_outlined,color:Colors.white,size: 32),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:20.0),
          child: IconButton(onPressed: (){
            Map map = getLeagueNationalityMap();
            String chosenLeagueName = map.keys.firstWhere((k) => map[k] == selectedCountry, orElse: () => null);
            navigatorPush(context, HistoricLeague(chosenLeagueName: chosenLeagueName));
          }, icon: const Icon(Icons.history,color: Colors.white,size: 32,)),
        ),
        Padding(padding:const EdgeInsets.only(top:18),
            child: Text(showList.length.toString(),style: EstiloTextoBranco.text20)),
        const SizedBox(width: 8),
      ],
    );
  }
  Widget clubRow(String clubName, ClubDetails clubDetails,DataGraphics dataGraphics){


    return PressableButton(
      onTap: (){
          //showClubMap(clubName);
        navigatorPush(context, ClubProfileNotPlayable(clubName: clubName));
        },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.symmetric(vertical: 4),
        color: clubDetails.getColors(clubName).primaryColor.withOpacity(0.2),
        child: Stack(
              children: [

                //LOGO DE FUNDO OPACA
                SizedBox(
                  height: 108,width: 300,
                  child: Opacity(
                    opacity: 0.1,
                    child: AspectRatio(
                      aspectRatio: 350 / 451,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              alignment: FractionalOffset.center,
                              image: AssetImage(Images().getEscudo(clubName)),
                            )
                        ),
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Images().getEscudoWidget(clubName,70,70),
                                      const SizedBox(height: 4),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0.0),
                                        child: starsWidgetFromOverall(clubDetails.getOverall(clubName),18.0),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(child: Text(clubName,overflow: TextOverflow.ellipsis,style: EstiloTextoBranco.negrito20)),
                                          ],
                                        ),
                                        const SizedBox(height: 4),
                                        Text(clubDetails.getFoundationYear(clubName).toString(),style: EstiloTextoBranco.text16),
                                        Text(clubDetails.getStadium(clubName),maxLines: 2,overflow: TextOverflow.ellipsis,style: EstiloTextoBranco.text14),
                                        Text('(${clubDetails.getStadiumCapacityPointFormat(clubName).toString()}) ',style: EstiloTextoBranco.text16),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                //UNIFORME
                Padding(
                    padding: const EdgeInsets.only(left:275,top: 10),
                    child: Images().getUniformWidget(clubName, 90, 110)
                ),
                Padding(
                    padding: const EdgeInsets.only(left:340,top: 80),
                    child: funcFlagsList(clubDetails.getCountry(clubName), 15, 25),
                ),

                SizedBox(
                  height: 32,
                  width: 30,
                  child: dataGraphics.nTitulos > 0 ? Stack(
                    children: [
                      const Opacity(opacity:0.7, child: Icon(Icons.star,color: Colors.amber,size: 30)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(child: Text(dataGraphics.nTitulos.toString(),style: EstiloTextoBranco.negrito14)),
                        ],
                      ),
                    ],
                  ) : Container(),
                ),

              ],
            ),
      ),
    );
  }

  Widget selectCountryRow(){
    return Container(
      height: 55,
      decoration: blackDecoration(),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: countryOptions.length,
          itemBuilder: (c, i) {
            return countryFlagsSelectionBottomWidget(
              country: countryOptions[i],
              chosenCountryName: selectedCountry,
              onTap: () {
                selectedCountry = countryOptions[i];
                setState(() {});
              },
            );
          }
      ),
    );
  }

  showClubMap(String clubName){
   return         showModalBottomSheet(
       barrierColor: Colors.transparent,
       context: context, builder: (c)
   {
     List<Marker> _markers =          [Marker(
       markerId: MarkerId(clubName),
       position: LatLng(clubDetails.getCoordinate(clubName).latitude, clubDetails.getCoordinate(clubName).longitude),
       infoWindow: InfoWindow(title: clubName),
       //icon: clubsAllNameList.indexOf(clubName) < 40 ? _markersIcons[clubsAllNameList.indexOf(clubName)] : BitmapDescriptor.defaultMarker,
     )];
     return SizedBox(
       height: 300,
       child: Stack(
         children: [

           Expanded(
             child: GoogleMap(
               mapType: MapType.satellite,
               tiltGesturesEnabled: false,
               indoorViewEnabled: false,
               rotateGesturesEnabled: false,
               //zoomGesturesEnabled: false, //SEM ZOOM
               //zoomControlsEnabled: false, //SEM ZOOM
               initialCameraPosition: CameraPosition(
                 target: LatLng(clubDetails.getCoordinate(clubName).latitude, clubDetails.getCoordinate(clubName).longitude),
                 zoom: 15.0,
               ),
               //onMapCreated: getClubsLocation,
               markers: Set<Marker>.of(_markers),
             ),
           ),

           //MINI-MAP
           SizedBox(
             height: 100,width: 100,
             child: GoogleMap(
               mapType: MapType.satellite,
               tiltGesturesEnabled: false,
               indoorViewEnabled: false,
               rotateGesturesEnabled: false,
               zoomGesturesEnabled: false, //SEM ZOOM
               zoomControlsEnabled: false, //SEM ZOOM
               initialCameraPosition: CameraPosition(
                 target: LatLng(clubDetails.getCoordinate(clubName).latitude, clubDetails.getCoordinate(clubName).longitude),
                 zoom: 3.0,
               ),
               //onMapCreated: getClubsLocation,
               markers: Set<Marker>.of(_markers),
             ),
           ),

           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Text(clubName,style: EstiloTextoBranco.negrito18),
                 Images().getEscudoWidget(clubName,25,25),
               ],
             ),
           ),


         ],
       ),
     );
   });
  }
}
