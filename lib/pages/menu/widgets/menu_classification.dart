import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';

Widget wMenuClassification(BuildContext context, My myClass){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('${Translation(context).text.expectation}: '+myClass.getLastYearExpectativa().toString()+'º',
          style: EstiloTextoBranco.text16
      ),
      classification3(myClass),
    ],
  );
}

Widget classification3(My myClass){

  List classificationList = Classification(leagueIndex: myClass.leagueID).classificationClubsIndexes;
  int myPosition = classificationList.indexOf(myClass.clubID);
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
Widget rowClassification(int position, Club club, My myClass){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      myClass.getLastYearExpectativa() == position-1
          ? const Text('............................................................................................',style: EstiloTextoBranco.negrito6)
          : Container(),
      Row(
        children: [
          SizedBox(width:25,child: Text(position.toString()+'º',style: EstiloTextoBranco.text14)),
          SizedBox(width:22,child: Center(child: Text(club.leaguePoints.toString(),style: EstiloTextoBranco.negrito14))),
          Images().getEscudoWidget(club.name,18,18),
          Container(
              width:100,
              color: club.name == myClass.clubName ? Colors.teal : Colors.transparent,
              child: Text(club.name,style: EstiloTextoBranco.text12,)),
        ],
      ),
    ],
  );
}