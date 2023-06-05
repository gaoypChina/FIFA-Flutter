import 'package:fifa/classes/coach/coach_best_results.dart';
import 'package:fifa/classes/functions/check_internet.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/match/adversario.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/result_game/result_game_nacional.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/simulate/simulate_functions.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/coach/coach_menu.dart';
import 'package:fifa/pages/cups/cup_main.dart';
import 'package:fifa/pages/historic/historic_menu.dart';
import 'package:fifa/pages/menu/widgets/header.dart';
import 'package:fifa/pages/menu/widgets/menu_button.dart';
import 'package:fifa/pages/menu/widgets/menu_classification.dart';
import 'package:fifa/pages/menu/widgets/play_button.dart';
import 'package:fifa/pages/menu/widgets/stadium_buttons.dart';
import 'package:fifa/pages/menu/test_button.dart';
import 'package:fifa/pages/ranking_clubs/ranking_clubs.dart';
import 'package:fifa/pages/simulacao/end_year.dart';
import 'package:fifa/pages/table/table_nacional.dart';
import 'package:fifa/pages/table_international/table_international.dart';
import 'package:fifa/pages/transfers/transfers.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/popup/popup_expectativa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../classes/club.dart';
import '../../classes/my.dart';
import '../club_profile/my_team.dart';

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
    adversario.getAdversario();
    Club club = Club(index: myClass.clubID);

    return Scaffold(
        body:  Stack(
            children: [

              Images().getWallpaper(),

              Container(
                height: Sized(context).height,
                width: Sized(context).width,
                decoration: BoxDecoration(
                    gradient:  LinearGradient(
                      colors: [club.colors.primaryColor.withOpacity(0.6), Colors.transparent, Colors.transparent],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.2, 0.5, 1],
                    )
                ),
                child: Column(
                  children: [

                    const SizedBox(height: 40),

                    wHomeHeader(context, myClass),

                    //BOTÕES
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [

                          wPlayButton(context, club, adversario, Semana(semana)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          expandedButton("Nacional",club, TableNacional(choosenLeagueIndex: myClass.leagueID)),
                          expandedButton(Translation(context).text.myClub,club, const MyTeam()),
                          ]),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                expandedButton(Translation(context).text.international,club, TableInternational(leagueInternational: myClass.getMyInternationalLeague())),

                                expandedButton(Translation(context).text.coach,club, const CoachMenu()),

                              ]),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                expandedButton("Copa",club, const CupMain()),
                                Expanded(
                                  child: wMenuButton(Translation(context).text.ranking,club,(){
                                    customToast(Translation(context).text.loading);
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RankingClubsPage()))
                                        .then((value) {setState(() {});});
                                  }),
                                ),
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                expandedButton(Translation(context).text.historic,club, const HistoricMenu()),
                                expandedButton(Translation(context).text.transfers,club, const Transfers()),
                              ]),


                        ]),
                    ),

                    //CALENDARIO E CLASSIFICAÇÃO

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        //wMenuCalendarIcon(context, semana, adversario),
                        //wLast5Matchs(context),
                        wMenuClassification(context, myClass),
                    ]),


                    //ESTÁDIO
                    const Spacer(),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                       //Image.asset(Images().getMyStadium(),height:  double.maxFinite, width: double.maxFinite,fit: BoxFit.fill,),

                        close(context),

                        test(context),

                        negotiationButton(context),

                        save(context),

                                //train(context)
                      ],
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
  Widget expandedButton(String title, Club club, Widget page){
    return Expanded(
      child: wMenuButton(title,club,(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => page))
            .then((value) {setState(() {});});
      }),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////
  simulateFunction() async{

    //SIMULA JOGOS
    Simulate().startVariables();
    await Simulate().simulateWeek(simulMyMatch: true);

    //**Só funciona se ja tiver simulado todos os outros jogos
    //TODO: SÓ CONTA RESULTADO DAS LIGAS NACIONAIS
    //Tem uma dependencia pelo ResultGameNacional
    if(Semana(semanasJogosNacionais[rodada-1]).isJogoCampeonatoNacional){
      int nRodadasMyLeague =  League(index: myClass.leagueID).nClubs-1;
      ResultGameNacional show = ResultGameNacional(
          rodadaLocal: rodada >= nRodadasMyLeague  ? nRodadasMyLeague : rodada,
          club: Club(index: myClass.clubID)
      );
      Confronto confronto = Confronto(
          clubName1: myClass.clubName,
          clubName2: adversario.clubName,
      );
      confronto.setGoals(goal1: show.gol1, goal2: show.gol2);
      CoachBestResults coachBestResults = CoachBestResults();
      coachBestResults.updateSequence(confronto);
    }

    customToast('Done');
    if(semana > globalUltimaSemana){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EndYear()));
    }else{
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Menu()));
    }

  }

  popupexpectativaCall(){
    if(semana == testInitRodada){
      popUpExpectativa(context: context);
    }
  }

}