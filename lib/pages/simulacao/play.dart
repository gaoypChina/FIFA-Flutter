import 'dart:async';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/my_match_result.dart';
import 'package:fifa/functions/coach/coach_best_results.dart';
import 'package:fifa/functions/simulate/my_match/counter.dart';
import 'package:fifa/functions/simulate/my_match/my_match_simulation.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/simulacao/fim_campeonato.dart';
import 'package:fifa/functions/simulate/simulate_functions.dart';
import 'package:fifa/pages/simulacao/substitution.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';
import '../../classes/my.dart';
import '../menu/c_menu.dart';
import '../../widgets/field_static.dart';
import 'end_year.dart';

class Play extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final int adversarioClubID;
  final bool visitante;
  const Play({Key? key,required this.adversarioClubID, required this.visitante}) : super(key: key);
  @override
  _PlayState createState() => _PlayState();
}

class _PlayState extends State<Play> {

  late Timer _timer;
  late CounterMatch counterMatch;
  double maxSliderDistance = 200;

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
      print(e);
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
    globalMatchGoalScorerIDMy = [];
    globalMatchGoalScorerIDAdv = [];
    globalMatchGoalsMinutesMy = [];
    globalMatchGoalsMinutesAdv = [];
    globalJogadoresMatchGoals = List.filled(globalMaxPlayersPermitted, 0);
    globalJogadoresMatchAssists = List.filled(globalMaxPlayersPermitted, 0);
    globalJogadoresMatchRedCards = List.filled(globalMaxPlayersPermitted, 0);
    globalJogadoresMatchYellowCards = List.filled(globalMaxPlayersPermitted, 0);
    globalJogadoresMatchInjury = List.filled(globalMaxPlayersPermitted, 0);
    globalJogadoresMatchHealth = List.filled(globalMaxPlayersPermitted, 1.0);
  }
  visitanteFunc(){
    visitante = widget.visitante;
    myClubClass.name = visitante ? Club(index: widget.adversarioClubID).name : myClass.clubName;
    adversarioClubClass.name = visitante ? myClass.clubName : Club(index: widget.adversarioClubID).name;
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    String textRodada = '';
    if(Semana(semana).isJogoCampeonatoNacional) {
      textRodada = '${Translation(context).text.matchWeek} ' + rodada.toString() + '/' + (League(index: myClass.campeonatoID).getNTeams()-1).toString();
    }else{
      textRodada = Name().groupsPhase;
      if(Semana(semana).isJogoGruposInternacional){textRodada += ' ${Semana(semana).rodadaGroupInternational}'; }
      else if(Semana(semana).isJogoMataMataInternacional){
        textRodada = Semana(semana).semanaStr;
      }
    }
    return Scaffold(

        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [

              Semana(semana).isJogoCampeonatoNacional
              ? Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill,)
                : myClass.getMyInternationalLeague() == LeagueOfficialNames().championsLeague
                    ? Image.asset('assets/icons/fundochampions.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill)
                    : Image.asset('assets/icons/fundolibertadores.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill,),


                  Column(
                    children: [

                      const SizedBox(height: 30),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //Escudo time 1
                          Image.asset(Images().getEscudo(myClubClass.name),height: 80,width: 80),

                          Column(
                            children: [
                              Semana(semana).isJogoCampeonatoNacional
                                  ? Image.asset(FIFAImages().campeonatoLogo(myClass.campeonatoID),height: 30,width: 30)
                                  : Image.asset(FIFAImages().campeonatoInternacionalLogo(myClass.getMyInternationalLeague()),height: 35,width: 35),
                              Text(textRodada,style: EstiloTextoBranco.text16),
                              visitante
                                  ? Text(myMatchSimulation.meuGolSofrido.toString() +'X'+ myMatchSimulation.meuGolMarcado.toString(),style: EstiloTextoBranco.text30)
                                  : Text(myMatchSimulation.meuGolMarcado.toString() +'X'+ myMatchSimulation.meuGolSofrido.toString(),style: EstiloTextoBranco.text30),
                              Text(counterMatch.milis.toString()+'\'',style: EstiloTextoBranco.text16),
                            ],
                          ),

                          //Escudo time 2
                          Image.asset(Images().getEscudo(adversarioClubClass.name),height: 80,width: 80),

                        ],
                      ),

                      //GOLS MARCADOS
                      SizedBox(
                        height: 90,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start, //Começando a lista do topo
                          children: [
                            const SizedBox(width: 15),
                            goalWidget(true),

                            const SizedBox(width: 15),
                            goalWidget(false),

                          ],
                        ),
                      ),

                      //Campo de jogo
                      Expanded(
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
                                      child: visitante ? fieldGameplay442(widget.adversarioClubID) : fieldWidget(),
                                  ),
                                  SizedBox(
                                      width: Sized(context).width,
                                      height: 430,
                                      child: visitante ? fieldWidget() : fieldGameplay442(widget.adversarioClubID),
                                  ),
                                ],
                              ),
                            ),
                            ),
                          ],
                        ),
                      ),

                      //TÁTICAS
                      tacticsWidget(),


                      Text(Translation(context).text.gameVelocity,style: EstiloTextoBranco.text14),
                      Slider(
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
                      ),

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
  Widget goalWidget(bool isTeam1){
    int lengthWidget = myMatchSimulation.meuGolSofrido;
    bool isMy = false;
    if((isTeam1 && !visitante) || (!isTeam1 && visitante)) {//
      lengthWidget = myMatchSimulation.meuGolMarcado;
      isMy = true;
    }
    return   lengthWidget > 0
        ? SingleChildScrollView(
        child: Column(
          children: [
          for(int i=0; i<lengthWidget; i++)
            goalWidgetRow(i, isMy)
          ],
        ),
    )
    : SizedBox(width: (Sized(context).width/2)-15);
  }
  Widget goalWidgetRow(int i,bool isMy){
    late int minuto;
    late int playerIndex;
    if(isMy){
      minuto = globalMatchGoalsMinutesMy[i];
      playerIndex = globalMatchGoalScorerIDMy[i];
    }else {
      minuto = globalMatchGoalsMinutesAdv[i];
      playerIndex = globalMatchGoalScorerIDAdv[i];
    }
      String playerName = Jogador(index: playerIndex).name;
      return
        Row(
        children: [
          Image.asset('assets/icons/bola.png',height:15,width: 15),
          Text(minuto.toString()+'\'  ',style: EstiloTextoBranco.text14),
          SizedBox(width:135,
              child: Text(playerName,overflow: TextOverflow.ellipsis,style: EstiloTextoBranco.text14)
          ),
        ],
      );

  }

  Widget tacticsWidget(){
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.white, //cor da borda do checkbox
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap:(){
                    posturaDoTime.setValue(posturaDoTime.defesa);
                  },
                  child: Opacity(
                      opacity:posturaDoTime.value == posturaDoTime.defesa ? 1: 0.5,
                      child: Image.asset('assets/icons/defensive.png',height: 35))),
              GestureDetector(
                  onTap:(){
                    posturaDoTime.setValue(posturaDoTime.normal);
                  },
                  child: Opacity(
                      opacity:posturaDoTime.value == posturaDoTime.normal ? 1: 0.5,
                      child: Image.asset('assets/icons/moderate.png',height: 35))),
              GestureDetector(
                  onTap:(){
                    posturaDoTime.setValue(posturaDoTime.ataque);
                  },
                  child: Opacity(
                      opacity:posturaDoTime.value == posturaDoTime.ataque ? 1: 0.5,
                      child: Image.asset('assets/icons/very offensive.png',height: 35))),
              globalSeeProbabilities ? Column(
                children: [
                  Text(Translation(context).text.scoreProbability,style: EstiloTextoBranco.text16),
                  Text('${myMatchSimulation.probGM.toString()}%',style: EstiloTextoBranco.text16),
                ],
              ) : Container(),
              globalSeeProbabilities ? Column(
                children: [
                  Text(Translation(context).text.takeProbability,style: EstiloTextoBranco.text16),
                  Text('${myMatchSimulation.probGS.toString()}%',style: EstiloTextoBranco.text16),
                ],
              ) : Container(),
            ],
          ),
        ),
      ],
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////
 onContinueButton(){
    if(counterMatch.milis>=90 && counterMatch.finishedMatch){

      _timer.cancel();
      //SE FOR A ULTIMA RODADA DO CAMPEONATO MOSTRA A TABELA DE CLASSIFICAÇÃO FINAL
      //VERIFICA SE É A ULTIMA RODADA
      int nRodadas = League(index: myClass.campeonatoID).nClubs-1;

      bool ultimaRodadaLeague = (rodada==nRodadas && semanasJogosNacionais[nRodadas-1] == semana);
      if(ultimaRodadaLeague){
        Navigator.push(context,MaterialPageRoute(builder: (context) => const FimCampeonato()));
      }else if(semana == globalUltimaSemana){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EndYear()));
      }else{
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Menu()));

      }

      //SIMULA OUTRAS PARTIDAS
      Simulate().simulateWeek();

      //**Só funciona se ja tiver simulado todos os outros jogos
      //Tem uma dependencia pelo ResultGameNacional
      MyLastMatchResult myLastMatchResult = MyLastMatchResult(myClubClass.index, adversarioClubClass.index, myMatchSimulation.meuGolMarcado, myMatchSimulation.meuGolSofrido);
      CoachBestResults coachBestResults = CoachBestResults();
      coachBestResults.updateSequence(myLastMatchResult);
    }else{
      _timer.cancel();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Substitution()))
          .then((value) => counter());
    }
  }

  counter(){
    _timer = Timer.periodic(Duration(milliseconds: 200 - globalMatchVelocity.toInt()), (timer) async {
      counterMatch.simulateMinute();
      setState(() {});
    });
  }

}
