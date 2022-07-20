import 'package:fifa/classes/image_class.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/patterns.dart';
import 'package:flutter/material.dart';
class UniformCustom{

  ClubDetails clubDetails = ClubDetails();
  ClubPattern clubPattern = ClubPattern();

  late String clubName;
  late LinearGradient pattern;
  late Color sleeveColor;
  late ClubColors clubColors;
  double scale = 1;

  UniformCustom(this.clubName,[this.scale = 1]){
    pattern = clubPattern.getGradient(clubDetails.getPattern(clubName), clubDetails.getColors(clubName));
    clubColors = clubDetails.getColors(clubName);
    if(clubDetails.getPattern(clubName) == clubPattern.sleeves){
      sleeveColor = clubColors.secondColor;
    }else{
      sleeveColor = clubColors.primaryColor;
    }
  }

Widget kit(){
  double angle = 70;
  double sleeveTopMargin = 7;
  double sleeveHeight = 20;
  double sleeveWidth = 30;
  double spacingCentralBox = 20;
  double spacingRightSleeve = 60;

  return Stack(
      children: [

        //Manga Esquerda
        Padding(
          padding: EdgeInsets.only(top:sleeveTopMargin*scale),
          child: Transform.rotate(
            angle: -3.1415 * angle/ 360,
            child: Container(
              height: sleeveHeight*scale, width: sleeveWidth*scale,
              decoration: BoxDecoration(
                color: sleeveColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(4*scale), bottomLeft: Radius.circular(4*scale)),
              ),
            ),
          ),
        ),

        //Manga direita
        Padding(
            padding: EdgeInsets.only(left: spacingRightSleeve*scale,top:sleeveTopMargin*scale),
            child: Transform.rotate(
              angle: 3.1415 * angle/ 360,
              child: Container(
                height: sleeveHeight*scale, width: sleeveWidth*scale,
                decoration: BoxDecoration(
                  color: sleeveColor,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(4*scale), bottomRight: Radius.circular(4*scale)),
                ),
              ),
            )
        ),

        //Centro
        Padding(
          padding: EdgeInsets.only(left: spacingCentralBox*scale),
          child: Container(
            height: 80*scale, width: 50*scale,
            decoration: BoxDecoration(
              color: clubColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(4*scale)),
              gradient: pattern,
            ),
          ),
        ),

        //LOGO

  Padding(
  padding: EdgeInsets.only(left: 50*scale,top: 12*scale),
    child: Image.asset(Images().getEscudo(clubName),height: 12*scale,width: 12*scale,),
  ),


      ],
    );
}

}