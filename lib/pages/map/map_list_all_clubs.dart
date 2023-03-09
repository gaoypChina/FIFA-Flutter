import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/countries/words.dart';
import 'package:fifa/classes/countries/countries_continents.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/pages/club_profile/all_infos_club_not_playable.dart';
import 'package:fifa/pages/historic/leagues_historic.dart';
import 'package:fifa/theme/decoration/black_decoration.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
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
  Iterable keysIterable = ClubDetails().map.keys;
////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    getFlagsList();
    super.initState();
  }
  getFlagsList(){
    clubDetails.map.forEach((clubName, value) {
      String countryName = clubDetails.getCountry(clubName);
      if(!countryOptions.contains(countryName)){
        if(Continents().funcCountryContinents(countryName) == widget.continent){
          countryOptions.add(countryName);
        }
      }
    });
    setState((){});
    countryOptions.sort();
    selectedCountry = countryOptions.first;
    setState((){});
  }

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    //Filtra os clubes do país

    Iterable showList = keysIterable.where((clubName) => selectedCountry == clubDetails.getCountry(clubName));
    showList = showList.where((clubName) => clubDetails.getCoordinate(clubName).latitude != 0);

    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Column(
            children: [
              Row(
                children: [
                  backButtonText(context, 'Lista de Clubes'),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: IconButton(onPressed: (){
                      Map map = getLeagueNationalityMap();
                      String choosenLeagueName = map.keys.firstWhere((k) => map[k] == selectedCountry, orElse: () => null);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => HistoricLeague(choosenLeagueName: choosenLeagueName)));
                    }, icon: const Icon(Icons.outbond_rounded,color: Colors.white,size: 32,)),
                  ),
                  Padding(padding:const EdgeInsets.only(top:18),
                      child: Text(showList.length.toString(),style: EstiloTextoBranco.text20)),
                  const SizedBox(width: 8),
                ],
              ),
              Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                      itemCount: showList.length,
                      itemBuilder: (c,i)=>clubRow(showList.elementAt(i))
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
  Widget clubRow(String clubName){
    return GestureDetector(
      onTap: (){
          //showClubMap(clubName);
        Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfileNotPlayable(clubName: clubName)));
        },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.symmetric(vertical: 2),
        color: clubDetails.getColors(clubName).primaryColor.withOpacity(0.2),
        child: Stack(
              children: [

                //LOGO DE FUNDO OPACA
                SizedBox(
                  height: 100,width: 150,
                  child: Opacity(
                    opacity: 0.2,
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


                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Images().getEscudoWidget(clubName,50,50),

                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: Text(clubName,overflow: TextOverflow.ellipsis,style: EstiloTextoBranco.negrito18)),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        funcFlagsList(clubDetails.getCountry(clubName), 15, 25),
                                        const SizedBox(width: 16),
                                        Text(clubDetails.getFoundationYear(clubName).toString(),style: EstiloTextoBranco.text16),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),

                          Row(
                            children: [
                              Text('(${clubDetails.getStadiumCapacityPointFormat(clubName).toString()}) ',style: EstiloTextoBranco.text16),
                              Expanded(child: Text(clubDetails.getStadium(clubName),maxLines: 2,overflow: TextOverflow.ellipsis,style: EstiloTextoBranco.text14)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //ESTADIO
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Images().getStadiumWidget(clubName,90,110),
                    ),
                  ],
                ),
                //UNIFORME
                Padding(
                    padding: const EdgeInsets.only(left:270,top: 10),
                    child: Images().getUniformWidget(clubName)
                ),


              ],
            ),
      ),
    );
  }

  Widget selectCountryRow(){
    return Container(
      height: 60,
      decoration: blackDecoration(),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: countryOptions.length,
          itemBuilder: (c,i)=>countrySelection(countryOptions[i])
      ),
    );
  }
  Widget countrySelection(String country){
    return GestureDetector(
      onTap: (){
        selectedCountry = country;
        setState((){});
      },
      child: Center(
          child: Container(
            height: 60,
            color: country == selectedCountry ? Colors.green[300] : Colors.transparent,
           padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 10),
            child: funcFlagsList(country, 40, 50),
      )),
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
