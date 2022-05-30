import 'package:flutter/material.dart';

convertOverallToStars(double overall){
  double star = 0;
  if(overall < 60){star = 0;}
  else if(overall < 66){star = 0.5;}
  else if(overall < 68){star = 1;}
  else if(overall < 70){star = 1.5;}
  else if(overall < 72){star = 2;}
  else if(overall < 74){star = 2.5;}
  else if(overall < 76){star = 3;}
  else if(overall < 79){star = 3.5;}
  else if(overall < 81){star = 4;}
  else if(overall < 84){star = 4.5;}
  else if(overall >= 84){star = 5;}
  return star;
}

Widget starsWidgetFromOverall(double overall){
  return starsWidget(convertOverallToStars(overall));
}
Widget starsWidget(double star){

  return Row(
    children: [
      star == 0 ? Row(
        children: const [
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
        ],
      )  : Container(),
      star == 0.5 ? Row(
        children: const [
          Icon(Icons.star_half,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
        ],
      )  : Container(),
      star == 1 ? Row(
        children: const [
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
        ],
      )  : Container(),
      star == 1.5 ? Row(
        children: const [
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star_half,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
        ],
      )  : Container(),
      star == 2 ? Row(
        children: const [
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
        ],
      )  : Container(),
      star == 2.5 ? Row(
        children: const [
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star_half,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
        ],
      )  : Container(),
      star == 3 ? Row(
        children: const [
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
        ],
      )  : Container(),
      star == 3.5 ? Row(
        children: const [
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star_half,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
        ],
      )  : Container(),
      star == 4 ? Row(
        children: const [
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star_outline,color: Colors.white),
        ],
      )  : Container(),
      star == 4.5 ? Row(
        children: const [
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star_half,color: Colors.white),
        ],
      )  : Container(),
      star == 5 ? Row(
        children: const [
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
          Icon(Icons.star,color: Colors.white),
        ],
      )  : Container(),
    ],
  );
}