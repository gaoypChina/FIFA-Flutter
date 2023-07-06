import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/emoji.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/number_circle.dart';
import 'package:flutter/material.dart';

Widget wMenuClassification(BuildContext context, My myClass){

  return Container(
    color: AppColors().greyTransparent,
    padding: const EdgeInsets.all(4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('${Translation(context).text.expectation}: ' + myClass.getLastYearExpectativa().toString()+'º',
                style: EstiloTextoBranco.text16
            ),
            Text("   " + getMyEmoji(myClass),style: EstiloTextoBranco.negrito18),
          ],
        ),
        classification3(myClass.clubID, myClass.leagueID),
      ],
    ),
  );
}

Widget classification3(int clubID, int leagueID){

  List classificationList = Classification(leagueIndex: leagueID).classificationClubsIndexes;
  int myPosition = classificationList.indexOf(clubID);
  My myClass = My();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for(int i=-2;i<3;i++)
        myPosition+i+1 > 0 && myPosition+i < classificationList.length
            ? rowClassification(myPosition+i+1,Club(index: classificationList[myPosition+i]), myClass)
            : Container(),
    ],
  );
}
Widget rowClassification(int position, Club club,  myClass){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      myClass.getLastYearExpectativa() == position-1
          ? const Text('............................................................................................',style: EstiloTextoBranco.negrito6)
          : Container(),
      Container(
        color: club.name == myClass.clubName ? AppColors().myTeam : Colors.transparent,
        child: Row(
          children: [
            numberCircle(position, 24),
            SizedBox(width:22,child: Center(child: Text(club.leaguePoints.toString(),style: EstiloTextoBranco.negrito14))),
            Images().getEscudoWidget(club.name,20,20),
            SizedBox(
                width:100,
                child: Text(club.name,style: EstiloTextoBranco.text12,)),
          ],
        ),
      ),
    ],
  );
}