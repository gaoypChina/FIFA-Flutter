import 'package:fifa/classes/calendar_result.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

import '../../../classes/club.dart';

Widget wLast5Matchs(BuildContext context){
  List<CalendarResult> listResults = resultsFormula();
  return SizedBox(
    height: 150,
    width: 120,
    child: ListView.builder(
        itemCount: listResults.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (c,i)=>resultRowDesign(context, listResults[i])),
  );
}

List<CalendarResult> resultsFormula(){
  My myClass = My();
  List<CalendarResult> listResults = [];
  List<int> listSemanas = [];
  for(int i=-2; i<1; i++){
    int tentativa = 0;
    int weekTry = semana+i+tentativa;
    bool hasAdversary = false;
    while(!hasAdversary && weekTry < globalUltimaSemana && weekTry>0){

      if(!listSemanas.contains(weekTry)) {
        CalendarResult calendarResult = CalendarResult(semanaLocal: weekTry, club: Club(index: myClass.clubID));

        if (calendarResult.show.hasAdversary) {
          hasAdversary = true;
          listResults.add(calendarResult);
          listSemanas.add(calendarResult.show.weekLocal);
        } else {
          tentativa = tentativa + 1;
          weekTry = semana + i + tentativa;
        }
      }else{
        tentativa = tentativa + 1;
        weekTry = semana + i + tentativa;
      }

    }
  }


    return listResults;
}

Widget resultRowDesign(BuildContext context, CalendarResult calendarResult){
  Color color = AppColors().greyTransparent;
  if(calendarResult.show.isAlreadyPlayed){
    color = calendarResult.show.backgroundColor;
  }

  return GestureDetector(
    onTap:(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ClubProfile(clubID: calendarResult.show.clubID2)));
    },
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Images().getEscudoWidget(calendarResult.show.clubName2,20,20),
            calendarResult.show.isAlreadyPlayed
                ? Text(calendarResult.show.placar, style: EstiloTextoBranco.text16)
                : Container(),
          ],
        ),
      ),
    ),
  );
}

Widget resultBox(BuildContext context, int i, My myClass){
  Color color = Colors.transparent;

  int week = 0;
  if(semana-i > 0){
    week = semana-i;
  }
  CalendarResult calendarResult = CalendarResult(semanaLocal: week, club: Club(index: myClass.clubID));

  if(calendarResult.show.isAlreadyPlayed && calendarResult.show.hasAdversary){

    color = calendarResult.show.backgroundColor;

    return GestureDetector(
      onTap:(){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ClubProfile(clubID: calendarResult.show.clubID2)));
      },
      child: Container(
        height:20,
        width: 20,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Center(child: Images().getEscudoWidget(calendarResult.show.clubName2,15,15)),
      ),
    );
  }else{
    return Container();
  }
}
