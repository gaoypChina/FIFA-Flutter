import 'dart:async';
import 'dart:math';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/dificuldade.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/chaves.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/simulacao/fim_campeonato.dart';
import 'package:fifa/functions/fim_campeonato_local.dart';
import 'package:fifa/functions/simulate_functions.dart';
import 'package:fifa/pages/simulacao/substitution.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button_continue.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';
import '../../classes/my.dart';
import '../menu/c_menu.dart';
import '../../widgets/field.dart';
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
  //late double _height, _width;
  int milis = 0;
  bool finishedMatch = false;
  double maxSliderDistance = 200;
  bool ultimaRodadaLeague = false;

  int pontosA=0,pontosB=0;
  String posturaDoTime = 'Normal';
  int probGM=0,probGS=0;
  int meuGolMarcado=0, meuGolSofrido=0;

  //
  bool visitante = false;
  My myClass = My();
  Club myClubClass = Club(index: My().clubID);
  late String clubName1;
  late Club adversarioClubClass;
  late String clubName2;
  late List adversarioEscalacao;

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
    visitanteFunc();
    super.initState();
  }
  doThisOnLaunch() {
    adversarioClubClass = Club(index: widget.adversarioClubID);
    adversarioEscalacao = adversarioClubClass.optimizeBestSquadClub();

    //Reseta os indicadores da partida
    globalMatchGoalScorerIDMy=[];
    globalMatchGoalScorerIDAdv=[];
    globalMatchGoalsMinutesMy = [];
    globalMatchGoalsMinutesAdv = [];
    globalJogadoresMatchGoals = List.filled(10000, 0);
    globalJogadoresMatchAssists = List.filled(10000, 0);
    globalJogadoresMatchRedCards = List.filled(10000, 0);
    globalJogadoresMatchYellowCards = List.filled(10000, 0);
    globalJogadoresMatchInjury = List.filled(10000, 0);
    globalJogadoresMatchHealth = List.filled(10000, 1.0);

    //Inicia a contagem
    counter();
  }
  visitanteFunc(){
    visitante = widget.visitante;
    clubName1 = visitante ? Club(index: widget.adversarioClubID).name : myClass.clubName;
    clubName2 = visitante ? myClass.clubName : Club(index: widget.adversarioClubID).name;

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
      textRodada = 'Fase de Grupos';
      if(semanaOitavas.contains(semana)){textRodada = 'Oitavas';}
      if(semanaQuartas.contains(semana)){textRodada = 'Quartas';}
      if(semanaSemi.contains(semana)){textRodada = 'Semi';}
      if(semanaFinal.contains(semana)){textRodada = 'Final';}
    }

    return WillPopScope(//IF GO BACK TO PREVIOUS PAGE
      onWillPop: () async{
        return false;
      },
      child: Scaffold(

          resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
          body:  Stack(
              children: [

                Semana().isJogoCampeonatoNacional || !Semana().isJogoCampeonatoInternacional
                ? Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill,)
                  : myClass.internationalLeagueName == LeagueOfficialNames().championsLeague
                      ? Image.asset('assets/icons/fundochampions.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill)
                      : Image.asset('assets/icons/fundolibertadores.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill,),


                Column(
                  children: [

                    const SizedBox(height: 40),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Escudo time 1
                        Image.asset('assets/clubs/${FIFAImages().imageLogo(clubName1)}.png',height: 80,width: 80),

                        Column(
                          children: [
                            Image.asset(FIFAImages().campeonatoLogo(myClass.campeonatoID),height: 30,width: 30),
                            Text(textRodada,style: EstiloTextoBranco.text16),
                            Text(milis.toString()+'\'',style: EstiloTextoBranco.text16),
                            visitante
                                ? Text(meuGolSofrido.toString() +'X'+ meuGolMarcado.toString(),style: EstiloTextoBranco.text30)
                                : Text(meuGolMarcado.toString() +'X'+ meuGolSofrido.toString(),style: EstiloTextoBranco.text30),
                          ],
                        ),

                        //Escudo time 2
                        Image.asset('assets/clubs/${FIFAImages().imageLogo(clubName2)}.png',height: 80,width: 80),

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
                          Image.asset('assets/clubs/${FIFAImages().imageLogo(clubName1)}0.jpg',height: 420,width: double.infinity,fit:BoxFit.fill),

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


                    const Text('Velocidade do Jogo',style: EstiloTextoBranco.text14),
                    Slider(
                      activeColor: Colors.green,
                      value: matchVelocity,
                      min: 10,max: maxSliderDistance,
                      onChanged: (double value) {
                        setState(() {
                          matchVelocity = value;
                          _timer.cancel();
                          counter();
                        });
                      },
                    ),

                    customButtonContinue(
                        title: milis>=90 ? 'Próxima Rodada' : 'Substituição',
                        function: (){
                          if(milis>=90 && finishedMatch){
                            _timer.cancel();
                            //SE FOR A ULTIMA RODADA DO CAMPEONATO MOSTRA A TABELA DE CLASSIFICAÇÃO FINAL
                            if(ultimaRodadaLeague){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => const FimCampeonato()));
                            }else{
                              if(semana == ultimasemana){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EndYear()));
                              }else{
                                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Menu()));
                              }
                            }
                          }else{
                            _timer.cancel();
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Substitution()))
                                .then((value) => counter());
                          }
                        }
                    ),


                  ],
                )

              ]
          )
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget goalWidget(bool isTeam1){
    int lengthWidget = meuGolSofrido;
    bool isMy =false;
    if((isTeam1 && !visitante) || (!isTeam1 && visitante)) {//
      lengthWidget = meuGolMarcado;
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


  ////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                  //
////////////////////////////////////////////////////////////////////////////
counter (){
  _timer = Timer.periodic(Duration(milliseconds: 200 - matchVelocity.toInt()), (timer) async {

    milis+=1;
    if(milis>90){
      _timer.cancel();
      if(!finishedMatch){
        customToast('Simulando as outras partidas');
        endMatch(); //set vitoria, empate ou derrota

        premiacao(); //dinheiro

        //update poe +1 match pros meus jogadores
        Simulate().setMatchPlus1(myClubClass);
        Simulate().setMatchPlus1(adversarioClubClass);

        if(semanasJogosNacionais.contains(semana)){
          //salva resultado no histórico
          setHistoricGoalsLeagueMy();
          //Simula outras partidas
          Simulate().nationalMatchs();//GOLS, AMARELOS, ASSISTS, INJURY ETC...
        }else if(semanasGruposInternacionais.contains(semana)){
          Simulate().internationalMatchsGroups();
        }

        //VERIFICA SE É A ULTIMA RODADA
        int nRodadas = League(index: myClass.campeonatoID).getNTeams()-1;
        ultimaRodadaLeague = (rodada==nRodadas && semanasJogosNacionais[nRodadas-1] == semana);

        //evita que o set state atualize a rodada na visualização da página
        await Future.delayed(const Duration(milliseconds: 50));
        //ATUALIZA RODADA
        semana++;
        if(semanasJogosNacionais.contains(semana)) {
            rodada = semanasJogosNacionais.indexOf(semana)+1;
        }
        //Times na champions e libertadores
        if(semana == semanasJogosInternacionais[0]){
          FimDoCampeonatoLocal().setAll032InternationalTeams();
        }

        finishedMatch = true;

        customToast('FIM DA RODADA');
      }
    }else{
      updateHealth();
      golPorMinuto(myClubClass.getOverall(), adversarioClubClass.getOverall());
      Simulate().setRedCardsYellowCardsInjury(myClubClass, true);
      Simulate().setRedCardsYellowCardsInjury(adversarioClubClass, true);
      setState(() {});
    }
  });
}

golPorMinuto(double overallMy, double overallAdversario){

    //Define a probabilidade de marcar gol GM e de sofrer gol GS
    funcPosturaTime(overallMy, overallAdversario);

    int gol = Random().nextInt(800);

    //EU FAÇO O GOL
    if(gol<=probGM) {

      funcMeuGol(gol);

     //GOL DO ADVERSARIO
    }else{
      //Os dois times não podem fazer gol no mesmo minuto
      //Ex: GM: 20 GS:15 e nº= 8
      gol = Random().nextInt(900);
        funcGolAdversario(gol);
    }

  }

  void funcMeuGol(int gol){
    globalMatchGoalsMinutesMy.add(milis);
    meuGolMarcado++;
    setState(() {});
    //quem fez GOL
    funcQuemfezgol(1);
    //quem fez ASSISTENCIA
    funcQuemfezAssistencia(1);
  }
  void funcGolAdversario(int gol){
    //TOMO O GOL
    if (gol <= probGS) {
      globalMatchGoalsMinutesAdv.add(milis);
      meuGolSofrido++;
      setState(() {});
      //GOL ADVERSARIO
      //QUEM FEZ O GOL DO ADVERSARIO ACESSA A FUNÇÃO quemfezgol, retorna um int
      funcQuemfezgol(2);
      //quem fez ASSISTENCIA
      funcQuemfezAssistencia(2);
    }
  }

  funcQuemfezgol(int clubMyorAdv){

    int quemfez = Simulate().funcQuemfezgol();

    //Procura o nome do jogador na lista de todos os jogadores e adiciona um gol pra ele
    late int jogadorID;
    if(clubMyorAdv==1){
      jogadorID=myClass.jogadores[quemfez];
      globalMatchGoalScorerIDMy.add(jogadorID);
    }
    if(clubMyorAdv==2){
      jogadorID=adversarioEscalacao[quemfez];
      globalMatchGoalScorerIDAdv.add(jogadorID);
    }
    if(Semana().isJogoCampeonatoNacional){
      globalJogadoresLeagueGoals[jogadorID]++;
    }if(Semana().isJogoCampeonatoInternacional){
      globalJogadoresInternationalGoals[jogadorID]++;
    }
    globalJogadoresMatchGoals[jogadorID]++;
  }

  funcQuemfezAssistencia(int clubMyorAdv){

    int quemfez = Simulate().funcQuemfezAssistencia();
    if(quemfez >= 0) { //nem todos gols tem assitencia, 75% tem

    //Procura o nome do jogador na lista de todos os jogadores e adiciona uma assistencia pra ele
      late int jogadorID;
      if(clubMyorAdv==1){jogadorID=myClass.jogadores[quemfez];}
      if(clubMyorAdv==2){jogadorID=adversarioEscalacao[quemfez];}
      if(Semana().isJogoCampeonatoNacional){
        globalJogadoresLeagueAssists[jogadorID]++;
      }else{
       globalJogadoresInternationalAssists[jogadorID]++;
      }
        globalJogadoresMatchAssists[jogadorID]++;

    }
  }


  void funcPosturaTime(double overallEquipeA, double overallEquipeB){
    //TIME NA DEFESA
    if(posturaDoTime=='Defesa'){
      if(overallEquipeA-overallEquipeB>10)                                    {probGM=20;probGS=3;}
      if(overallEquipeA-overallEquipeB>6)                                    {probGM=16;probGS=5;} //marca 4 e toma 0,3 gols por jogo
      if(overallEquipeA-overallEquipeB<=6 && overallEquipeA-overallEquipeB>4){probGM=15;probGS=6;}
      if(overallEquipeA-overallEquipeB<=4 && overallEquipeA-overallEquipeB>2){probGM=14;probGS=7;}
      if(overallEquipeA-overallEquipeB<=2 && overallEquipeA-overallEquipeB>1){probGM=13;probGS=10;}
      if(overallEquipeA-overallEquipeB<=1 && overallEquipeA-overallEquipeB>-1){probGM=12;probGS=12;}
      if(overallEquipeA-overallEquipeB<=-1 && overallEquipeA-overallEquipeB>-2){probGM=10;probGS=13;}
      if(overallEquipeA-overallEquipeB<=-2 && overallEquipeA-overallEquipeB>-4){probGM=7;probGS=14;}
      if(overallEquipeA-overallEquipeB<=-4 && overallEquipeA-overallEquipeB>-6){probGM=6;probGS=15;}
      if(overallEquipeA-overallEquipeB<=-6)                                     {probGM=5;probGS=16;}}
    //TIME NORMAL
    if(posturaDoTime=='Normal'){
      if(overallEquipeA-overallEquipeB>=10)                                    {probGM=30;probGS=5;}
      if(overallEquipeA-overallEquipeB>=6)                                    {probGM=25;probGS=7;} //marca 4 e toma 0,3 gols por jogo
      if(overallEquipeA-overallEquipeB<6 && overallEquipeA-overallEquipeB>=4){probGM=22;probGS=10;}
      if(overallEquipeA-overallEquipeB<4 && overallEquipeA-overallEquipeB>=2){probGM=20;probGS=12;}
      if(overallEquipeA-overallEquipeB<=2 && overallEquipeA-overallEquipeB>1){probGM=18;probGS=14;}
      if(overallEquipeA-overallEquipeB<=1 && overallEquipeA-overallEquipeB>-1){probGM=16;probGS=16;}
      if(overallEquipeA-overallEquipeB<=-1 && overallEquipeA-overallEquipeB>-2){probGM=14;probGS=18;}
      if(overallEquipeA-overallEquipeB<=-2 && overallEquipeA-overallEquipeB>-4){probGM=12;probGS=20;}
      if(overallEquipeA-overallEquipeB<=-4 && overallEquipeA-overallEquipeB>-6){probGM=10;probGS=22;}
      if(overallEquipeA-overallEquipeB<=-6)                                     {probGM=7;probGS=25;}}
    //TIME NO ATAQUE
    if(posturaDoTime=='Ataque'){
      if(overallEquipeA-overallEquipeB>=10)                                    {probGM=35;probGS=8;}
      if(overallEquipeA-overallEquipeB>=6)                                    {probGM=30;probGS=10;} //marca 4 e toma 0,3 gols por jogo
      if(overallEquipeA-overallEquipeB<6 && overallEquipeA-overallEquipeB>=4){probGM=26;probGS=12;}
      if(overallEquipeA-overallEquipeB<4 && overallEquipeA-overallEquipeB>=2){probGM=23;probGS=14;}
      if(overallEquipeA-overallEquipeB<=2 && overallEquipeA-overallEquipeB>1){probGM=20;probGS=16;}
      if(overallEquipeA-overallEquipeB<=1 && overallEquipeA-overallEquipeB>-1){probGM=18;probGS=18;}
      if(overallEquipeA-overallEquipeB<=-1 && overallEquipeA-overallEquipeB>-2){probGM=16;probGS=20;}
      if(overallEquipeA-overallEquipeB<=-2 && overallEquipeA-overallEquipeB>-4){probGM=14;probGS=23;}
      if(overallEquipeA-overallEquipeB<=-4 && overallEquipeA-overallEquipeB>-6){probGM=12;probGS=26;}
      if(overallEquipeA-overallEquipeB<=-6)                                     {probGM=10;probGS=30;}}
  }


  endMatch(){
    //VITORIA
    if(Semana().isJogoCampeonatoNacional) {
      if (meuGolMarcado > meuGolSofrido) {
        globalClubsLeaguePoints[myClass.clubID] += 3;
        globalMyLeagueLastResults.add(3);
      }
      //EMPATE
      if (meuGolMarcado == meuGolSofrido) {
        globalClubsLeaguePoints[myClass.clubID] += 1;
        globalClubsLeaguePoints[widget.adversarioClubID] += 1;
        globalMyLeagueLastResults.add(1);
      }
      //DERROTA
      if (meuGolMarcado < meuGolSofrido) {
        globalClubsLeaguePoints[widget.adversarioClubID] += 3;
        globalMyLeagueLastResults.add(0);
      }

      globalClubsLeagueGM[myClass.clubID] += meuGolMarcado;
      globalClubsLeagueGS[myClass.clubID] += meuGolSofrido;
      globalClubsLeagueGM[widget.adversarioClubID] += meuGolSofrido;
      globalClubsLeagueGS[widget.adversarioClubID] += meuGolMarcado;

    }else if(Semana().isJogoCampeonatoInternacional){
      if (meuGolMarcado > meuGolSofrido) {
        globalClubsInternationalPoints[myClass.clubID] += 3;
        globalMyLeagueLastResults.add(3);
      }
      //EMPATE
      if (meuGolMarcado == meuGolSofrido) {
        globalClubsInternationalPoints[myClass.clubID] += 1;
        globalClubsInternationalPoints[widget.adversarioClubID] += 1;
        globalMyLeagueLastResults.add(1);
      }
      //DERROTA
      if (meuGolMarcado < meuGolSofrido) {
        globalClubsInternationalPoints[widget.adversarioClubID] += 3;
        globalMyLeagueLastResults.add(0);
      }
      globalClubsInternationalGM[myClass.clubID] += meuGolMarcado;
      globalClubsInternationalGS[myClass.clubID] += meuGolSofrido;
      globalClubsInternationalGM[widget.adversarioClubID] += meuGolSofrido;
      globalClubsInternationalGS[widget.adversarioClubID] += meuGolMarcado;
    }
  }

  updateHealth(){
    for(int i=0; i<globalJogadoresMatchHealth.length; i++){
      globalJogadoresMatchHealth[i] -= 0.01;
      if(milis==45) globalJogadoresMatchHealth[i] += 0.1;
    }

  }

  ///////////////////////////////////////////////////////

  void premiacao(){
    double premio=0;
    String leagueName = myClass.campeonatoName;
    if(Semana().isJogoCampeonatoNacional){
      if(leagueName==LeagueOfficialNames().inglaterra1){premio=2.2;}//premierleague
      else if(leagueName==LeagueOfficialNames().italia1
          || leagueName==LeagueOfficialNames().espanha1
          ||leagueName==LeagueOfficialNames().alemanha1){premio=2.0;}//italia, espanha, alemanha
      else if(leagueName==LeagueOfficialNames().franca1){premio=1.8;}//frances
      else if(leagueName==LeagueOfficialNames().ligaEuropa){premio=1.6;}//ocidente
      else if(leagueName==LeagueOfficialNames().lesteEuropeu){premio=1.4;}//leste
      else if(leagueName==LeagueOfficialNames().inglaterra2){premio=1.2;}//championship
      else if(leagueName==LeagueOfficialNames().brasil1){premio=1.4;}//brasileiro
      else if(leagueName==LeagueOfficialNames().brasil2){premio=0.7;}//serie b
      else if(leagueName==LeagueOfficialNames().argentina){premio=1.1;}//argentina
      else if(leagueName==LeagueOfficialNames().sulamericano){premio=1.0;}//sulamerica
      else if(leagueName==LeagueOfficialNames().colombiaMexico){premio=1.1;}//colombia mexico
      else if(leagueName==LeagueOfficialNames().estadosUnidos){premio=1.2;}//mls
      else if(leagueName==LeagueOfficialNames().asia){premio=1.0;}//asia}
      else{
        premio=1.0;
      }

    }else{
      if(myClass.internationalLeagueName == LeagueOfficialNames().championsLeague){
        premio=3;
        if(semanaOitavas.contains(rodada) || semanaQuartas.contains(rodada)) premio=4.0;
        if(semanaSemi.contains(rodada) || semanaFinal.contains(rodada)) premio=5.0;
      }
      if(myClass.internationalLeagueName == LeagueOfficialNames().libertadores){
        premio=2;
        if(semanaOitavas.contains(rodada) || semanaQuartas.contains(rodada)) premio=2.5;
        if(semanaSemi.contains(rodada) || semanaFinal.contains(rodada)) premio=3.2;
      }
      if(myClass.internationalLeagueName == LeagueOfficialNames().resto){
        premio=1.5;
        if(semanaOitavas.contains(rodada) || semanaQuartas.contains(rodada)) premio=2;
        if(semanaSemi.contains(rodada) || semanaFinal.contains(rodada)) premio=3;
      }
    }

    if(globalMyLeagueLastResults.last==1){premio=(premio/2);}
    if(globalMyLeagueLastResults.last==0){premio=(premio/3);}

    globalMyMoney += premio * DificuldadeClass().getDificuldadeMultiplicationValue();

  }

  setHistoricGoalsLeagueMy(){
    if(Semana().isJogoCampeonatoNacional){
      List chaves = Chaves().obterChave(semana,myClass.campeonatoID);
      late int chavePos2;
      if (chaves.indexOf(myClass.posicaoChave) % 2 == 0) {
        chavePos2 = chaves[chaves.indexOf(myClass.posicaoChave) + 1];
      } else {
        chavePos2 = chaves[chaves.indexOf(myClass.posicaoChave) - 1];
      }
      List goalsList = List.filled(25, 0);
      int chavePos1 = myClass.posicaoChave;//minha chave
      goalsList[chavePos1]  =  meuGolMarcado;
      goalsList[chavePos2]  =  meuGolSofrido;
      //SALVA OS GOLS DO CAMPEONATO
      globalHistoricLeagueGoalsLastRodada[myClass.campeonatoID] = List.from(goalsList);
      //SALVA OS GOLS DO CAMPEONATO NA RODADA
      globalHistoricLeagueGoalsAll[rodada] = Map.from(globalHistoricLeagueGoalsLastRodada);
    }
  }
}