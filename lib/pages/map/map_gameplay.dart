import 'dart:async';
import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/database/local_database/shared_preferences.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../functions/func_number_clubs_total.dart';

class MapGameplay extends StatefulWidget {
  const MapGameplay({Key? key}) : super(key: key);

  @override
  State<MapGameplay> createState() => _MapGameplayState();
}

class _MapGameplayState extends State<MapGameplay> {


  Iterable keysIterable = ClubDetails().map.keys;
  List<Marker> _marker = <Marker>[];
  List<Coordinates> coordinates = [];
  List wrongAnswers = [];
  List<String> listClubOptions = ['','','',''];
  late GoogleMapController controller;
  String city = '';
  late Timer timer;
  int milis = 0;
  String clubNameMarker = '';
  int nTotal = 15;
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

  getClubsLocation(GoogleMapController googleMapController) async{
    controller = googleMapController;


    int clubID = Random().nextInt(keysIterable.length);
    clubNameMarker = keysIterable.elementAt(clubID);


    if(ClubDetails().getCoordinate(clubNameMarker).latitude != 0){
      coordinates.add(ClubDetails().getCoordinate(clubNameMarker));
      //Zoom
      var newPosition = CameraPosition(
          target: LatLng(coordinates.last.latitude,coordinates.last.longitude),
          zoom: 16);
      CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(newPosition);
      controller.moveCamera(cameraUpdate);
      //ADD MARKER
      _marker = [];
      _marker.add(
        Marker(
          markerId: MarkerId(clubNameMarker),
          position: LatLng(coordinates.last.latitude,coordinates.last.longitude),
          onTap: () async{
          },
          //infoWindow: InfoWindow(title: clubName),
          //icon: clubsAllNameList.indexOf(clubName) < 40 ? _markersIcons[clubsAllNameList.indexOf(clubName)] : BitmapDescriptor.defaultMarker,
        ),
      );

      city = ClubDetails().getStadium(clubNameMarker);


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
        int clubID = Random().nextInt(keysIterable.length);
        String clubName = keysIterable.elementAt(clubID);
        listClubOptions.add(clubName);
      }else{
        listClubOptions.add(clubNameMarker);
      }
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
                    target: const LatLng(0, 0),
                    zoom: 6.0,
                  ),
                  onMapCreated: getClubsLocation,
                  markers: Set<Marker>.of(_marker),
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

    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => const MapGameplay()));
      },
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 80,
              child: Row(
                children: [
                  Text('${timeMin.toString()}:$timeSecStr\'',style: EstiloTextoBranco.text20),
                  const Icon(Icons.watch_later_outlined,color: Colors.white,),
                ],
              ),
            ),
            Container(width:Sized(context).width*0.55,child: Text(city,textAlign:TextAlign.center,overflow:TextOverflow.ellipsis,style: EstiloTextoBranco.text16)),

            Column(
              children: [
                Text('$nCorrect/$nTotal',style: EstiloTextoBranco.text16),
                hearts(),
              ],
            ),
          ],
        ),
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
          print(clubName);
          print(clubNameMarker);
          if(clubName == clubNameMarker){
            nCorrect++;
            wrongAnswers = [];
            getClubsLocation(controller);
          }else {
            nLifes--;
            wrongAnswers.add(clubName);
            HapticFeedback.mediumImpact();
          }
          if(nLifes==0){
            Navigator.pop(context);
            customToast('Game Over!!!');
          }

            if(nCorrect == nTotal){
              Navigator.pop(context);
              List<String> listRanking = await SharedPreferenceHelper().getMapRanking() ?? [];
              listRanking.add(milis.toString());
              SharedPreferenceHelper().saveMapRanking(listRanking);
              customToast('Vencedor!!! $milis segundos');
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
              Image.asset(Images().getEscudo(clubName),height:30,width: 30),
            ],
          ),
        ),
      ),
    );
  }
}
