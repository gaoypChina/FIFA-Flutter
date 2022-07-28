import 'package:fifa/classes/image_class.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/kits_crests/patterns.dart';
import 'package:fifa/widgets/kits_crests/uniforme.dart';
import 'package:flutter/material.dart';

class FullKitCustom {

  ClubDetails clubDetails = ClubDetails();
  ClubPattern clubPattern = ClubPattern();

  late String clubName;
  late LinearGradient pattern;
  late ClubColors clubColors;
  double scale = 1;

  double angle = 25;
  double _heightShorts = 40;
  double _widthShorts = 27;

  FullKitCustom(this.clubName, [this.scale = 1]) {
    pattern = clubPattern.getGradient(
        clubDetails.getPattern(clubName), clubDetails.getColors(clubName));
    clubColors = clubDetails.getColors(clubName);
  }

  Widget kit(){
    return Stack(
      children: [

        UniformCustom(clubName, scale).kit(),

        //SHORTS
        //SHORTS Esquerda
        Padding(
          padding: EdgeInsets.only(left: 22*scale, top:75*scale),
          child: Transform.rotate(
            angle: 3.1415 * angle/ 360,
            child: Container(
              height: _heightShorts*scale, width: _widthShorts*scale,
              decoration: BoxDecoration(
                color: clubColors.secondColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4*scale), bottomLeft: Radius.circular(4*scale)),
              ),
            ),
          ),
        ),

        //SHORTS Direito
        Padding(
          padding: EdgeInsets.only(left: 47*scale, top:75*scale),
          child: Transform.rotate(
            angle: -3.1415 * angle/ 360,
            child: Container(
              height: _heightShorts*scale, width: _widthShorts*scale,
              decoration: BoxDecoration(
                color: clubColors.secondColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4*scale), bottomLeft: Radius.circular(4*scale)),
              ),
            ),
          ),
        ),

      ],
    );


  }
}