import 'package:fifa/classes/functions/dificuldade.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/configuration/controller/configuration_state.dart';
import 'package:fifa/pages/configuration/leagues_configuration.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:fifa/widgets/popup/popup_change_clubs.dart';
import 'package:fifa/widgets/popup/popup_initial_money.dart';
import 'package:fifa/widgets/popup/poup_edit.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:flutter/material.dart';

class Configuration extends StatefulWidget {
  const Configuration({Key? key}) : super(key: key);

  @override
  State<Configuration> createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {

  ConfigurationState config = ConfigurationState();
  double spaceBetweenWidgets = 8;
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    config.setInitialCheckboxState(context);
    return Scaffold(
      body: Container(
        decoration: Images().getWallpaperContainerDecoration(),
        child: Stack(
          children: [

            backButtonText(context, 'Configurações', true),

            Container(
              padding: const EdgeInsets.only(top:8.0, left: 8, right: 8),
              margin: const EdgeInsets.only(top: 70),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: spaceBetweenWidgets),
                    coachName(),
                    SizedBox(height: spaceBetweenWidgets),
                    language(),
                    SizedBox(height: spaceBetweenWidgets),
                    difficulty(),
                    SizedBox(height: spaceBetweenWidgets),
                    initialMoney(),
                    SizedBox(height: spaceBetweenWidgets),
                    soundEffects(config),
                    SizedBox(height: spaceBetweenWidgets),
                    turns(config),
                    SizedBox(height: spaceBetweenWidgets),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        nTeamsClassified(),
                        changeClubs(),
                      ],),
                    SizedBox(height: spaceBetweenWidgets),
                    randomizePlayers(),
                    SizedBox(height: spaceBetweenWidgets),
                    seeProbability(),
                    SizedBox(height: spaceBetweenWidgets),
                    allowCards(config),
                    SizedBox(height: spaceBetweenWidgets),
                    allowInjuries(config),
                    SizedBox(height: spaceBetweenWidgets),
                    imagesReal(config),
                    SizedBox(height: spaceBetweenWidgets),
                    playersOverallCheckbox(),
                    policyPrivacy(),
                    SizedBox(height: spaceBetweenWidgets),
                    userTerms(),
                    SizedBox(height: spaceBetweenWidgets),
                    //test(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget coachName(){
    return PressableButton(
      onTap:(){
        popupEdit(
            context: context,
            title: Translation(context).text.coachName,
            variable: config.coachName,
            isStringType: true,
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
    return PressableButton(
      onTap: (){

      },
      child: Row(
        children: [
          Expanded(child: Text(Translation(context).text.languageSelection,style: EstiloTextoBranco.negrito16)),
          Text(Translation(context).text.language,style: EstiloTextoBranco.text16),
        ],
      ),
    );
  }

  Widget difficulty(){
    return
      PressableButton(
        onTap:(){
          DificuldadeClass().addDificulty();
          setState(() {});
        },
        child: SizedBox(
          width: Sized(context).width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(Translation(context).text.difficulty,style: EstiloTextoBranco.negrito16),
              const Spacer(),
              Text(DificuldadeClass().getNameTranslated(context),style: EstiloTextoBranco.underline14),
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
    return PressableButton(
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


  Widget nTeamsClassified(){
    return PressableButton(
        onTap:(){
          customToast(Translation(context).text.inDevelopment);
          Navigator.push(context,MaterialPageRoute(builder: (context) => const LeaguesConfiguration()));
        },
      child: Container(
        height: 80,
        width: Sized(context).width*0.4,
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(
              Radius.circular(5.0) //                 <--- border radius here
          ),
        ),
        child: const Center(child: Text('Configurar Campeonatos',textAlign: TextAlign.center,style: EstiloTextoBranco.negrito16)),
      ),
    );
  }

  Widget changeClubs(){
    return PressableButton(
      onTap:(){
        popUpChangeClub(originalContext: context);
      },
      child: Container(
        height: 80,
        width: Sized(context).width*0.4,
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(
              Radius.circular(5.0) //                 <--- border radius here
          ),
        ),
        child: Center(child: Text(Translation(context).text.changeClubs,textAlign: TextAlign.center,style: EstiloTextoBranco.negrito16)),
      ),
    );
  }

  Widget allowCards(ConfigurationState config){
    return defaultSlider(
        Translation(context).text.allowCards,
        config.hasCards,
            (value) {
              customToast(Translation(context).text.inDevelopment);
              setState(() {
                config.changeCardsState();
              });
        });
  }
  Widget allowInjuries(ConfigurationState config){
    return defaultSlider(
        Translation(context).text.allowInjuries,
        config.hasInjuries,
            (value) {
              customToast(Translation(context).text.inDevelopment);
              setState(() {
                config.changeInjuryState();
              });
        });
  }

  Widget imagesReal(ConfigurationState config){
    return defaultSlider(
        'Imagens Reais',
        config.showRealImages,
            (value) {
          setState(() {
            config.changeShowRealImagesState();
          });
        });
  }
  Widget playersOverallCheckbox(){
    return Container(
      color: AppColors().greyTransparent,
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Overall das equipes',style: EstiloTextoBranco.negrito16),
          for(int i=0;i<config.names.length;i++)
          CheckboxListTile(
            title: Text(config.names[i],style: EstiloTextoBranco.negrito16),
            value: config.states[i],
            onChanged: (newValue) {
              if(newValue == true){
                config.setStates(i);
              }
                setState(() {});
            },
            controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
          ),
        ],
      ),
    );
  }
  Widget randomizePlayers(){
    return defaultSlider(
        'Jogadores em times aleatórios',
        config.randomizePlayers,
            (value) {
          setState(() {
            config.changeRandomizePlayersState();
          });
        });
  }
  Widget seeProbability(){
    return defaultSlider(
        Translation(context).text.seeProbability,
        config.seeProbability,
            (value) {
              setState(() {
                config.changeSeeProbabilityState();
              });
            });
  }

  Widget defaultSlider(String title, bool value, Function(bool) onChanged){
    return Container(
      padding: const EdgeInsets.all(4),
      color: AppColors().greyTransparent,
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: Text(title,style: EstiloTextoBranco.negrito16),
          ),
          const Spacer(),
          Switch(
              value: value,
              onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget policyPrivacy(){
    return Column(
      children: [
        GestureDetector(
          onTap:(){
            config.openPrivacyPolicy();
          },
          child: Text(Translation(context).text.userTerms,style: EstiloTextoBranco.negrito16),
        ),
      ],
    );
  }

  Widget userTerms(){
    return Column(
      children: [
        PressableButton(
            onTap:(){
              config.openTerms();
            },
            child: Text(Translation(context).text.userTerms,style: EstiloTextoBranco.negrito16),
        ),
      ],
    );
  }


  Widget textWidget(){
    return Column(
      children: [
        GestureDetector(
          onTap:() async{
          },
          child: const Text('Test',style: EstiloTextoBranco.negrito16),
        ),
      ],
    );
  }

}