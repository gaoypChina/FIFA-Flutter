import 'dart:async';

import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/coach/coach_best_results.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/simulate/my_match/counter.dart';
import 'package:fifa/classes/simulate/my_match/my_match_simulation.dart';
import 'package:fifa/classes/simulate/simulate_functions.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/simulacao/after_play.dart';
import 'package:fifa/pages/simulacao/fim_campeonato.dart';
import 'package:fifa/pages/simulacao/substitution.dart';
import 'package:fifa/pages/simulacao/widgets_play/goal_widget.dart';
import 'package:fifa/pages/simulacao/widgets_play/header_play.dart';
import 'package:fifa/pages/simulacao/widgets_play/tactics.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/background_image/backimage_international_league.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/widgets/popup/popup_goal.dart';
import 'package:flutter/material.dart';

import '../../classes/my.dart';
import '../../widgets/field_static.dart';
import 'end_year.dart';

class Play extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final int adversarioClubID;
  final bool visitante;
  final bool isSingleMatch;
  const Play({Key? key, required this.adversarioClubID, required this.visitante, required this.isSingleMatch}) : super(key: key);
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {

  late Timer _timer;
  late CounterMatch counterMatch;
  double maxSliderDistance = 320;

  late PosturaDoTimeClass posturaDoTime;
  late MyMatchSimulation myMatchSimulation;

  //
  bool visitante = false;
  My myClass = My();
  Club myClubClass = Club(index: My().clubID);
  late Club adversarioClubClass;

  @override
  void dispose() {
    //Cancelar o timer do envio de email
    try {
      _timer.cancel();
    }catch(e){
      //print(e);
    }
    super.dispose();
  }
////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    doThisOnLaunch();
    myMatchSimulation = MyMatchSimulation(myClass,adversarioClubClass);    //Inicia a contagem
    counterMatch = CounterMatch();
    counterMatch.start(myClass, adversarioClubClass, myMatchSimulation, posturaDoTime);
    counter();
    visitanteFunc();
    super.initState();
  }
  doThisOnLaunch() {
    posturaDoTime = PosturaDoTimeClass(); //Começa com o valor padrão

    adversarioClubClass = Club(index: widget.adversarioClubID);
    //Reseta os indicadores da partida
    Simulate().startVariables();
  }
  visitanteFunc(){
    visitante = widget.visitante;
    myClubClass.name = visitante ? adversarioClubClass.name : myClass.clubName;
    adversarioClubClass.name = visitante ? myClass.clubName : adversarioClubClass.name;

    myMatchSimulation.visitante = visitante;
    myMatchSimulation.myClubClass = myClubClass;
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(

        body:  Stack(
            children: [

              backgroundTournament(Semana(semana),myClass),

                  Column(
                    children: [

                      const SizedBox(height: 30),

                      headerPlay(context, myMatchSimulation),

                      //GOLS MARCADOS
                      SizedBox(
                        height: 90,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start, //Começando a lista do topo
                          children: [
                            const SizedBox(width: 15),
                            goalWidget(context, true, myMatchSimulation),

                            const SizedBox(width: 15),
                            goalWidget(context, false, myMatchSimulation),

                          ],
                        ),
                      ),

                      //Campo de jogo
                      field(),

                      //TÁTICAS
                      tacticsWidget(context, myMatchSimulation, posturaDoTime),


                      Text(Translation(context).text.gameVelocity,style: EstiloTextoBranco.text14),
                      gameVelocitySlider(),

                      customButtonContinue(
                          title: counterMatch.milis>=90
                              ? Translation(context).text.nextMatchWeek
                              : Translation(context).text.substitution,
                          function: onContinueButton,
                      ),


                    ],
                  )

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget field(){
    return Expanded(
      child: Stack(
        children: [

          //Estádio
          Image.asset(Images().getStadium(myClubClass.name),height: 430,width: double.infinity,fit:BoxFit.fill),
          InteractiveViewer(
            panEnabled: true, // Set it to false to prevent panning.
            minScale: 0.5,
            maxScale: 4,
            child:
            //Jogadores
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: Sized(context).width-30,
                    height: 430,
                    child: visitante ? fieldGameplay442(adversarioClubClass) : fieldWidget(),
                  ),
                  SizedBox(
                    width: Sized(context).width,
                    height: 430,
                    child: visitante ? fieldWidget() : fieldGameplay442(adversarioClubClass),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
}

Widget gameVelocitySlider(){
    return Slider(
      activeColor: Colors.green,
      value: globalMatchVelocity,
      min: 10,max: maxSliderDistance,
      onChanged: (double value) {
        setState(() {
          globalMatchVelocity = value;
          _timer.cancel();
          counter();
        });
      },
    );
}
////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////
 onContinueButton(){
    if(widget.isSingleMatch){
      Navigator.pop(context);
    }else if(counterMatch.milis>=90 && counterMatch.finishedMatch){

      _timer.cancel();
      //SE FOR A ULTIMA RODADA DO CAMPEONATO MOSTRA A TABELA DE CLASSIFICAÇÃO FINAL
      //VERIFICA SE É A ULTIMA RODADA
      int nRodadas = League(index: myClass.leagueID).nClubs-1;

      bool ultimaRodadaLeague = (rodada==nRodadas && semanasJogosNacionais[nRodadas-1] == semana);
      if(ultimaRodadaLeague){
        navigatorPush(context, const FimCampeonato());
      }else if(semana == globalUltimaSemana){
        navigatorPush(context, const EndYear());
      }else{
        navigatorReplace(context, AfterPlay(
                                    adversarioClubID: widget.adversarioClubID,
                                    visitante: widget.visitante,
                                    goal1:myMatchSimulation.meuGolMarcado,
                                    goal2:myMatchSimulation.meuGolSofrido)
                      );
      }

      //SIMULA OUTRAS PARTIDAS
      Simulate().simulateWeek(simulMyMatch: false);

      //**Só funciona se ja tiver simulado todos os outros jogos
      //Tem uma dependencia pelo ResultGameNacional
      Confronto confronto = Confronto(clubName1: myClubClass.name, clubName2: adversarioClubClass.name);
      confronto.setGoals(goal1: myMatchSimulation.meuGolMarcado, goal2: myMatchSimulation.meuGolSofrido);
      CoachBestResults coachBestResults = CoachBestResults();
      coachBestResults.updateSequence(confronto);
    }else{
      _timer.cancel();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Substitution()))
          .then((value) => counter());
    }
  }

  counter(){
    _timer = Timer.periodic(Duration(milliseconds: int.parse(maxSliderDistance.floor().toString()) - globalMatchVelocity.toInt()), (timer) async {
      counterMatch.simulateMinute();
      setState(() {});
    });
  }

  showPopUpGoal(){
    int antes1 = myMatchSimulation.meuGolMarcado;
    int antes2 = myMatchSimulation.meuGolSofrido;

    //SIMULATE MATCH
    counterMatch.simulateMinute();

    if(myMatchSimulation.meuGolMarcado != antes1){
      popUpGoal(context: context,
          scorer: Jogador(index:globalMatchGoalScorerIDMy.last),
          milis: myMatchSimulation.milis,
          function: (){}
      );
    }
    if(myMatchSimulation.meuGolSofrido != antes2){
      popUpGoal(context: context,
          scorer: Jogador(index:globalMatchGoalScorerIDAdv.last),
          milis: myMatchSimulation.milis,
          function: (){}
      );

    }
  }
}
