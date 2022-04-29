import 'package:fifa/classes/geral/dificuldade.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/page_controller/configuration/configuration_state.dart';
import 'package:fifa/popup/popup_select_club.dart';
import 'package:fifa/popup/poup_edit.dart';
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
      body: Stack(
        children: [
          Images().getWallpaper(),

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
                  turns(config),
                  SizedBox(height: spaceBetweenWidgets),
                  dificulty(),
                  SizedBox(height: spaceBetweenWidgets),
                  soundEffects(config),
                  SizedBox(height: spaceBetweenWidgets),
                  nTeamsPerLeague(),
                  SizedBox(height: spaceBetweenWidgets),
                  nTeamsClassified(),
                  SizedBox(height: spaceBetweenWidgets),
                  nTeamsRelegated(),
                  SizedBox(height: spaceBetweenWidgets),
                  changeClubs(),
                  SizedBox(height: spaceBetweenWidgets),
                  initialMoney(),
                  SizedBox(height: spaceBetweenWidgets),
                  allowCards(config),
                  SizedBox(height: spaceBetweenWidgets),
                  allowInjuries(config),
                  SizedBox(height: spaceBetweenWidgets),
                  userTerms(),
                  SizedBox(height: spaceBetweenWidgets),
                  GestureDetector(
                    onTap: (){
                    },
                    child: Text(Translation(context).text.test(config.coachName),style: EstiloTextoBranco.text16),
                  )

                ],
              ),
            ),
          ),

          returnButton(context),
        ],
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
          const Expanded(child: Text('Nome do Treinador',style: EstiloTextoBranco.negrito16)),
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
                setState(() {
                  config.changeTurnSwitchState();
                });
              }),
        ]
    );
  }

  Widget initialMoney(){
    return Row(
      children: [
        Expanded(child: Text(Translation(context).text.initialMoney,style: EstiloTextoBranco.negrito16)),
        const Text('Padrão',style: EstiloTextoBranco.underline14),

      ],
    );
  }

  Widget nTeamsPerLeague(){
    return Column(
      children: [
        GestureDetector(
          onTap:(){

          },
          child: Text(Translation(context).text.nTeamsLeague,style: EstiloTextoBranco.negrito16),
        ),
      ],
    );
  }

  Widget nTeamsClassified(){
    return Column(
      children: [
        GestureDetector(
          onTap:(){

          },
          child: Text(Translation(context).text.nTeamsClassified,style: EstiloTextoBranco.negrito16),
        ),
      ],
    );
  }

  Widget nTeamsRelegated(){
    return Column(
      children: [
        GestureDetector(
          onTap:(){

          },
          child: Text(Translation(context).text.nTeamsRelegated,style: EstiloTextoBranco.negrito16),
        ),
      ],
    );
  }

  Widget changeClubs(){
    return Column(
      children: [
        GestureDetector(
          onTap:(){
            popUpSelectClub(originalContext: context);
          },
          child: Text(Translation(context).text.changeClubs,style: EstiloTextoBranco.negrito16),
        ),
      ],
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
                setState(() {
                  config.changeInjuryState();
                });
              }),
        ]
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
