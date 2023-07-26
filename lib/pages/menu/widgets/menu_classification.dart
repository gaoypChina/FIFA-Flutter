import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/emoji.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/decoration/my_team_gradient.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/number_circle.dart';
import 'package:flutter/material.dart';

Widget wMenuClassification(BuildContext context, My myClass){

  return Container(
    color: AppColors().greyTransparent,
    width: Sized(context).width*0.6,
    padding: const EdgeInsets.all(4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text('${Translation(context).text.expectation}: ',style: EstiloRajdhani.listtext),
                Text(myClass.getLastYearExpectativa().toString()+'º',style: EstiloRajdhani.listtitle),
            ],
            ),
            Text(getMyEmoji(myClass),style: EstiloRajdhani.listtitle),
          ],
        ),
        const SizedBox(height: 8),
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
        decoration: club.name == myClass.clubName ? BoxDecoration(gradient: gradientMyTeam(true)) : const BoxDecoration(),
        child: Row(
          children: [
            numberCircle(position, 24),
            SizedBox(width:22,child: Center(child: Text(club.leaguePoints.toString(),style: EstiloRajdhani.listtitle))),
            Images().getEscudoWidget(club.name,20,20),
            const SizedBox(width: 4),
            SizedBox(
                width:100,
                child: Text(club.name,style: EstiloRajdhani.medium)),
          ],
        ),
      ),
    ],
  );
}