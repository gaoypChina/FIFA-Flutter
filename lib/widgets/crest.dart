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
    try {
      String patternStr = clubDetails.getPattern(clubName);
      ClubColors clubColors = clubDetails.getColors(clubName);
      LinearGradient pattern = clubPattern.getGradient(patternStr, clubColors);

      return crestCircular(clubName, pattern);
    }catch(e){
      LinearGradient pattern = clubPattern.getGradient(ClubPattern().solid, ClubColors(Colors.grey,Colors.white));
      return crestCircular(clubName,pattern);
    }
  }


  Widget crestRetangular(String clubName, LinearGradient pattern){
    return Container(
        height: _height,width: _width,
        decoration: BoxDecoration(
          gradient: pattern,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(_height),
            bottomRight: Radius.circular(_height),
          ),
        ),
      child: Center(
          child: Text(clubName[0],
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: _height*0.6,
              ))),
      );
  }

  Widget crestCircular(String clubName, LinearGradient pattern){
    return outborder(
      Container(
          height: _height, width: _width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: pattern,
          ),
          child: Center(
              child: Text(clubName[0],
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontSize: _height*0.6,
              ))),
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