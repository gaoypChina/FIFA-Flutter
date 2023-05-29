import 'package:fifa/classes/cup_classification.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
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
          matchBox(leagueInternational, CupClassification().keyOitavas, 1),
          matchBox(leagueInternational, CupClassification().keyOitavas, 2),
          matchBox(leagueInternational, CupClassification().keyOitavas, 3),
          matchBox(leagueInternational, CupClassification().keyOitavas, 4),
        ],
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          matchBox(leagueInternational, CupClassification().keyQuartas, 1),
          matchBox(leagueInternational, CupClassification().keyQuartas, 2),
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
                  matchBox(leagueInternational, CupClassification().keySemifinal, 1),
                  const SizedBox(height: 8),
                  matchBox(leagueInternational, CupClassification().keySemifinal, 2),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top:50),
              child: Row(
                children: [
                  const Spacer(),
                  matchBox(leagueInternational, CupClassification().keyFinal, 1),
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
          matchBox(leagueInternational, CupClassification().keyQuartas, 3),
          matchBox(leagueInternational, CupClassification().keyQuartas, 4),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          matchBox(leagueInternational, CupClassification().keyOitavas, 5),
          matchBox(leagueInternational, CupClassification().keyOitavas, 6),
          matchBox(leagueInternational, CupClassification().keyOitavas, 7),
          matchBox(leagueInternational, CupClassification().keyOitavas, 8),
        ],
      ),
    ],
  );
}

Widget matchBox(String leagueInternational, String phaseName, int matchNumber){
  Map resultsIda = {};
  Map resultsVolta = {};
  late Confronto confrontoIda;
  late Confronto confrontoVolta;
  try{
    resultsIda = CupClassification().getCupPhaseResults(leagueInternational, phaseName, ResultDict().keyIda)[matchNumber];
    resultsVolta = CupClassification().getCupPhaseResults(leagueInternational, phaseName, ResultDict().keyVolta)[matchNumber];
    confrontoIda = Confronto(clubName1: resultsIda[ResultDict().keyTeamName1], clubName2: resultsIda[ResultDict().keyTeamName2]);
    confrontoVolta = Confronto(clubName1: resultsVolta[ResultDict().keyTeamName1], clubName2: resultsVolta[ResultDict().keyTeamName2]);

    if(resultsIda.containsKey(ResultDict().keyGol1)){
      confrontoIda.setGoals(goal1: resultsIda[ResultDict().keyGol1], goal2: resultsIda[ResultDict().keyGol2]);
    }
    if(resultsVolta.containsKey(ResultDict().keyGol1)){
      confrontoVolta.setGoals(goal1: resultsVolta[ResultDict().keyGol2], goal2: resultsVolta[ResultDict().keyGol1]);
    }
    if(resultsVolta.containsKey(ResultDict().keyPenalti1)){
      confrontoVolta.setPenalties(penaltis1: resultsVolta[ResultDict().keyPenalti2], penaltis2: resultsVolta[ResultDict().keyPenalti1]);
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