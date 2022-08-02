import 'dart:async';
import 'dart:math';

import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/page_controller/map/map_game_settings.dart';
import 'package:fifa/pages/map/map_menu.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapGameplayStadium4Club extends StatefulWidget {
  final MapGameSettings mapGameSettings;
  const MapGameplayStadium4Club({Key? key,required this.mapGameSettings}) : super(key: key);

  @override
  State<MapGameplayStadium4Club> createState() => _MapGameplayStadium4ClubState();
}

class _MapGameplayStadium4ClubState extends State<MapGameplayStadium4Club> {

  Iterable keysIterable = ClubDetails().map.keys;
  ClubDetails clubDetails = ClubDetails();
  List<Marker> _markers = <Marker>[];
  late GoogleMapController controller;
  List<Coordinates> coordinates = [];
  List wrongAnswers = [];
  List<String> listClubOptions = ['Palmeiras','Palmeiras','Palmeiras','Palmeiras'];
  String city = '';
  late Timer timer;
  int milis = 0;
  String clubNameMarker = '';
  int nCorrect = 0;
  int nLifes = 3;

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    initMap();
    super.initState();
  }
  initMap(){

    if(widget.mapGameSettings.mode == MapGameModeNames().modeSemErrar){
      nLifes = 1;
    }
    if(widget.mapGameSettings.mode == MapGameModeNames().mode1minute){
      milis = 60;
      nLifes = 0;
    }

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(widget.mapGameSettings.mode == MapGameModeNames().mode1minute){
        milis--;
        if(milis <= 0){
          gameOver();
        }
      }else{
        milis++;
      }
      setState((){});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  getClubsLocation(GoogleMapController googleMapController) async{
    controller = googleMapController;


    int clubID = Random().nextInt(keysIterable.length);
    clubNameMarker = keysIterable.elementAt(clubID);


    String continent = clubDetails.getContinent(clubNameMarker);
    if(clubDetails.getCoordinate(clubNameMarker).latitude != 0 &&
          widget.mapGameSettings.selectedContinents.contains(continent) &&
    widget.mapGameSettings.stadiumSizeMin < clubDetails.getStadiumCapacity(clubNameMarker)){
      coordinates.add(clubDetails.getCoordinate(clubNameMarker));
      //Zoom
      var newPosition = CameraPosition(
          target: LatLng(coordinates.last.latitude,coordinates.last.longitude),
          zoom: 16);
      CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(newPosition);
      controller.moveCamera(cameraUpdate);
      //ADD MARKER
      _markers = [];
      _markers.add(
        Marker(
          markerId: MarkerId(clubNameMarker),
          position: LatLng(coordinates.last.latitude,coordinates.last.longitude),
          onTap: () async{
          },
          //infoWindow: InfoWindow(title: clubName),
          //icon: clubsAllNameList.indexOf(clubName) < 40 ? _markerssIcons[clubsAllNameList.indexOf(clubName)] : BitmapDescriptor.defaultMarker,
        ),
      );

      city = clubDetails.getStadium(clubNameMarker);


    }else{
      getClubsLocation(googleMapController);
    }


    setClubOptions();

    setState((){});
  }
  setClubOptions(){
    listClubOptions = [];
    int clubMarkerPosition = Random().nextInt(4);
    for(int i=0;i<4;i++){
      if(i!=clubMarkerPosition){
        bool isValidOption = false;
        String clubName = '';
        int i=0;
        while(!isValidOption && i<100){
          i++;
          int clubID = Random().nextInt(keysIterable.length);
          clubName = keysIterable.elementAt(clubID);
          isValidOption = checkClubOptionValid(clubName);
        }
          listClubOptions.add(clubName);

      }else{
        listClubOptions.add(clubNameMarker);
      }
    }
  }
  bool checkClubOptionValid(String clubName){
    String continent = clubDetails.getContinent(clubName);
    if(widget.mapGameSettings.selectedContinents.contains(continent) &&
        widget.mapGameSettings.stadiumSizeMin < clubDetails.getStadiumCapacity(clubName)){
      return true;
    }else{
      return false;
    }
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
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(0, 0),
                    zoom: 6.0,
                  ),
                  onMapCreated: getClubsLocation,
                  markers: Set<Marker>.of(_markers),
                ),
              ),

              options(),

            ],
          ),
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
          SizedBox(width:Sized(context).width*0.55,child: Text(city,textAlign:TextAlign.center,overflow:TextOverflow.ellipsis,style: EstiloTextoBranco.text16)),

          Column(
            children: [
              Text('$nCorrect/${MapGameModeNames().mapStarsValue(widget.mapGameSettings.mode)}',style: EstiloTextoBranco.text16),
              hearts(),
            ],
          ),
        ],
      ),
    );
  }

  Widget hearts(){
    return Row(
      children: [
        nLifes >= 1 ? const Icon(Icons.heart_broken_rounded,color: Colors.red) : const Icon(Icons.heart_broken_outlined,color: Colors.white),
        nLifes >= 2 ? const Icon(Icons.heart_broken_rounded,color: Colors.red) : const Icon(Icons.heart_broken_outlined,color: Colors.white),
        nLifes == 3 ? const Icon(Icons.heart_broken_rounded,color: Colors.red) : const Icon(Icons.heart_broken_outlined,color: Colors.white),
      ],
    );
  }


  Widget options(){
    return Column(
      children: [
        Row(
          children: [
            optionBox(listClubOptions[0]),
            optionBox(listClubOptions[1]),
          ],
        ),
        Row(
          children: [
            optionBox(listClubOptions[2]),
            optionBox(listClubOptions[3]),
          ],
        ),
      ],
    );
  }

  Widget optionBox(String clubName){
    Color color = Colors.white38;
    if(wrongAnswers.contains(clubName)){
      color = Colors.red;
    }
    return Expanded(
      child: GestureDetector(
        onTap: () async{
          if(clubName == clubNameMarker){
            customToast('CORRETO!!!');
            nCorrect++;
            wrongAnswers = [];
            getClubsLocation(controller);
          }else {
            nLifes--;
            wrongAnswers.add(clubName);
            HapticFeedback.mediumImpact();

            if(widget.mapGameSettings.mode == MapGameModeNames().mode1minute){
              milis -= 5;
            }

          }
          if(nLifes==0){
            gameOver();
          }

            setState((){});
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Text(clubName,textAlign:TextAlign.center,maxLines:1,style: EstiloTextoBranco.text20)),
              const SizedBox(width: 8),
              Images().getEscudoWidget(clubName,30,30),
            ],
          ),
        ),
      ),
    );
  }




  gameOver(){
    customToast('Game Over!!!\nACERTOS: $nCorrect\nTEMPO: $milis');
    widget.mapGameSettings.saveKeys(nCorrect);
    Navigator.push(context,MaterialPageRoute(builder: (context) => const MapMenu()));
  }
}
