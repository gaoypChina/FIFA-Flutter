import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/classes/countries/words.dart';
import 'package:fifa/classes/functions/dificuldade.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/database/select_database.dart';
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
  double spaceBetweenWidgets = 16;
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
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Geral", style: EstiloTextoBranco.text16),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors().greyTransparent,
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        children: [
                          language(),
                          divisoria(),
                          difficulty(),
                          divisoria(),
                          coachName(),
                        ],
                      ),
                    ),


                    SizedBox(height: spaceBetweenWidgets),

                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Gameplay", style: EstiloTextoBranco.text16),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors().greyTransparent,
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        children: [
                          initialMoney(),
                          divisoria(),
                          nTeamsClassified(),
                          divisoria(),
                          changeClubs(),
                          divisoria(),
                          soundEffects(config),
                          divisoria(),
                          turns(config),
                          divisoria(),
                          randomizePlayers(),
                          divisoria(),
                          seeProbability(),
                          divisoria(),
                          legends(config),
                          divisoria(),
                          allowCards(config),
                          divisoria(),
                          allowInjuries(config),
                          divisoria(),
                          imagesReal(config),
                          divisoria(),
                          playersOverallCheckbox(),
                        ],
                      ),
                    ),


                    SizedBox(height: spaceBetweenWidgets),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Terms and Conditions", style: EstiloTextoBranco.text16),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: AppColors().greyTransparent,
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Column(
                        children: [
                          policyPrivacy(),
                          divisoria(),
                          userTerms(),
                        ],
                      ),
                    ),
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
  Widget divisoria(){
    return SizedBox(
        width: Sized(context).width*0.9,
        child: Divider(color: AppColors().grey1)
    );
  }
  Widget coachName(){
    return pressOption(
        Translation(context).text.coachName,
        "Seu nome de treinador",
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


  Widget difficulty(){
    return pressOption(
        Translation(context).text.difficulty,
        "Dificuldade da simulação, transferências e obtenção de recursos",
        DificuldadeClass().getNameTranslated(context),
            () {DificuldadeClass().addDificulty();}
    );
  }

  Widget initialMoney(){
    return pressOption(
        Translation(context).text.initialMoney,
        "Dinheiro no inicio da carreira",
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
        "Permitir o uso de efeitos sonoros",
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
        "Ligas com partidas de ida e volta",
        config.turnIdaEVolta,
            (value) {
              customToast(Translation(context).text.inDevelopment);
              setState(() {
                config.changeTurnSwitchState();
              });
        });
  }



  Widget nTeamsClassified(){
    return textArrow(
      'Configurar Campeonatos',
      "Mudar número de clubes na liga, mudar quantidade de rebaixados e mais...",
        (){
          customToast(Translation(context).text.inDevelopment);
          Navigator.push(context,MaterialPageRoute(builder: (context) => const LeaguesConfiguration()));
          },
    );
  }

  Widget changeClubs(){
    return textArrow(
        Translation(context).text.changeClubs,
        "Mudar times dos campeonatos",
          (){popUpChangeClub(originalContext: context);},
    );
  }

  Widget textArrow(String title, String subtitle, Function() function){
    return PressableButton(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          children: [
            SizedBox(
              width: Sized(context).width*0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style: EstiloTextoBranco.negrito16),
                  Text(subtitle,style: EstiloTextoCinza.text12),
                ],
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 25),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
  Widget legends(ConfigurationState config){
    return defaultSlider(
        "Times lendários",
        "Permitir o uso de times lendários",
        globalLegendClubs,
            (value) {
          setState(() {
            globalLegendClubs = !globalLegendClubs;
            if (!globalLegendClubs){
              config.removeLegendsClub();
            }else{
              config.applyLegendsClub();
              SelectDatabase().load();
            }
          });
        });
  }
  Widget allowCards(ConfigurationState config){
    return defaultSlider(
        Translation(context).text.allowCards,
        "Permitir o uso de cartões amarelos e vermelhos",
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
        "Permitir a ocorrência de lesões",
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
        "Usar logos oficiais de clubes e campeonatos",
        config.showRealImages,
            (value) {
          setState(() {
            config.changeShowRealImagesState();
          });
        });
  }
  Widget playersOverallCheckbox(){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
        "Sortear os jogadores em times aleatórios",
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
        "Ver as probabilidades durante a simulação da partida",
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
        "",
            () {config.openPrivacyPolicy();}
    );
  }

  Widget userTerms(){
    return pressOption(
              Translation(context).text.userTerms,
              "",
              "",
              () {config.openTerms();}
      );
  }

  //////////////////////////////////////////////////////////////////////////
  // DEFAULT COMPONENTS

  Widget defaultSlider(String title, String subtitle, bool value, Function(bool) onChanged){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        children: [

          SizedBox(
            width: Sized(context).width*0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: EstiloTextoBranco.negrito16),
                const SizedBox(height: 4),
                Text(subtitle,style: EstiloTextoCinza.text12),
              ],
            ),
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

  Widget pressOption(String title, String subtitle,String variable, Function() onTap){
    return
      PressableButton(
        onTap:(){
          onTap();
          setState(() {});
        },
        child: Container(
          width: Sized(context).width,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Sized(context).width*0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: EstiloTextoBranco.negrito16),
                    const SizedBox(height: 4),
                    subtitle.isNotEmpty ? Text(subtitle,style: EstiloTextoCinza.text12) : Container(),
                  ],
                ),
              ),
              const Spacer(),
              Text(variable,style: EstiloTextoBranco.underline14),
            ],
          ),
        ),
      );
  }

  Widget language(){

    String flagName = const CountryNames().unitedstates;

    return
      PressableButton(
        onTap:(){
          setState(() {});
        },
        child: Container(
          width: Sized(context).width,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Sized(context).width*0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Translation(context).text.languageSelection,style: EstiloTextoBranco.negrito16),
                    const SizedBox(height: 4),
                    const Text("Idioma padrão do aplicativo", style: EstiloTextoCinza.text12),
                  ],
                ),
              ),
              const Spacer(),
              ClipOval(child: funcFlagsList(flagName, 30, 30)),
            ],
          ),
        ),
      );
  }

}