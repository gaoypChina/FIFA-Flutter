import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/mata_mata/cup_classification.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/mata_mata/knockout_stage.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
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
                matchBoxCup(context, cupName, KnockoutStage().keyOitavas, 1),
                matchBoxCup(context, cupName, KnockoutStage().keyOitavas, 2),
                matchBoxCup(context, cupName, KnockoutStage().keyOitavas, 3),
                matchBoxCup(context, cupName, KnockoutStage().keyOitavas, 4),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                matchBoxCup(context, cupName, KnockoutStage().keyQuartas, 1),
                matchBoxCup(context, cupName, KnockoutStage().keyQuartas, 2),
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
                        matchBoxCup(context, cupName, KnockoutStage().keySemifinal, 1),
                        const SizedBox(height: 8),
                        matchBoxCup(context, cupName, KnockoutStage().keySemifinal, 2),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top:50),
                    child: Row(
                      children: [
                        const Spacer(),
                        matchBoxCup(context, cupName, KnockoutStage().keyFinal, 1),
                        Stack(
                          children: [
                            Images().getTrophy(cupName,70,70),
                            Container(
                                height: 70,width: 70,
                                alignment: Alignment.bottomRight,
                                child: CupClassification().hasChampion(cupName)
                                    ? Images().getEscudoWidget(globalCup[cupName]![KnockoutStage().keyChampion], 40, 40)
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
                matchBoxCup(context, cupName, KnockoutStage().keyQuartas, 3),
                matchBoxCup(context, cupName, KnockoutStage().keyQuartas, 4),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                matchBoxCup(context, cupName, KnockoutStage().keyOitavas, 5),
                matchBoxCup(context, cupName, KnockoutStage().keyOitavas, 6),
                matchBoxCup(context, cupName, KnockoutStage().keyOitavas, 7),
                matchBoxCup(context, cupName, KnockoutStage().keyOitavas, 8),
              ],
            ),
          ],
        );
  }


Widget matchBoxCup(BuildContext context, String cupName, String phaseKeyName, int matchNumber){
  bool hasData = false;
  late Confronto confrontoIda;
  late Confronto confrontoVolta;
  try{
    hasData = true;
    confrontoIda = CupClassification().getConfronto(cupName, phaseKeyName, ResultDict().keyIda, matchNumber);
    confrontoVolta = CupClassification().getConfronto(cupName, phaseKeyName, ResultDict().keyVolta, matchNumber);
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

Widget showMatchBoxClubs(BuildContext context, Confronto confrontoIda,Confronto confrontoVolta){
  double imageSize = 32;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PressableButton(
              onTap: (){
                navigatorPush(context, ClubProfile(clubID: confrontoIda.clubID1));
              },
                child: Images().getEscudoWidget(confrontoIda.clubName1,imageSize,imageSize)
            ),
            PressableButton(
                onTap: (){
                  navigatorPush(context, ClubProfile(clubID: confrontoIda.clubID2));
                },
                child: Images().getEscudoWidget(confrontoIda.clubName2,imageSize,imageSize)
            ),
          ],
        ),
        confrontoIda.hasGoals
            ? goals(confrontoIda.goal1, confrontoIda.goal2)
            : Container(),
        confrontoVolta.hasGoals
            ? goals(confrontoVolta.goal2, confrontoVolta.goal1)
            : Container(),

        confrontoVolta.hasPenaltis
            ? Text('Pen: (${confrontoVolta.penaltis1.toString()} x ${confrontoVolta.penaltis2.toString()})',style: EstiloTextoBranco.text10)
            : Container(),
      ],
    );
}


RichText goals(int goal1, int goal2){
    TextStyle style1 = EstiloTextoBranco.text14;
    TextStyle style2 = EstiloTextoBranco.text14;
    if(goal1 < goal2){
      style1 = EstiloTextoCinza.text14;
    }
    else if(goal1 > goal2){
      style2 = EstiloTextoCinza.text14;
    }
    return RichText(
        text: TextSpan(
        children: <TextSpan>[
          TextSpan( text: goal1.toString(), style: style1),
          TextSpan( text: '  x  ', style: style1),
          TextSpan( text: goal2.toString(), style: style2),
        ])
    );
}


