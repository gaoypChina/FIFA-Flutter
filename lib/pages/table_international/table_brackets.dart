import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/mata_mata/knockout_international.dart';
import 'package:fifa/classes/mata_mata/knockout_stage.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/cups/tabs/cup_brackets.dart';
import 'package:fifa/theme/colors.dart';
import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget interBrackets(BuildContext context, String competitionName){

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          matchBox(context, competitionName, KnockoutStage().keyOitavas, 1),
          matchBox(context, competitionName, KnockoutStage().keyOitavas, 2),
          matchBox(context, competitionName, KnockoutStage().keyOitavas, 3),
          matchBox(context, competitionName, KnockoutStage().keyOitavas, 4),
        ],
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          matchBox(context, competitionName, KnockoutStage().keyQuartas, 1),
          matchBox(context, competitionName, KnockoutStage().keyQuartas, 2),
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
                  matchBox(context, competitionName, KnockoutStage().keySemifinal, 1),
                  const SizedBox(height: 8),
                  matchBox(context, competitionName, KnockoutStage().keySemifinal, 2),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(top:50),
              child: Row(
                children: [
                  const Spacer(),
                  matchBox(context, competitionName, KnockoutStage().keyFinal, 1),
                  Stack(
                    children: [
                      Images().getTrophy(competitionName,70,70),
                      Container(
                        height: 70,width: 70,
                        alignment: Alignment.bottomRight,
                        child: KnockoutInternational().hasChampion(competitionName)
                            ? Images().getEscudoWidget(globalInternationalMataMata[competitionName]![KnockoutStage().keyChampion], 40, 40)
                            : Container(),
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
          matchBox(context, competitionName, KnockoutStage().keyQuartas, 3),
          matchBox(context, competitionName, KnockoutStage().keyQuartas, 4),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          matchBox(context, competitionName, KnockoutStage().keyOitavas, 5),
          matchBox(context, competitionName, KnockoutStage().keyOitavas, 6),
          matchBox(context, competitionName, KnockoutStage().keyOitavas, 7),
          matchBox(context, competitionName, KnockoutStage().keyOitavas, 8),
        ],
      ),
    ],
  );
}

Widget matchBox(BuildContext context, String competitionName, String phaseKeyName, int matchNumber){

  bool hasData = false;
  late Confronto confrontoIda;
  late Confronto confrontoVolta;
  try{
    hasData = true;
    confrontoIda = KnockoutInternational().getConfronto(competitionName, phaseKeyName, ResultDict().keyIda, matchNumber);
    confrontoVolta = KnockoutInternational().getConfronto(competitionName, phaseKeyName, ResultDict().keyVolta, matchNumber);
  }catch(e){
    hasData = false;
  }

  return Container(
    height: 89,
    width: 74,
    padding: const EdgeInsets.all(4),
    color: AppColors().greyTransparent,
    child: hasData ? showMatchBoxClubs(context, confrontoIda, confrontoVolta) : Container(),
  );
}