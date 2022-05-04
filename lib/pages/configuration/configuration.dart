import 'package:fifa/classes/geral/dificuldade.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/page_controller/configuration/configuration_state.dart';
import 'package:fifa/popup/popup_initial_money.dart';
import 'package:fifa/popup/popup_select_club.dart';
import 'package:fifa/popup/poup_edit.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button_return.dart';
import 'package:flutter/material.dart';

class Configuration extends StatefulWidget {
  const Configuration({Key? key}) : super(key: key);

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {

  ConfigurationState config = ConfigurationState();
  double spaceBetweenWidgets = 20;
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Images().getWallpaperContainerDecoration(),
        child: Stack(
          children: [

            Container(
              height: Sized(context).height-50,
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 60),
                    coachName(),
                    SizedBox(height: spaceBetweenWidgets),
                    language(),
                    SizedBox(height: spaceBetweenWidgets),
                    soundEffects(config),
                    SizedBox(height: spaceBetweenWidgets),
                    dificulty(),
                    SizedBox(height: spaceBetweenWidgets),
                    initialMoney(),
                    SizedBox(height: spaceBetweenWidgets),
                    nTeamsPerLeague(),
                    SizedBox(height: spaceBetweenWidgets),
                    nTeamsClassified(),
                    SizedBox(height: spaceBetweenWidgets),
                    nTeamsRelegated(),
                    SizedBox(height: spaceBetweenWidgets),
                    changeClubs(),
                    SizedBox(height: spaceBetweenWidgets),
                    turns(config),
                    SizedBox(height: spaceBetweenWidgets),
                    allowCards(config),
                    SizedBox(height: spaceBetweenWidgets),
                    allowInjuries(config),
                    SizedBox(height: spaceBetweenWidgets),
                    equalOverallAllPlayers(),
                    SizedBox(height: spaceBetweenWidgets),
                    seeProbability(),
                    SizedBox(height: spaceBetweenWidgets),
                    userTerms(),
                    SizedBox(height: spaceBetweenWidgets),
                  ],
                ),
              ),
            ),

            returnButton(context),
          ],
        ),
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget coachName(){
    return           GestureDetector(
      onTap:(){
        popupEdit(
            context: context,
            title: Translation(context).text.coachName,
            variable: config.coachName,
            intOrString: true,
            maxNcharacters: 30,
            functionOK: (value){
              config.coachName = value;
              setState(() {});
            });
      },
      child: Row(
        children: [
          Expanded(child: Text(Translation(context).text.coachName,style: EstiloTextoBranco.negrito16)),
          Text(config.coachName,style: EstiloTextoBranco.text16),
          const SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget language(){
    return Row(
      children: [
        Expanded(child: Text(Translation(context).text.languageSelection,style: EstiloTextoBranco.negrito16)),
        Text(Translation(context).text.language,style: EstiloTextoBranco.text16),
      ],
    );
  }

  Widget dificulty(){
    return
      GestureDetector(
        onTap:(){
          globalDificuldade++;
          if(globalDificuldade==5){
            globalDificuldade=0;
          }
          setState(() {});
        },
        child: SizedBox(
          width: Sized(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.star,color:Colors.white,size:40),
              Text(Translation(context).text.difficulty,style: EstiloTextoBranco.underline14),
              Text(DificuldadeClass().getName(),style: EstiloTextoBranco.underline14),
            ],
          ),
        ),
      );
}

Widget soundEffects(ConfigurationState config){

    return Row(
      children: [
        Expanded(child: Text(Translation(context).text.soundEffects,style: EstiloTextoBranco.negrito16)),

        Switch(
        value: config.hasSoundEffect,
        onChanged: (value) {
          setState(() {
            customToast(Translation(context).text.inDevelopment);
            config.hasSoundEffect = value;
            globalHasSoundEffects = !globalHasSoundEffects;
          });
      }),
      ]
    );
}


  Widget turns(ConfigurationState config){
    return Row(
        children: [
          Expanded(
              child: Text(Translation(context).text.turnsN,style: EstiloTextoBranco.negrito16),
          ),

          Switch(
              value: config.turnIdaEVolta,
              onChanged: (value) {
                customToast(Translation(context).text.inDevelopment);
                setState(() {
                  config.changeTurnSwitchState();
                });
              }),
        ]
    );
  }

  Widget initialMoney(){
    return GestureDetector(
      onTap: (){
        popUpInitialMoney(
            context: context,
            function: (value){
              config.initialMoney = value.initialMoney;
            }
        );
        },
      child: Row(
        children: [
          Expanded(child: Text(Translation(context).text.initialMoney,style: EstiloTextoBranco.negrito16)),
          config.initialMoney>0
              ? Text(config.initialMoney.toString(),style: EstiloTextoBranco.underline14)
              : Text(Translation(context).text.standard,style: EstiloTextoBranco.underline14),
        ],
      ),
    );
  }

  Widget nTeamsPerLeague(){
    return GestureDetector(
      onTap:(){
        customToast(Translation(context).text.inDevelopment);
      },
      child: Row(
        children: [
          Expanded(child: Text(Translation(context).text.nTeamsLeague,style: EstiloTextoBranco.negrito16)),
        ],
      ),
    );
  }

  Widget nTeamsClassified(){
    return GestureDetector(
        onTap:(){
          customToast(Translation(context).text.inDevelopment);
        },
      child: Row(
        children: [
          Expanded(child: Text(Translation(context).text.nTeamsClassified,style: EstiloTextoBranco.negrito16)),
        ],
      ),
    );
  }

  Widget nTeamsRelegated(){
    return GestureDetector(
      onTap:(){
        customToast(Translation(context).text.inDevelopment);
      },
      child: Row(
        children: [
          Expanded(child: Text(Translation(context).text.nTeamsRelegated,style: EstiloTextoBranco.negrito16)),
        ],
      ),
    );
  }

  Widget changeClubs(){
    return GestureDetector(
      onTap:(){
        popUpSelectClub(originalContext: context);
      },
      child: Row(
        children: [
          Expanded(child: Text(Translation(context).text.changeClubs,style: EstiloTextoBranco.negrito16)),
        ],
      ),
    );
  }

  Widget allowCards(ConfigurationState config){
    return Row(
        children: [
          SizedBox(
            width: 200,
            child: Text(Translation(context).text.allowCards,style: EstiloTextoBranco.negrito16),
          ),

          const Spacer(),
          Switch(
              value: config.hasCards,
              onChanged: (value) {
                customToast(Translation(context).text.inDevelopment);
                setState(() {
                  config.changeCardsState();
                });
              }),
        ]
    );
  }
  Widget allowInjuries(ConfigurationState config){
    return Row(
        children: [
          SizedBox(
            width: 200,
            child: Text(Translation(context).text.allowInjuries,style: EstiloTextoBranco.negrito16),
          ),
          const Spacer(),
          Switch(
              value: config.hasInjuries,
              onChanged: (value) {
                customToast(Translation(context).text.inDevelopment);
                setState(() {
                  config.changeInjuryState();
                });
              }),
        ]
    );
  }

  Widget equalOverallAllPlayers(){
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: Text(Translation(context).text.allPlayersEqual,style: EstiloTextoBranco.negrito16),
        ),
        const Spacer(),
        Switch(
            value: config.allEqualPlayersOverall,
            onChanged: (value) {
              setState(() {
                config.changeAllEqualPlayersOverallState();
              });
            }),
      ],
    );
  }
  Widget seeProbability(){
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: Text(Translation(context).text.seeProbability,style: EstiloTextoBranco.negrito16),
        ),
        const Spacer(),
        Switch(
            value: config.seeProbability,
            onChanged: (value) {
              setState(() {
                config.changeSeeProbabilityState();
              });
            }),
      ],
    );
  }
  Widget userTerms(){
    return Column(
      children: [
        GestureDetector(
            onTap:(){
              config.openTerms();
            },
            child: Text(Translation(context).text.userTerms,style: EstiloTextoBranco.negrito16),
        ),
      ],
    );
  }
}
