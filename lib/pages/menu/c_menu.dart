import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/match/adversario.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/functions/check_internet.dart';
import 'package:fifa/classes/coach/coach_best_results.dart';
import 'package:fifa/classes/simulate/simulate_functions.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/page_controller/result_game.dart';
import 'package:fifa/pages/calendar.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/pages/coach/coach_menu.dart';
import 'package:fifa/pages/historic/historic_menu.dart';
import 'package:fifa/pages/menu/b_home.dart';
import 'package:fifa/pages/ranking_clubs.dart';
import 'package:fifa/pages/save/choose_save.dart';
import 'package:fifa/pages/simulacao/end_year.dart';
import 'package:fifa/pages/simulacao/not_play.dart';
import 'package:fifa/pages/table/statistics_league.dart';
import 'package:fifa/pages/table_international/table_international.dart';
import 'package:fifa/pages/table/table_nacional.dart';
import 'package:fifa/pages/transfers.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/popup/popup_expectativa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../classes/classification.dart';
import '../../classes/club.dart';
import '../../classes/geral/dificuldade.dart';
import '../../classes/my.dart';
import '../../theme/textstyle.dart';
import '../club_profile/my_team.dart';
import '../simulacao/play.dart';

class Menu extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Menu({Key? key}) : super(key: key);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  My myClass = My();
  Adversario adversario = Adversario();
////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }
  doThisOnLaunch() async{
    //POPUP DE EXPECTATIVA QUANDO COMEÇA NOVA TEMPORADA
    SchedulerBinding.instance.addPostFrameCallback((_) {
      popupexpectativaCall();
    });

    adversario.getAdversario();
    setState(() {});

    globalHasInternet = await funcCheckInternet();

    setState(() {});

  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    myClass = My();

    return Scaffold(
        body:  Stack(
            children: [

              Image.asset('assets/icons/wallpaper blue.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

              SizedBox(
                height: Sized(context).height,
                width: Sized(context).width,
                child: Column(
                  children: [

                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        //Escudo
                        Images().getMyEscudo(size: 90),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width:180,child: Text(myClass.clubName,textAlign: TextAlign.center,style: EstiloTextoBranco.negrito22)),
                            Text('${Translation(context).text.year}: '+ ano.toString() + ' ${Translation(context).text.week}: '+ semana.toString(),style: EstiloTextoBranco.negrito16),
                            const SizedBox(height: 8),
                            Text('${Translation(context).text.money}: \$'+ myClass.money.toStringAsFixed(2)+'mi',style: EstiloTextoBranco.text14),
                            Text('${Translation(context).text.clubOverall}: ' + Club(index: myClass.clubID).getOverall().toStringAsFixed(2),style: EstiloTextoBranco.text14),
                            Text('${Translation(context).text.clubValue}: \$' + myClass.getClubValue().toStringAsFixed(2)+'mi',style: EstiloTextoBranco.text14),
                            Text('${Translation(context).text.difficulty}: '+DificuldadeClass().getNameTranslated(context),style: EstiloTextoBranco.text14),
                          ],
                        ),

                        //UNIFORME
                        Images().getMyUniform(height: 100,width: 100),

                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          menuButton(Translation(context).text.play,(){
                            if(adversario.clubName.isNotEmpty){
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Play(adversarioClubID: adversario.clubID, visitante: adversario.visitante)));
                            }else{
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const NotPlay()));
                            }
                          }),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                            Expanded(
                              child: menuButton('Simular',() async{
                                //SIMULA JOGOS
                                Simulate().startVariables();
                                await Simulate().simulateWeek(simulMyMatch: true);

                                //**Só funciona se ja tiver simulado todos os outros jogos
                                //TODO: SÓ CONTA RESULTADO DAS LIGAS NACIONAIS
                                //Tem uma dependencia pelo ResultGameNacional
                                int nRodadasMyLeague =  League(index: myClass.leagueID).nClubs-1;
                                ResultGameNacional show = ResultGameNacional(
                                    rodadaLocal: rodada >= nRodadasMyLeague  ? nRodadasMyLeague-1 : rodada-1,
                                    club: Club(index: myClass.clubID)
                                );
                                Confronto confronto = Confronto(clubName1: myClass.clubName, clubName2: adversario.clubName, goal1: show.gol1, goal2: show.gol2);
                                CoachBestResults coachBestResults = CoachBestResults();
                                coachBestResults.updateSequence(confronto);

                                if(semana >= globalUltimaSemana){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EndYear()));
                                }else{
                                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Menu()));
                                }

                              }),
                          ),
                          Expanded(
                            child: menuButton(Translation(context).text.table,(){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TableNacional(choosenLeagueIndex: myClass.leagueID)));
                            }),
                          ),
                        ]),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Expanded(
                                  child: menuButton(Translation(context).text.international,(){
                                    //Mostra a competição internacional que o time está participando 1º
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TableInternational(leagueInternational: myClass.getMyInternationalLeague())));
                                  }),
                                ),
                                Expanded(
                                  child: menuButton(Translation(context).text.myClub,(){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyTeam()))
                                        .then((value) {setState(() {});});
                                  }),
                                ),

                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: menuButton(Translation(context).text.historic,(){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HistoricMenu()));
                                  }),
                                ),
                                Expanded(
                                  child: menuButton(Translation(context).text.ranking,(){
                                    customToast(Translation(context).text.loading);
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RankingClubs()))
                                        .then((value) {setState(() {});});
                                  }),
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: menuButton(Translation(context).text.coach,(){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CoachMenu()))
                                        .then((value) {setState(() {});});
                                  }
                                  ),
                                ),
                                Expanded(
                                  child: menuButton(Translation(context).text.transfers,(){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Transfers()))
                                        .then((value) {setState(() {});});
                                  }),
                                ),
                              ]),


                        ]),
                    ),


                    //CALENDARIO
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const Calendar()));
                          },
                          onLongPress: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: adversario.clubID)));
                          },
                          child: Stack(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top:8.0),
                                child: Opacity(opacity:0.3,child: Icon(Icons.calendar_month,size:100,color: Colors.white)),
                              ),
                              Column(
                                children: [
                                   Text(Translation(context).text.nextAdversary,style: EstiloTextoBranco.text14),
                                  //Escudo
                                  adversario.clubName.isNotEmpty ? Images().getEscudoWidget(adversario.clubName,50,50) : Container(),
                                  adversario.clubName.isNotEmpty ? Text(adversario.clubName,style: EstiloTextoBranco.negrito14) : Container(),
                                  adversario.clubName.isNotEmpty
                                      ? Semana(semana).isJogoMataMataInternacional
                                          ? Text(Semana(semana).semanaStr,style: EstiloTextoBranco.text14)
                                      : Text('${Translation(context).text.position}: '+adversario.posicao.toString()+'º',style: EstiloTextoBranco.text14)
                                      : Container(),
                                  adversario.clubName.isNotEmpty ? adversario.visitante
                                      ? Text(Translation(context).text.away,style: EstiloTextoBranco.text14)
                                      : Text(Translation(context).text.home,style: EstiloTextoBranco.text14) : Container(),

                                ],
                              ),
                            ],
                          ),
                        ),

                        //CLASSIFICAÇÃO E EXPECTATIVA
                        Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${Translation(context).text.expectation}: '+myClass.getLastYearExpectativa().toString()+'º',
                                    style: EstiloTextoBranco.text16
                                ),
                                classification3(),
                              ],
                            ),

                            last5Matchs(),
                          ],
                        ),


                    ]),

                    const SizedBox(height: 4),
                    //ESTÁDIO
                    Expanded(
                      child: Stack(
                        children: [

                          Image.asset(Images().getMyStadium(),height:  double.maxFinite, width: double.maxFinite,fit: BoxFit.fill,),

                          Container(
                            alignment: Alignment.bottomLeft,
                            child: GestureDetector(
                                onTap:(){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePage()));
                                },
                                child: const Icon(Icons.close,color:Colors.red,size: 50)
                            ),
                          ),

                          //CAMPEONATO
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            alignment: Alignment.topRight,
                            child: Images().getMyActualCampeonatoLogo().isNotEmpty
                                ? Image.asset(Images().getMyActualCampeonatoLogo(),height: 60,width: 60)
                                : const SizedBox(height: 60,width: 60),
                          ),

                            //SAVE
                            Container(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                  onTap:(){
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => const ChooseSave()));
                                  },
                                  child: const Icon(Icons.save,color:Colors.white,size: 50)
                              ),
                          ),

                          //TEST FUNCTIONS BUTTON
                          testInitRodada == 1 ? Container(
                            alignment: Alignment.topCenter,
                            child: GestureDetector(
                                onTap:(){
                                  customToast('TESTE DE FUNÇÃO');
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => StatisticsLeague(league: League(index: 1),)));
                                },
                                child: const Icon(Icons.terminal_sharp,color:Colors.white,size: 50)
                            ),
                          ) : Container(),

                        ],
                      ),
                    ),



                  ],
                ),
              ),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget menuButton(String text, Function() function){
  return  Container(
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: AppColors().greyTransparent,
      border: Border.all(
      width: 2.0,
      color: Colors.green,
    ),
    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: function,
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.text22))),
    ),
  );
}

Widget classification3(){

  List classificationList = Classification(leagueIndex: myClass.leagueID).classificationClubsIndexes;
  int myPosition = classificationList.indexOf(myClass.clubID);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for(int i=-2;i<2;i++)
       myPosition+i+1 > 0 && myPosition+i < classificationList.length
          ? rowClassification(myPosition+i+1,Club(index: classificationList[myPosition+i]))
          : Container(),
    ],
  );
}
Widget rowClassification(int position, Club club, ){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        myClass.getLastYearExpectativa() == position-1
            ? const Text('............................................................................................',style: EstiloTextoBranco.negrito6)
            : Container(),
        Row(
          children: [
            SizedBox(width:25,child: Text(position.toString()+'º',style: EstiloTextoBranco.text14)),
            SizedBox(width:22,child: Center(child: Text(club.leaguePoints.toString(),style: EstiloTextoBranco.negrito14))),
            Images().getEscudoWidget(club.name,18,18),
            Container(
                width:100,
                color: club.name == myClass.clubName ? Colors.teal : Colors.transparent,
                child: Text(club.name,style: EstiloTextoBranco.text12,)),
          ],
        ),
      ],
    );
}

Widget last5Matchs(){
    return SizedBox(
      height: 25,
      width: 120,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (c,i)=>resultBox(i)),
    );
}
  Widget resultBox(int i){
      Color color = Colors.transparent;
      int nRodadasMyLeague =  League(index: myClass.leagueID).nClubs-1;
      ResultGameNacional show = ResultGameNacional(
          rodadaLocal: rodada >= nRodadasMyLeague  ? nRodadasMyLeague-i : rodada-1-i,
          club: Club(index: myClass.clubID)
      );
      if(show.victoryDrawLoss310 == 3){color = Colors.green;}
      if(show.victoryDrawLoss310 == 1){color = Colors.yellow;}
      if(show.victoryDrawLoss310 == 0){color = Colors.red;}
      if(show.exists){
        return GestureDetector(
          onTap:(){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ClubProfile(clubID: show.clubID2)));
          },
          child: Container(
            height:20,
            width: 20,
            margin: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Center(child: Images().getEscudoWidget(show.clubName2,15,15)),
          ),
        );
      }else{
        return Container();
      }
  }
////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////
  popupexpectativaCall(){
    if(semana == testInitRodada){
      popUpExpectativa(context: context);
    }
  }

}