import 'dart:async';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/words.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final List<Coordinates> coordinates = [];
  List<Marker> _markers = <Marker>[];
  List<Marker> _markersShow = <Marker>[];
  late GoogleMapController controller;
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    initMap();
    super.initState();
  }
  initMap() async{
    //GARANTE QUE A PÁGINA VAI DAR SETSTATE E CARREGAR OS MARKERS
    await Future.delayed(const Duration(seconds: 3));
      setState((){});
    await Future.delayed(const Duration(seconds: 6));
    setState((){});
  }

  getClubsLocation(GoogleMapController googleMapController) {
    controller = googleMapController;
    _markers = [];
    ClubDetails().map.forEach((key, value) {
      String clubName = key;

      if(ClubDetails().getCoordinate(clubName).latitude != 0){
        coordinates.add(ClubDetails().getCoordinate(clubName));

        //ADD MARKER
        _markers.add(
          Marker(
            markerId: MarkerId(clubName),
            position: LatLng(coordinates.last.latitude,coordinates.last.longitude),
            onTap: () async{

              String city = '';
              List<Placemark> placemarks = await placemarkFromCoordinates(
                ClubDetails().getCoordinate(clubName).latitude,
                ClubDetails().getCoordinate(clubName).longitude,
              );
              //print(placemarks[0]);
              if(placemarks[0].locality!.isNotEmpty){
                city = placemarks[0].locality.toString();
              }else{
                city = placemarks[0].administrativeArea.toString()+', '+placemarks[0].subAdministrativeArea.toString();
              }

              onMarkerTap(clubName,city);
            },
            //infoWindow: InfoWindow(title: clubName),
            //icon: clubsAllNameList.indexOf(clubName) < 40 ? _markersIcons[clubsAllNameList.indexOf(clubName)] : BitmapDescriptor.defaultMarker,
          ),
        );
        _markersShow = List.from(_markers);
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
              Row(
                children: [
                  backButtonText(context, 'Mapa'),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(top:30.0),
                    child: GestureDetector(
                      onTap: (){
                        filterBottomMessage();
                        setState((){});
                      },
                      child: const Icon(Icons.filter_alt,size:35,color:Colors.white),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),

              Expanded(
                child: GoogleMap(
                mapType: MapType.satellite,
                tiltGesturesEnabled: false,
                indoorViewEnabled: false,
                rotateGesturesEnabled: false,
                compassEnabled: false,

                initialCameraPosition: CameraPosition(
                  target: LatLng(ClubDetails().getCoordinate(My().clubName).latitude, ClubDetails().getCoordinate(My().clubName).longitude),
                  zoom: 6.0,
                ),
                onMapCreated: getClubsLocation,
                markers: Set<Marker>.of(_markersShow),
              ),
              ),

            ],
          ),
          SizedBox(
            height: Sized(context).height,
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    buttonZoomOut(),
                    buttonZoomMedium(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget buttonZoomOut(){
    return GestureDetector(
      onTap: (){
        CameraUpdate zoom = CameraUpdate.zoomTo(5);
        controller.moveCamera(zoom);
      },
      child: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.all(8),
        color: AppColors().greyTransparent,
        child: const Center(child: Text('Zoom Out',textAlign:TextAlign.center,style: EstiloTextoBranco.text14,)),
      ),
    );
  }
  Widget buttonZoomMedium(){
    return GestureDetector(
      onTap: (){
        CameraUpdate zoom = CameraUpdate.zoomTo(8);
        controller.moveCamera(zoom);
      },
      child: Container(
        height: 50,
        width: 80,
        margin: const EdgeInsets.all(8),
        color: AppColors().greyTransparent,
        child: const Center(child: Text('Zoom Medium',textAlign:TextAlign.center,style: EstiloTextoBranco.text14,)),
      ),
    );
  }

  onMarkerTap(String clubName, String city) {

    return showModalBottomSheet(
        barrierColor: Colors.transparent,
        context: context, builder: (c){

      try{
        Club club = Club(index: clubsAllNameList.indexOf(clubName));
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(c);
        });
        return bottomSheetClub(club,city);
      }catch(e){
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pop(c);
        });
        return bottomSheetGenericClub(clubName,city);
      }


    });
  }

  Widget bottomSheetClub(Club club, String city) {

    return GestureDetector(
      onTap: () async{

        //Zoom
        var newPosition = CameraPosition(
            target: LatLng(ClubDetails().getCoordinate(club.name).latitude, ClubDetails().getCoordinate(club.name).longitude),
            zoom: 16);
        CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(newPosition);
        controller.moveCamera(cameraUpdate);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        color: ClubDetails().getColors(club.name).primaryColor.withOpacity(0.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(ClubDetails().getStadium(club.name)+': ',style: EstiloTextoPreto.text16),
                Text(ClubDetails().getStadiumCapacity(club.name).toString()),
                const Spacer(),
                funcFlagsList(ClubDetails().getCountry(club.name), 15, 25),
              ],
            ),
            Row(
              children: [
                Image.asset(Images().getEscudo(club.name),height:50, width: 50),
                Text(club.name,style: EstiloTextoPreto.text20,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(club.leagueName),
                Text(city),
                Text(ClubDetails().getFoundationYear(club.name).toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bottomSheetGenericClub(String clubName, String city){
    return GestureDetector(
      onTap: () {
        //Zoom
        var newPosition = CameraPosition(
            target: LatLng(ClubDetails().getCoordinate(clubName).latitude, ClubDetails().getCoordinate(clubName).longitude),
            zoom: 16);
        CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(newPosition);
        controller.moveCamera(cameraUpdate);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        color: ClubDetails().getColors(clubName).primaryColor.withOpacity(0.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(ClubDetails().getStadium(clubName)+': ',style: EstiloTextoPreto.text16),
                Text(ClubDetails().getStadiumCapacity(clubName).toString()),
                const Spacer(),
                funcFlagsList(ClubDetails().getCountry(clubName), 15, 25),
              ],
            ),
            Row(
              children: [
                Image.asset(Images().getEscudo(clubName),height:50, width: 50),
                Text(clubName,style: EstiloTextoPreto.text20,),
                const Spacer(),
                Text(ClubDetails().getFoundationYear(clubName).toString()),
              ],
            ),

            Text(city),

          ],
        ),
      ),
    );
  }

  Future filterBottomMessage(){
    return showModalBottomSheet(
        barrierColor: Colors.transparent,
        context: context, builder: (c){
      return Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Filtrar por: ',style: EstiloTextoPreto.text22),
            GestureDetector(
                onTap:(){
                  Navigator.pop(c);
                  filterFoundationYearBottomSheet();
            },child: Container(padding:const EdgeInsets.all(4),child: const Text('Fundação',style: EstiloTextoPreto.text16))),

            GestureDetector(
                onTap:(){
              String myNationality = Club(index: My().clubID).nationality;
              _markersShow = List.from(_markers);
              _markersShow.removeWhere((element) => ClubDetails().getCountry(element.markerId.value) != myNationality);
              setState((){});
              Navigator.pop(c);
            }, child: Container(padding:const EdgeInsets.all(4),child: const Text('No meu País',style: EstiloTextoPreto.text16))),

            GestureDetector(
                onTap:(){
                  Navigator.pop(c);
                  filterCountryBottomSheet();
                },
                child: Container(padding:const EdgeInsets.all(4),child: const Text('País',style: EstiloTextoPreto.text16))),

            GestureDetector(
                onTap:(){
              _markersShow = List.from(_markers);
              setState((){});
              Navigator.pop(c);
            },child: Container(padding:const EdgeInsets.all(4),child: const Text('Restaurar Todos',style: EstiloTextoPreto.text16))),
          ],
        ),
      );
    }
    );
  }

  Future filterCountryBottomSheet(){

    List<DropdownMenuItem<String>> finalResultCountries = globalCountryNames.map((String dropDownStringItem) {
      return DropdownMenuItem<String>(
        value: dropDownStringItem,
        child: Text(dropDownStringItem),
      );
    }).toList();


    return showModalBottomSheet(
        barrierColor: Colors.transparent,
        context: context, builder: (c){
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 120,
            child: DropdownButton<String>(
              isExpanded: true,
              value: ClubDetails().getCountry(My().clubName),
              items: finalResultCountries,
              onChanged: (Object? nationality) {
                _markersShow = List.from(_markers);
                _markersShow.removeWhere((element) => ClubDetails().getCountry(element.markerId.value) != nationality.toString());
                setState((){});
                Navigator.pop(c);
              },
            ),
          ),
        ],
      );
    });
  }


  Future filterFoundationYearBottomSheet(){
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();

    //SELECT AFTER 2000 CLUBS
    _markersShow = List.from(_markers);
    _markersShow.removeWhere((element) => ClubDetails().getFoundationYear(element.markerId.value) < 2000);

    return showModalBottomSheet(
        barrierColor: Colors.transparent,
        context: context, builder: (c){
      return SizedBox(
        height: Sized(context).height - MediaQuery.of(context).viewInsets.bottom,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Desde: '),
            widgetTextField(controller1,autofocus: true),
            const Text('Até: '),
            widgetTextField(controller2),
          ],
        ),
      );
    });
  }

  Widget widgetTextField(TextEditingController controller,{bool autofocus = false}) {
    return Container(
      height: 30,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: Colors.grey,
        ),
      ),
      margin: const EdgeInsets.only(left: 4),
      child: TextField(
        autofocus: autofocus,
        textAlign: TextAlign.center,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(border: InputBorder.none,),
      ),
    );
  }
}
