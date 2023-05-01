import 'package:fifa/classes/cup_classification.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';


////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget cupBrackets(BuildContext context, String cupName){
    return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                matchBox(cupName, CupClassification().keyOitavas, 1),
                matchBox(cupName, CupClassification().keyOitavas, 2),
                matchBox(cupName, CupClassification().keyOitavas, 3),
                matchBox(cupName, CupClassification().keyOitavas, 4),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                matchBox(cupName, CupClassification().keyQuartas, 1),
                matchBox(cupName, CupClassification().keyQuartas, 2),
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
                        matchBox(cupName, CupClassification().keySemifinal, 1),
                        const SizedBox(height: 8),
                        matchBox(cupName, CupClassification().keySemifinal, 2),
                      ],
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top:70,left: 60),
                    child: selectYearButton(ano),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top:50),
                    child: Row(
                      children: [
                        const Spacer(),
                        matchBox(cupName, CupClassification().keyFinal, 1),
                        Stack(
                          children: [
                            Images().getTrophy(My().getMyInternationalLeague(),95,50),
                            Container(
                                height: 95,width: 50,
                                alignment: Alignment.bottomRight,
                                child: Images().getEscudoWidget('Milan',40,40)),
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
                matchBox(cupName, CupClassification().keyQuartas, 3),
                matchBox(cupName, CupClassification().keyQuartas, 4),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                matchBox(cupName, CupClassification().keyOitavas, 5),
                matchBox(cupName, CupClassification().keyOitavas, 6),
                matchBox(cupName, CupClassification().keyOitavas, 7),
                matchBox(cupName, CupClassification().keyOitavas, 8),
              ],
            ),
          ],
        );
  }

  Widget selectYearButton(int year){
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: AppColors().greyTransparent,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
            color: Colors.greenAccent,
            width: 1.0,
        ),
      ),
      child: Text(year.toString(),style: EstiloTextoBranco.negrito18),
    );
  }

Widget matchBox(String cupName, String phaseName, int matchNumber){
  Map resultsIda = {};
  Map resultsVolta = {};
  late Confronto confrontoIda;
  late Confronto confrontoVolta;
  try{
    resultsIda = CupClassification().getCupPhaseResults(cupName, phaseName, ResultDict().keyIda)[matchNumber];
    resultsVolta = CupClassification().getCupPhaseResults(cupName, phaseName, ResultDict().keyVolta)[matchNumber];
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

Widget showMatchBoxClubs(Confronto confrontoIda,Confronto confrontoVolta){
  double imageSize = 32;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Images().getEscudoWidget(confrontoIda.clubName1,imageSize,imageSize),
            Images().getEscudoWidget(confrontoIda.clubName2,imageSize,imageSize),
          ],
        ),
        confrontoIda.hasGoals
            ? Text('${confrontoIda.goal1.toString()}  x  ${confrontoIda.goal2.toString()}',style: EstiloTextoBranco.text14)
            :Container(),
        confrontoVolta.hasGoals
            ? Text('${confrontoVolta.goal1.toString()}  x  ${confrontoVolta.goal2.toString()}',style: EstiloTextoBranco.text14)
            : Container(),

        confrontoVolta.hasPenaltis
            ? Text('Pen: (${confrontoVolta.penaltis1.toString()} x ${confrontoVolta.penaltis2.toString()})',style: EstiloTextoBranco.text10)
            : Container(),
      ],
    );
}



