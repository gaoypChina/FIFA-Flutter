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
import 'package:fifa/theme/decoration/my_team_gradient.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:flutter/material.dart';


Widget cupPhaseWidget(BuildContext context, String cupName){

  List<Club> clubs = CupClassification().getListClubsClassificados(cupName);

  List<String> listCupPhases = KnockoutStage().listPhases();

  My my = My();

  List listMatchsIda = [];
  List listMatchsVolta = [];
  for(int i=0; i<listCupPhases.length; i++){
    Map matchs = {};
    try {
      matchs = CupClassification().getPhaseResults(cupName, listCupPhases[i], ResultDict().keyIda);
    }catch(e){
      matchs = {};
    }
    listMatchsIda.add(matchs);

    try {
      matchs = CupClassification().getPhaseResults(cupName, listCupPhases[i], ResultDict().keyVolta);
    }catch(e){
      matchs = {};
    }
    listMatchsVolta.add(matchs);
  }


  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          for(int i=listCupPhases.length-1; i>=0; i--)
            listMatchsIda[i].length == 0 ? Container() : Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: AppColors().greyTransparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  cupPhaseColumn(
                      context,
                      listMatchsVolta[i],
                      listCupPhases[i] + " - " + ResultDict().keyVolta,
                      my),
                  cupPhaseColumn(
                      context,
                      listMatchsIda[i],
                      listCupPhases[i] + " - " + ResultDict().keyIda,
                      my),
                ],
              ),
            ),

          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: AppColors().greyTransparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                const SizedBox(height: 8),
                const Text("Já qualificados",style: EstiloTextoBranco.negrito16),
                const SizedBox(height: 8),
                for (int i=0; i<clubs.length; i++)
                  teamsNextStage(
                      context,
                      Confronto(clubName1: clubs[i].name, clubName2: clubs[i].name),
                      my),
              ],
            ),
          ),

        ],
      ),
    ),
  );
}

Widget cupPhaseColumn(BuildContext context, Map matchs, String title, My my){

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(title,style: EstiloTextoBranco.negrito16),
          const SizedBox(height: 4),
          for(int i=1; i<=matchs.length; i++)
            cupMatchRow(
                context,
                CupClassification().getConfrontoFromMapMatch(matchs[i]),
                my
            ),

        ],
      ),
    );

}

Widget cupMatchRow(BuildContext context, Confronto confronto, My my){

  String teamNameA = confronto.clubName1;
  String teamNameB = confronto.clubName2;
  double imageSize = 30;

  TextStyle styleName1 = EstiloTextoBranco.text14;
  TextStyle styleName2 = EstiloTextoBranco.text14;
  TextStyle styleGoal1 = EstiloTextoBranco.text20;
  TextStyle styleGoal2 = EstiloTextoBranco.text20;
  if(confronto.hasGoals){
    styleName1 = matchStyle1(confronto.goal1, confronto.goal2, 14);
    styleName2 = matchStyle2(confronto.goal1, confronto.goal2, 14);
    styleGoal1 = matchStyle1(confronto.goal1, confronto.goal2, 18);
    styleGoal2 = matchStyle2(confronto.goal1, confronto.goal2, 18);
  }

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        //TIME A
            Flexible(
              child: PressableButton(
              onTap: (){
                clickClubProfilePage(context, Club(index: confronto.clubID1));
                },
                child: Container(
                  decoration: teamNameA == my.clubName
                      ? BoxDecoration(gradient: gradientMyTeam(false))
                      : const BoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.all(4),
                            child: Text(teamNameA,textAlign:TextAlign.end,style: styleName1)),
                      ),
                      Images().getEscudoWidget(teamNameA,imageSize,imageSize),
                    ],
                  ),
                ),
              ),
            ),



        //PLACAR
        Column(
          children: [
            confronto.hasGoals
                ? Row(
                children: [
                  Text(' '+ confronto.goal1.toString(),style: styleGoal1),
                  const Text(' x ',style: EstiloTextoBranco.text22),
                  Text(confronto.goal2.toString()+' ',style: styleGoal2)
                ],
              )
                : const Text('  X  ',textAlign:TextAlign.start,style: EstiloTextoBranco.text22),

            confronto.hasPenaltis
                ? Text("Pen:" + confronto.penaltis2.toString()+"x"+confronto.penaltis1.toString(),style: EstiloTextoBranco.text10)
                : Container(),
          ],
        ),

        //TIME B
            Flexible(
                  child: PressableButton(
                    onTap: (){
                      clickClubProfilePage(context, Club(index: confronto.clubID2));
                    },
                    child: Container(
                      decoration: teamNameB == my.clubName
                          ? BoxDecoration(gradient: gradientMyTeam(true))
                          : const BoxDecoration(),
                      child: Row(
                        children: [
                          Images().getEscudoWidget(teamNameB,imageSize,imageSize),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              child: Text(teamNameB,style: styleName2),
                            ),
                          ),

                        ],
                      ),
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
        PressableButton(
          onTap: (){
            clickClubProfilePage(context, Club(index: confronto.clubID1));
          },
          child: Container(
            padding: const EdgeInsets.only(left: 8, bottom: 4),
            decoration: teamNameA == my.clubName
                ? BoxDecoration(gradient: gradientMyTeam(true))
                : const BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Images().getUniformWidget(teamNameA,imageSize,imageSize),
                Images().getEscudoWidget(teamNameA,imageSize,imageSize),
                Container(
                    padding: const EdgeInsets.all(4),
                    child: Text(teamNameA,textAlign:TextAlign.end,style: EstiloTextoBranco.text14)),
              ],
            ),
          ),
        );
}