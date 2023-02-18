import 'package:fifa/classes/functions/dificuldade.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/configuration/controller/configuration_state.dart';
import 'package:fifa/pages/configuration/leagues_configuration.dart';
import 'package:fifa/widgets/popup/popup_change_clubs.dart';
import 'package:fifa/widgets/popup/popup_initial_money.dart';
import 'package:fifa/widgets/popup/poup_edit.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/back_button.dart';
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

            backButtonText(context, 'Configurações'),

            Container(
              padding: const EdgeInsets.all(8.0),
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
                    playersOverallCheckbox(),
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
                    policyPrivacy(),
                    SizedBox(height: spaceBetweenWidgets),
                    userTerms(),
                    SizedBox(height: spaceBetweenWidgets),
                    tutorial(),
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
    return           GestureDetector(
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
    return Row(
      children: [
        Expanded(child: Text(Translation(context).text.languageSelection,style: EstiloTextoBranco.negrito16)),
        Text(Translation(context).text.language,style: EstiloTextoBranco.text16),
      ],
    );
  }

  Widget difficulty(){
    return
      GestureDetector(
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


  Widget nTeamsClassified(){
    return GestureDetector(
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
    return GestureDetector(
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

  Widget imagesReal(ConfigurationState config){
    return Row(
        children: [
          const SizedBox(
            width: 200,
            child: Text("Imagens Reais",style: EstiloTextoBranco.negrito16),
          ),

          const Spacer(),
          Switch(
              value: config.showRealImages,
              onChanged: (value) {
                setState(() {
                  config.changeShowRealImagesState();
                });
              }),
        ]
    );
  }
  Widget playersOverallCheckbox(){
    return Column(
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
    );
  }
  Widget randomizePlayers(){
    return Row(
      children: [
        const SizedBox(
          width: 200,
          child: Text('Jogadores em times aleatórios',style: EstiloTextoBranco.negrito16),
        ),
        const Spacer(),
        Switch(
            value: config.randomizePlayers,
            onChanged: (value) {
              setState(() {
                config.changeRandomizePlayersState();
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
        GestureDetector(
            onTap:(){
              config.openTerms();
            },
            child: Text(Translation(context).text.userTerms,style: EstiloTextoBranco.negrito16),
        ),
      ],
    );
  }

  Widget tutorial(){
    return Column(
      children: [
        GestureDetector(
          onTap:(){
            bottomSheet('Jogo muito louco');
          },
          child: const Text('Tutorial',style: EstiloTextoBranco.negrito16),
        ),
      ],
    );
  }

  bottomSheet(String text){
    return showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            color: Colors.greenAccent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(text,textAlign: TextAlign.center)),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget test(){
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