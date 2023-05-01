import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/cup_classification.dart';
import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';


Widget cupPhaseWidget(BuildContext context, String cupName){

  List<Club> clubs = CupClassification().getListClubsClassificados(cupName);

  My my = My();
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          cupPhaseColumn(context, cupName, CupClassification().keyFinal, my),
          cupPhaseColumn(context, cupName, CupClassification().keySemifinal, my),
          cupPhaseColumn(context, cupName, CupClassification().keyQuartas, my),
          cupPhaseColumn(context, cupName, CupClassification().keyOitavas, my),
          cupPhaseColumn(context, cupName, CupClassification().key32round, my),
          cupPhaseColumn(context, cupName, CupClassification().key64round, my),
          cupPhaseColumn(context, cupName, CupClassification().key128round, my),


          const SizedBox(height: 12),
          const Text("Já qualificados: ",style: EstiloTextoBranco.negrito16),
          for (int i=0; i<clubs.length; i++)
            teamsNextStage(context, Confronto(clubName1: clubs[i].name, clubName2: clubs[i].name),my),

        ],
      ),
    ),
  );
}

Widget cupPhaseColumn(BuildContext context,  String cupName, String phaseName, My my){

  try {
    Map matchs = CupClassification().getCupPhaseResults(phaseName, cupName);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(phaseName,style: EstiloTextoBranco.negrito16),
        for(int i=1; i<=matchs.length; i++)
          cupMatchRow(
              context,
              Confronto(
                clubName1: matchs[i][ResultDict().keyTeamName1],
                clubName2: matchs[i][ResultDict().keyTeamName2],
              ),
              my)
      ],
    );
  }catch(e){
    return Container();
  }


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
          : const Text('  X  ',textAlign:TextAlign.start,style: EstiloTextoBranco.text22),

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

Widget teamsNextStage(BuildContext context, Confronto confronto, My my){
  String teamNameA = confronto.clubName1;
  double imageSize = 30;

  return
        GestureDetector(
          onTap: (){
            clickClubProfilePage(context, Club(index: confronto.clubID1));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Images().getUniformWidget(teamNameA,imageSize,imageSize),
              Images().getEscudoWidget(teamNameA,imageSize,imageSize),
              Container(
                  padding: const EdgeInsets.all(4),
                  color: teamNameA == my.clubName ? Colors.green : Colors.transparent,
                  child: Text(teamNameA,textAlign:TextAlign.end,style: EstiloTextoBranco.text14)),
            ],
          ),
        );
}