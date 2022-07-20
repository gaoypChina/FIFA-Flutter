import 'package:fifa/values/club_details.dart';
import 'package:flutter/material.dart';

class ClubPattern{
  String solid = 'solid';
  String sp = 'SP';
  String divided = 'Divided';
  String stripes2 = 'Stripes2';
  String stripes3 = 'Stripes3';
  String horStripes = 'horStripes';
  String oneVertStripe = 'oneVertStripe';
  String diagonal = 'diagonal';
  String oneHorStripe = 'oneHorStripe';
  String sleeves = 'sleeves';

  LinearGradient getGradient(String clubPattern, ClubColors clubColors){

    late LinearGradient estampa;

    if(clubPattern == solid){
      estampa = LinearGradient(
        colors: [clubColors.primaryColor, clubColors.primaryColor],
        stops: const [0, 1],
      );
    }
    else if(clubPattern == divided){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,clubColors.secondColor,clubColors.secondColor],
        stops: const [0, 0.5, 0.5, 1],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      );
    }
    else if(clubPattern == stripes2){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
        ],
        stops: const [0, 0.2, 0.2,0.4, 0.4,0.6, 0.6,0.8,  0.8,1],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      );
    }
    else if(clubPattern == stripes3){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
        ],
        stops: const [0, 0.15, 0.15,0.3, 0.3,0.42, 0.42,0.58, 0.58,0.7, 0.7,0.85, 0.85,1],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      );
    }
    else if(clubPattern == horStripes){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
        ],
        stops: const [0, 0.2, 0.2,0.4, 0.4,0.6, 0.6,0.8,  0.8,1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    }
    else if(clubPattern == oneHorStripe){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
        ],
        stops: const [0, 0.3, 0.3,0.7, 0.7,1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    }
    else if(clubPattern == oneVertStripe){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
        ],
        stops: const [0, 0.3, 0.3,0.7, 0.7,1],
        begin: Alignment.bottomLeft,
        end: Alignment.bottomRight,
      );
    }
    else if(clubPattern == diagonal){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
        ],
        stops: const [0, 0.4, 0.4,0.6, 0.6,1],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );
    }
    else if(clubPattern == sp){
      estampa = LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
          clubColors.thirdColor,clubColors.thirdColor,
          clubColors.primaryColor,clubColors.primaryColor,
        ],
        stops: const [0, 0.35, 0.35,0.45, 0.45,0.55, 0.55,0.65,  0.65,1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    }
    else if(clubPattern == sleeves){
      estampa = LinearGradient(
        colors: [clubColors.primaryColor, clubColors.primaryColor],
        stops: const [0, 1],
      );
    }
    return estampa;
  }

}