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
                    SizedBox(height: spaceBetweenWidgets),
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
    return pressOption(
        Translation(context).text.coachName,
        config.coachName,
            () {
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
            }
    );
  }

  Widget language(){
    return pressOption(
        Translation(context).text.languageSelection,
        Translation(context).text.language,
            () {}
    );
  }

  Widget difficulty(){
    return pressOption(
        Translation(context).text.difficulty,
        DificuldadeClass().getNameTranslated(context),
            () {DificuldadeClass().addDificulty();}
    );
  }

  Widget initialMoney(){
    return pressOption(
        Translation(context).text.initialMoney,
        config.initialMoney>0 ? config.initialMoney.toString() : Translation(context).text.standard,
            () {
          popUpInitialMoney(
                context: context,
                function: (value){
                  config.initialMoney = value.initialMoney;
                }
            );
        }
    );
  }


Widget soundEffects(ConfigurationState config){
    return  defaultSlider(
        Translation(context).text.soundEffects,
        config.hasSoundEffect,
            (value) {
              setState(() {
                customToast(Translation(context).text.inDevelopment);
                config.hasSoundEffect = value;
                globalHasSoundEffects = !globalHasSoundEffects;
              });
        });
}


  Widget turns(ConfigurationState config){
    return defaultSlider(
        Translation(context).text.turnsN,
        config.turnIdaEVolta,
            (value) {
              customToast(Translation(context).text.inDevelopment);
              setState(() {
                config.changeTurnSwitchState();
              });
        });
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


  Widget policyPrivacy(){
    return pressOption(
        Translation(context).text.userTerms,
        "",
            () {config.openPrivacyPolicy();}
    );
  }

  Widget userTerms(){
    return pressOption(
              Translation(context).text.userTerms,
              "",
              () {config.openTerms();}
      );
  }

  //////////////////////////////////////////////////////////////////////////
  // DEFAULT COMPONENTS

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

  Widget pressOption(String title, String variable, Function() onTap){
    return
      Container(
        color: AppColors().greyTransparent,
        child: PressableButton(
          onTap:(){
            setState(() {});
          },
          child: Container(
            width: Sized(context).width,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,style: EstiloTextoBranco.negrito16),
                const Spacer(),
                Text(variable,style: EstiloTextoBranco.underline14),
              ],
            ),
          ),
        ),
      );
  }


}