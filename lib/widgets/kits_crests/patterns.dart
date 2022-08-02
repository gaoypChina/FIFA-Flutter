import 'package:fifa/values/club_details.dart';
import 'package:flutter/material.dart';

class ClubPattern{
  String solid = 'solid';
  String solid2 = 'solid2';
  String solid3 = 'solid3';
  String monaco = 'monaco';
  String sp = 'SP';
  String divided = 'Divided';
  String stripesThin = 'StripesThin';
  String dividedHor = 'DividedHor';
  String stripes2 = 'Stripes2';
  String stripes3 = 'Stripes3';
  String stripes4 = 'Stripes4';
  String stripesTricolor = 'stripesTricolor';
  String stripeCrest = 'StripeCrest';
  String horStripes2 = 'horStripes2';
  String horStripes3 = 'horStripes3';
  String horStripes4 = 'horStripes4';
  String horStripesThin = 'horStripesThin';
  String oneVertStripe = 'oneVertStripe';
  String diagonal = 'diagonal';
  String diagonalInv = 'diagonalInverted';
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
    else if(clubPattern == solid2){
      estampa =  LinearGradient(
        colors: [clubColors.secondColor,clubColors.secondColor,clubColors.primaryColor,clubColors.primaryColor],
        stops: const [0, 0.07, 0.07, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    }
    else if(clubPattern == solid3){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,clubColors.secondColor,clubColors.secondColor],
        stops: const [0, 0.1, 0.1, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    }
    else if(clubPattern == monaco){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,clubColors.secondColor,clubColors.secondColor],
        stops: const [0, 0.5, 0.5, 1],
        begin: const Alignment(1,0.55),
        end: const Alignment(0.1,1),
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
    else if(clubPattern == dividedHor){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,clubColors.secondColor,clubColors.secondColor],
        stops: const [0, 0.5, 0.5, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
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
    else if(clubPattern == stripesTricolor){
      estampa =
          estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,
          clubColors.thirdColor,clubColors.thirdColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.thirdColor,clubColors.thirdColor,

          clubColors.primaryColor,clubColors.primaryColor,
          clubColors.thirdColor,clubColors.thirdColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.thirdColor,clubColors.thirdColor,
          clubColors.primaryColor,clubColors.primaryColor,


          clubColors.thirdColor,clubColors.thirdColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.thirdColor,clubColors.thirdColor,
          clubColors.primaryColor,clubColors.primaryColor,

        ],
        stops: const [0,0.1, 0.1,0.13, 0.13,0.27, 0.27,0.3,
                      0.3,0.4, 0.4,0.43, 0.43,0.57,  0.57,0.6, 0.6,0.7,
                      0.7,0.73, 0.73,0.87, 0.87,0.9, 0.9,1
                    ],
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
    else if(clubPattern == stripes4){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,          clubColors.primaryColor,clubColors.primaryColor,          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,        clubColors.primaryColor,clubColors.primaryColor,   clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
        ],
        stops: const [0, 0.15,
          0.15,0.25, 0.25,0.35,  0.35,0.45,
          0.45,0.55,
          0.55,0.65, 0.65,0.75,  0.75,0.85,
          0.85,1],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      );
    }
    else if(clubPattern == stripeCrest){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.thirdColor,clubColors.thirdColor,
          clubColors.primaryColor,clubColors.primaryColor,
        ],
        stops: const [0, 0.6, 0.6,0.7, 0.7,0.8, 0.8,1],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      );
    }
    else if(clubPattern == stripesThin){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
        ],
        stops: const [0, 0.2, 0.2,0.26, 0.26,0.47, 0.47,0.53, 0.53,0.74, 0.74,0.8, 0.8,1],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      );
    }
    else if(clubPattern == horStripes2){
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
    else if(clubPattern == horStripes3){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,          clubColors.secondColor,clubColors.secondColor,          clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,          clubColors.secondColor,clubColors.secondColor,          clubColors.primaryColor,clubColors.primaryColor,
        ],
        stops: const [0, 0.14, 0.14,0.28, 0.28,0.43,
          0.43,0.57,
          0.57,0.72, 0.72,0.86,  0.86,1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    }
    else if(clubPattern == horStripes4){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,     clubColors.primaryColor,clubColors.primaryColor,   clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,       clubColors.primaryColor,clubColors.primaryColor,  clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
        ],
        stops: const [0, 0.2,
          0.2,0.3, 0.3,0.4, 0.4,0.5,
          0.5,0.6,
          0.6,0.7, 0.7,0.8,  0.8,0.9,
          0.9,1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    }
    else if(clubPattern == horStripesThin){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
        ],
        stops: const [0,0.15, 0.15,0.18, 0.18,0.35,   0.35,0.38, 0.38,0.55,  0.55,0.58, 0.58,0.75, 0.75,0.78, 0.78,0.95,],
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
        stops: const [0, 0.3, 0.3,0.5, 0.5,1],
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
        //begin: Alignment.topLeft,
        //end: Alignment.bottomRight,
        begin: const Alignment(-1,-0.4),
        end: const Alignment(1,0.3),
      );
    }
    else if(clubPattern == diagonalInv){
      estampa =  LinearGradient(
        colors: [clubColors.primaryColor,clubColors.primaryColor,
          clubColors.secondColor,clubColors.secondColor,
          clubColors.primaryColor,clubColors.primaryColor,
        ],
        stops: const [0, 0.4, 0.4,0.6, 0.6,1],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
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