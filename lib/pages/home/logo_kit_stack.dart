import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/club_profile/all_infos_club_not_playable.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/stars.dart';
import 'package:flutter/material.dart';

Widget wHomeClubLogoAndKitStack(BuildContext context, Club club){
  double imageSize = 200;
  return  Column(
    children: [
      SizedBox(
        height: imageSize,
        width: imageSize,
        child: Stack(
          children: [
            //Image.asset(Images().getStadium(club.name),height: imageSize,width: imageSize,fit: BoxFit.fill,),
            //Escudo*0.9 para aparecer as bordas do escudo
            GestureDetector(
                onTap:(){
                  navigatorPush(context, ClubProfile(clubID: club.index));
              },child: Images().getEscudoWidget(club.name,imageSize*0.9,imageSize*0.9)
            ),
            //Uniforme
            Container(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                  height: imageSize/2,
                  width: imageSize/2,
                  child: Images().getUniformWidget(club.name,imageSize/2,imageSize/2)),
            ),
          ],
        ),
      ),
      Text(club.name,style:EstiloRajdhani.bold22),
      starsWidgetFromOverall(club.getOverall()),
    ],
  );
}