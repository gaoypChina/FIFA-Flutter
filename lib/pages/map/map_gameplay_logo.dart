import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:fifa/classes/image_class.dart';
import 'package:fifa/page_controller/map/map_game_settings.dart';
import 'package:fifa/pages/map/map_menu.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class MapGameplayLogo extends StatefulWidget {
  final MapGameSettings mapGameSettings;
  const MapGameplayLogo({Key? key,required this.mapGameSettings}) : super(key: key);

  @override
  State<MapGameplayLogo> createState() => _MapGameplayLogoState();
}

class _MapGameplayLogoState extends State<MapGameplayLogo> {
  double imageSize = 150;

  Iterable keysIterable = ClubDetails().map.keys;
  ClubDetails clubDetails = ClubDetails();
  String clubNameMarker = '';
  List<String> listClubOptions = ['','','',''];
  List wrongAnswers = [];
  late Timer timer;
  int milis = 0;
  int nCorrect = 0;
  int nLifes = 3;
////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    initMap();
    setLogoClub();
    setClubOptions();
    super.initState();
  }
  initMap(){

    if(widget.mapGameSettings.mode == MapGameModeNames().modeSemErrar){
      nLifes = 1;
    }
    if(widget.mapGameSettings.mode == MapGameModeNames().mode1minute){
      milis = 60;
      nLifes = -1;
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
              backButtonText(context, 'Map Gameplay Logo'),
              gameInfosBar(),

              SizedBox(
                height: imageSize,width: imageSize,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Opacity(
                      opacity: 0.3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Images().getEscudoWidget(clubNameMarker,imageSize-3,imageSize-3),
                      ),
                    ),
                    ClipRRect( // Clip it cleanly.
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Container(),
                      ),
                    ),
                  ],
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
          const Spacer(),
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
        Row(
          children: [
            optionBox(listClubOptions[4]),
            optionBox(listClubOptions[5]),
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
            setLogoClub();
            setClubOptions();
          }else {
            nLifes--;
            wrongAnswers.add(clubName);

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
            ],
          ),
        ),
      ),
    );
  }


  setLogoClub(){

    int clubID = Random().nextInt(keysIterable.length);
    clubNameMarker = keysIterable.elementAt(clubID);
    String continent = clubDetails.getContinent(clubNameMarker);
    if(clubDetails.getCoordinate(clubNameMarker).latitude != 0 &&
        widget.mapGameSettings.selectedContinents.contains(continent) &&
        widget.mapGameSettings.stadiumSizeMin < clubDetails.getStadiumCapacity(clubNameMarker)){
      //
  }else{
      setLogoClub();
    }

    }

  setClubOptions(){
    listClubOptions = [];
    int clubMarkerPosition = Random().nextInt(6);
    for(int i=0;i<6;i++){
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


  gameOver(){
    customToast('Game Over!!!\nACERTOS: $nCorrect\nTEMPO: $milis');
    widget.mapGameSettings.saveKeys(nCorrect);
    Navigator.push(context,MaterialPageRoute(builder: (context) => const MapMenu()));
  }
}



