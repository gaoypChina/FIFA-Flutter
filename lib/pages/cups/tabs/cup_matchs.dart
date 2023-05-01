import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/cup_classification.dart';
import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget cupPhaseWidget(BuildContext context, String cupName){

  List<Club> clubs = CupClassification().getListClubsClassificados(cupName);
  List<Club> clubspre = CupClassification().getListClubsPrePhase(cupName);

  My my = My();
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Name().finale,style: EstiloTextoBranco.negrito16),
          Text(Name().semifinal,style: EstiloTextoBranco.negrito16),
          Text(Name().quartas,style: EstiloTextoBranco.negrito16),
          Text(Name().oitavas,style: EstiloTextoBranco.negrito16),
          for (int i=0; i<clubs.length/2; i++)
            cupMatchRow(context, Confronto(clubName1: clubs[i].name, clubName2: clubs[clubs.length-i-1].name),my),

          clubspre.isNotEmpty ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Name().groupsPhase,style: EstiloTextoBranco.negrito16),
                  for(int i=0; i<clubspre.length/2; i++)
                    cupMatchRow(context, Confronto(clubName1: clubspre[i].name, clubName2: clubspre[i+(clubspre.length/2).floor()].name),my)
                  ],
              )
          : Container(),

        ],
      ),
    ),
  );
}
Widget cupMatchRow(BuildContext context, Confronto confronto, My my){

  String teamNameA = confronto.clubName1;
  String teamNameB = confronto.clubName2;
  double imageSize = 30;

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      //TIME A
          Flexible(
            child: GestureDetector(
            onTap: (){
              clickClubProfilePage(context, Club(index: confronto.clubID1));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Images().getUniformWidget(teamNameA,imageSize,imageSize),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(4),
                        color: teamNameA == my.clubName ? Colors.green : Colors.transparent,
                        child: Text(teamNameA,textAlign:TextAlign.end,style: EstiloTextoBranco.text14)),
                  ),
                  Images().getEscudoWidget(teamNameA,imageSize,imageSize),
                ],
              ),
            ),
          ),


      confronto.hasGoals
          ? Text(' '+ confronto.goal1.toString()+'x'+confronto.goal2.toString()+' ',style: EstiloTextoBranco.text22)
          : const Text('X',textAlign:TextAlign.center,style: EstiloTextoBranco.text22),

      //TIME B
          Flexible(
                child: GestureDetector(
                  onTap: (){
                    clickClubProfilePage(context, Club(index: confronto.clubID2));
                  },
                  child: Row(
                    children: [
                      Images().getEscudoWidget(teamNameB,imageSize,imageSize),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          color: teamNameB == my.clubName ? Colors.green : Colors.transparent,
                          child: Text(teamNameB,style: EstiloTextoBranco.text14),
                        ),
                      ),
                      Images().getUniformWidget(teamNameB,imageSize,imageSize),
                    ],
                  ),
                ),
              ),


        ]
  );
}