import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/mata_mata/cup_classification.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/mata_mata/knockout_stage.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/background_color/match_x_testyle.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';


Widget cupPhaseWidget(BuildContext context, String cupName){

  List<Club> clubs = CupClassification().getListClubsClassificados(cupName);

  List<String> listCupPhases = KnockoutStage().listPhases();

  My my = My();

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          for(int i=listCupPhases.length-1; i>=0; i--)
            Container(
              decoration: BoxDecoration(
                color: AppColors().greyTransparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  cupPhaseColumn(context, cupName, listCupPhases[i], ResultDict().keyVolta, my),
                  cupPhaseColumn(context, cupName, listCupPhases[i], ResultDict().keyIda, my),
                ],
              ),
            ),

          const SizedBox(height: 12),
          const Text("Já qualificados: ",style: EstiloTextoBranco.negrito16),
          for (int i=0; i<clubs.length; i++)
            teamsNextStage(context, Confronto(clubName1: clubs[i].name, clubName2: clubs[i].name),my),

        ],
      ),
    ),
  );
}

Widget cupPhaseColumn(BuildContext context,  String competitionName, String phaseKeyName, String idaOrVoltaKey, My my){

  Map matchs = {};
  try {
    matchs = CupClassification().getPhaseResults(competitionName, phaseKeyName, idaOrVoltaKey);
  }catch(e){
    return Container();
  }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        idaOrVoltaKey==ResultDict().keyVolta
            ? const SizedBox(height: 4)
            : const SizedBox(height: 12),

        Text(phaseKeyName + " - " + idaOrVoltaKey,style: EstiloTextoBranco.negrito16),
        const SizedBox(height: 4),
        for(int i=1; i<=matchs.length; i++)
          cupMatchRow(
              context,
              CupClassification().getConfrontoFromMapMatch(matchs[i]),
              my)
      ],
    );

}

Widget cupMatchRow(BuildContext context, Confronto confronto, My my){

  String teamNameA = confronto.clubName1;
  String teamNameB = confronto.clubName2;
  double imageSize = 30;

  TextStyle style1 = EstiloTextoBranco.text14;
  TextStyle style2 = EstiloTextoBranco.text14;
  TextStyle style10 = EstiloTextoBranco.text22;
  TextStyle style20 = EstiloTextoBranco.text22;
  if(confronto.hasGoals){
    style1 = matchStyle1(confronto.goal1, confronto.goal2, 14);
    style2 = matchStyle2(confronto.goal1, confronto.goal2, 14);
    style10 = matchStyle1(confronto.goal1, confronto.goal2, 22);
    style20 = matchStyle2(confronto.goal1, confronto.goal2, 22);
  }

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
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
                          child: Text(teamNameA,textAlign:TextAlign.end,style: style1)),
                    ),
                    Images().getEscudoWidget(teamNameA,imageSize,imageSize),
                  ],
                ),
              ),
            ),



        //PLACAR
        Column(
          children: [
            confronto.hasGoals
                ? Row(
                children: [
                  Text(' '+ confronto.goal1.toString(),style: style10),
                  const Text(' x ',style: EstiloTextoBranco.text22),
                  Text(confronto.goal2.toString()+' ',style: style20)
                ],
              )
                : const Text('  X  ',textAlign:TextAlign.start,style: EstiloTextoBranco.text22),

            confronto.hasPenaltis ? Text("Pen:" + confronto.penaltis1.toString()+"x"+confronto.penaltis2.toString(),style: EstiloTextoBranco.text10) : Container(),
          ],
        ),

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
                            child: Text(teamNameB,style: style2),
                          ),
                        ),
                        Images().getUniformWidget(teamNameB,imageSize,imageSize),
                      ],
                    ),
                  ),
                ),


          ]
    ),
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