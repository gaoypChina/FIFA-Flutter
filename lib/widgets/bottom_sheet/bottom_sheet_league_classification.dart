import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Future bottomSheetShowLeagueClassification(BuildContext context, List classificationNames){
  return showModalBottomSheet(
      barrierColor: Colors.transparent,
      context: context, builder: (c){
    return SingleChildScrollView(
        child: Column(
          children: [
            for(int i=0; i<classificationNames.length;i++)
              rowClub(context, classificationNames[i], i+1)
          ],
        ));
  });
}

Widget rowClub(BuildContext context, String clubName, int position){
  return                 GestureDetector(
    onTap: (){
      clickClub(context: context,clubName: clubName);
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          SizedBox(width:35,child: Text(position.toString()+'º ',textAlign: TextAlign.right,style:EstiloTextoPreto.text16)),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Images().getEscudoWidget(clubName,30,30),
          ),
          Text(clubName,style:EstiloTextoPreto.text16),
        ],
      ),
    ),
  );
}