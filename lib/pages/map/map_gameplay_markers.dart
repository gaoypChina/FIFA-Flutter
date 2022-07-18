import 'dart:async';
import 'dart:math';

import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/page_controller/map/map_game_settings.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapGameplayMarkers extends StatefulWidget {
  final MapGameSettings mapGameSettings;
  const MapGameplayMarkers({Key? key,required this.mapGameSettings}) : super(key: key);

  @override
  State<MapGameplayMarkers> createState() => _MapGameplayMarkersState();
}

class _MapGameplayMarkersState extends State<MapGameplayMarkers> {

  Iterable keysIterable = ClubDetails().map.keys;
  ClubDetails clubDetails = ClubDetails();
  List<Marker> _markers = <Marker>[];
  late GoogleMapController controller;
  final List<Coordinates> coordinates = [];

  late Timer timer;
  int milis = 0;
  String clubNameMarker = '';
  int nCorrect = 0;
  int nLifes = 5;

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    initMap();
    defineNewClubTarget();
    super.initState();
  }
  initMap(){
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      milis++;
      setState((){});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  defineNewClubTarget(){
    int clubID = Random().nextInt(keysIterable.length);
    clubNameMarker = keysIterable.elementAt(clubID);


    String continent = clubDetails.getContinent(clubNameMarker);
    int capacity = clubDetails.getStadiumCapacity(clubNameMarker);
    if(!widget.mapGameSettings.selectedContinents.contains(continent) ||
        widget.mapGameSettings.stadiumSizeMin > capacity){
      defineNewClubTarget();
    }
    setState((){});
  }

  getClubsLocation(GoogleMapController googleMapController) async{
    controller = googleMapController;
    _markers = [];
    clubDetails.map.forEach((key, value) {
      String clubName = key;

      String continent = clubDetails.getContinent(clubName);
      if (clubDetails.getCoordinate(clubName).latitude != 0 &&
            widget.mapGameSettings.selectedContinents.contains(continent) &&
            widget.mapGameSettings.stadiumSizeMin < clubDetails.getStadiumCapacity(clubName)
      ) {
        coordinates.add(clubDetails.getCoordinate(clubName));

        //ADD MARKER
        _markers.add(
          Marker(
            markerId: MarkerId(clubName),
            position: LatLng(
                coordinates.last.latitude, coordinates.last.longitude),
            onTap: () async {
              if(clubName == clubNameMarker){
                customToast("Correto");
                nCorrect++;
                defineNewClubTarget();
              }else{
                nLifes--;
              }
              if(nLifes==0){
                customToast("Game Over");
                Navigator.pop(context);
              }
            },
            infoWindow: InfoWindow(title: clubName),
            //icon: clubsAllNameList.indexOf(clubName) < 40 ? _markersIcons[clubsAllNameList.indexOf(clubName)] : BitmapDescriptor.defaultMarker,
          ),
        );

      }
    });

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
              backButtonText(context, 'Gameplay'),

              gameInfosBar(),
              Expanded(
                child: GoogleMap(
                  mapType: MapType.satellite,
                  tiltGesturesEnabled: false,
                  indoorViewEnabled: false,
                  rotateGesturesEnabled: false,
                  //zoomGesturesEnabled: false, //SEM ZOOM
                  //zoomControlsEnabled: false, //SEM ZOOM
                  initialCameraPosition: CameraPosition(
                    target: LatLng(ClubDetails().getCoordinate(clubNameMarker).latitude, 10),
                    zoom: 3.0,
                  ),
                  onMapCreated: getClubsLocation,
                  markers: Set<Marker>.of(_markers),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget gameInfosBar(){
    int timeMin = (milis / 60).floor();
    int timeSec = milis % 60;
    String timeSecStr = timeSec.toString();
    if(timeSec<10){
      timeSecStr = '0' + timeSec.toString();
    }

    return Container(
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 80,
            child: Row(
              children: [
                Text('${timeMin.toString()}:$timeSecStr\'',style: EstiloTextoBranco.text20),
                const Icon(Icons.watch_later_outlined,color: Colors.white,),
              ],
            ),
          ),
          Image.asset(Images().getEscudo(clubNameMarker),height: 35,width: 35,),
          SizedBox(
              width:Sized(context).width*0.4,
              child: Text(clubNameMarker,textAlign:TextAlign.center,overflow:TextOverflow.ellipsis,style: EstiloTextoBranco.negrito18)
          ),

          Column(
            children: [
              Text('$nCorrect',style: EstiloTextoBranco.text16),
              hearts(),
            ],
          ),
        ],
      ),
    );
  }
  Widget hearts(){
    double size = 15;
    return Row(
      children: [
        nLifes >= 1 ? Icon(Icons.heart_broken_rounded,color: Colors.red,size: size,) : Icon(Icons.heart_broken_outlined,color: Colors.white,size: size),
        nLifes >= 2 ? Icon(Icons.heart_broken_rounded,color: Colors.red,size: size) : Icon(Icons.heart_broken_outlined,color: Colors.white,size: size),
        nLifes >= 3 ? Icon(Icons.heart_broken_rounded,color: Colors.red,size: size) : Icon(Icons.heart_broken_outlined,color: Colors.white,size: size),
        nLifes >= 4 ? Icon(Icons.heart_broken_rounded,color: Colors.red,size: size) : Icon(Icons.heart_broken_outlined,color: Colors.white,size: size),
        nLifes >= 5 ? Icon(Icons.heart_broken_rounded,color: Colors.red,size: size) : Icon(Icons.heart_broken_outlined,color: Colors.white,size: size),
      ],
    );
  }
}
