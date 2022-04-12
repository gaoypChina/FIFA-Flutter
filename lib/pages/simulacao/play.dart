import 'dart:async';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/functions/simulate/my_match/counter.dart';
import 'package:fifa/functions/simulate/my_match/my_match_simulation.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/simulacao/fim_campeonato.dart';
import 'package:fifa/functions/simulate/simulate_functions.dart';
import 'package:fifa/pages/simulacao/substitution.dart';
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
    globalMatchGoalScorerIDMy=[];
    globalMatchGoalScorerIDAdv=[];
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
    if(Semana().isJogoCampeonatoNacional) {
      textRodada = 'Rodada ' + rodada.toString() + '/' + (League(index: myClass.campeonatoID).getNTeams()-1).toString();
    }else{
      textRodada = Name().groupsPhase;
      if(semanaOitavas.contains(semana)){textRodada = Name().oitavas;}
      if(semanaQuartas.contains(semana)){textRodada = Name().quartas;}
      if(semanaSemi.contains(semana)){textRodada = Name().semifinal;}
      if(semanaFinal.contains(semana)){textRodada = Name().finale;}
    }
    return Scaffold(

        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [

              Semana().isJogoCampeonatoNacional
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
                          Image.asset('assets/clubs/${FIFAImages().imageLogo(myClubClass.name)}.png',height: 80,width: 80),

                          Column(
                            children: [
                              Semana().isJogoCampeonatoNacional
                                  ? Image.asset(FIFAImages().campeonatoLogo(myClass.campeonatoID),height: 30,width: 30)
                                  : Image.asset(FIFAImages().campeonatoInternacionalLogo(myClass.getMyInternationalLeague()),height: 35,width: 35),
                              Text(textRodada,style: EstiloTextoBranco.text16),
                              Text(counterMatch.milis.toString()+'\'',style: EstiloTextoBranco.text16),
                              visitante
                                  ? Text(myMatchSimulation.meuGolSofrido.toString() +'X'+ myMatchSimulation.meuGolMarcado.toString(),style: EstiloTextoBranco.text30)
                                  : Text(myMatchSimulation.meuGolMarcado.toString() +'X'+ myMatchSimulation.meuGolSofrido.toString(),style: EstiloTextoBranco.text30),
                            ],
                          ),

                          //Escudo time 2
                          Image.asset('assets/clubs/${FIFAImages().imageLogo(adversarioClubClass.name)}.png',height: 80,width: 80),

                        ],
                      ),

                      //GOLS MARCADOS
                      SizedBox(
                        height: 90,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start, //Começando a lista do topo
                          children: [
                            const SizedBox(width: 14),
                            goalWidget(true),

                            const SizedBox(width: 70),
                            goalWidget(false),

                          ],
                        ),
                      ),

                      //Campo de jogo
                      Expanded(
                        child: Stack(
                          children: [

                            //Estádio
                            Image.asset('assets/clubs/${FIFAImages().imageLogo(myClubClass.name)}0.jpg',height: 420,width: double.infinity,fit:BoxFit.fill),

                            //Jogadores
                            Row(
                              children: [
                                SizedBox(
                                  width: 190,
                                    child: fieldGameplay442(visitante ? widget.adversarioClubID : myClass.clubID)
                                ),
                                SizedBox(
                                    width: 190,
                                    child: fieldGameplay442(visitante ? myClass.clubID : widget.adversarioClubID)
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),

                      //TÁTICAS
                      tacticsWidget(),


                      const Text('Velocidade do Jogo',style: EstiloTextoBranco.text14),
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
                          title: counterMatch.milis>=90 ? 'Próxima Rodada' : 'Substituição',
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
    : const SizedBox(width: 145);
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
          SizedBox(width:120,
              child: Text(playerName,overflow: TextOverflow.ellipsis,style: EstiloTextoBranco.text14)
          ),
          Text(minuto.toString()+'\'',style: EstiloTextoBranco.text14)
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
              Column(
                children: [
                  const Text('Marcar',style: EstiloTextoBranco.text16),
                  Text('${myMatchSimulation.probGM.toString()}%',style: EstiloTextoBranco.text16),
                ],
              ),
              Column(
                children: [
                  const Text('Sofrer',style: EstiloTextoBranco.text16),
                  Text('${myMatchSimulation.probGS.toString()}%',style: EstiloTextoBranco.text16),
                ],
              ),
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
