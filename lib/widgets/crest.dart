import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/patterns.dart';
import 'package:flutter/material.dart';

class CrestWidgets{

  ClubDetails clubDetails = ClubDetails();
  ClubPattern clubPattern = ClubPattern();

  late double _height;
  late double _width;

  CrestWidgets({required double size}){
    _height = size;
    _width = size;
  }
  
  Widget getCrest(String clubName){
    String patternStr = clubDetails.getPattern(clubName);
    ClubColors clubColors = clubDetails.getColors(clubName);
    LinearGradient pattern = clubPattern.getGradient(patternStr, clubColors);

    return crest(clubName, pattern);
  }


  Widget crest(String clubName, LinearGradient pattern){
    return outborder(
      Container(
          height: _height, width: _width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: pattern,
          ),
          child: Center(child: Text(clubName[0],style: EstiloTextoBranco.text20)),
        ),
    );
  }

  Widget outborder(Widget childWidget){
    return Container(
        height: _height*1.1, width: _width*1.1,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Align(
            alignment: Alignment.center,
            child: childWidget
        )
    );
  }


}