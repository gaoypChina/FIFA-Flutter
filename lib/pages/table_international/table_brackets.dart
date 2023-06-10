import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/mata_mata/knockout_international.dart';
import 'package:fifa/classes/mata_mata/knockout_stage.dart';
import 'package:fifa/classes/mata_mata/mata_mata_class.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/cups/tabs/cup_brackets.dart';
import 'package:fifa/theme/colors.dart';
import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget interBrackets(BuildContext context, String leagueInternational){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          matchBox(leagueInternational, KnockoutStage().keyOitavas, 1),
          matchBox(leagueInternational, KnockoutStage().keyOitavas, 2),
          matchBox(leagueInternational, KnockoutStage().keyOitavas, 3),
          matchBox(leagueInternational, KnockoutStage().keyOitavas, 4),
        ],
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          matchBox(leagueInternational, KnockoutStage().keyQuartas, 1),
          matchBox(leagueInternational, KnockoutStage().keyQuartas, 2),
        ],
      ),

      SizedBox(
        width: Sized(context).width,
        child: Stack(
          children: [
            SizedBox(
              width: Sized(context).width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  matchBox(leagueInternational, KnockoutStage().keySemifinal, 1),
                  const SizedBox(height: 8),
                  matchBox(leagueInternational, KnockoutStage().keySemifinal, 2),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top:50),
              child: Row(
                children: [
                  const Spacer(),
                  matchBox(leagueInternational, KnockoutStage().keyFinal, 1),
                  Stack(
                    children: [
                      Images().getTrophy(leagueInternational,70,70),
                      Container(
                        height: 70,width: 70,
                        alignment: Alignment.bottomRight,
                        //child: globalCup[leagueInternational]!.containsKey(CupClassification().keyChampion)
                            //? Images().getEscudoWidget(globalCup[leagueInternational]![CupClassification().keyChampion], 40, 40)
                            //: Container(),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ],
        ),
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          matchBox(leagueInternational, KnockoutStage().keyQuartas, 3),
          matchBox(leagueInternational, KnockoutStage().keyQuartas, 4),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          matchBox(leagueInternational, KnockoutStage().keyOitavas, 5),
          matchBox(leagueInternational, KnockoutStage().keyOitavas, 6),
          matchBox(leagueInternational, KnockoutStage().keyOitavas, 7),
          matchBox(leagueInternational, KnockoutStage().keyOitavas, 8),
        ],
      ),
    ],
  );
}

Widget matchBox(String leagueInternational, String phaseName, int matchNumber){

  MataMata data = MataMata();
  data.getData(leagueInternational, phaseName, matchNumber, 0);

  Map resultsIda = {};
  Map resultsVolta = {};
  late Confronto confrontoIda;
  late Confronto confrontoVolta;
  try{
    String idaOrVoltaKey = ResultDict().keyIda;
    resultsIda = KnockoutInternational().getPhaseMatchData(leagueInternational, phaseName, idaOrVoltaKey, matchNumber);
    confrontoIda = Confronto(clubName1: resultsIda[data.clubName1], clubName2: resultsIda[data.clubName2]);
    confrontoVolta = Confronto(clubName1: resultsVolta[data.clubName1], clubName2: resultsVolta[data.clubName2]);

    confrontoIda.setGoals(goal1: data.goal1, goal2: data.goal2);
    if(resultsVolta.containsKey(ResultDict().keyGol1)){
      confrontoVolta.setGoals(goal1: data.goal2, goal2: data.goal1);
    }
    if(resultsVolta.containsKey(ResultDict().keyPenalti1)){
      confrontoVolta.setPenalties(penaltis1: data.goal1, penaltis2: data.goal2);
    }
  }catch(e){
    //Não tem o confronto da fase
  }
  return Container(
    height: 85,
    width: 72,
    padding: const EdgeInsets.all(4),
    color: AppColors().greyTransparent,
    child: resultsIda.isNotEmpty ? showMatchBoxClubs(confrontoIda, confrontoVolta) : Container(),
  );
}