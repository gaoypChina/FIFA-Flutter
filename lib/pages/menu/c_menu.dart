import 'package:fifa/classes/adversario.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/functions/check_internet.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/page_controller/calendar_control.dart';
import 'package:fifa/pages/calendar.dart';
import 'package:fifa/pages/coach/coach_menu.dart';
import 'package:fifa/pages/historic/historic_menu.dart';
import 'package:fifa/pages/menu/b_home.dart';
import 'package:fifa/pages/ranking_clubs.dart';
import 'package:fifa/pages/save/choose_save.dart';
import 'package:fifa/pages/simulacao/not_play.dart';
import 'package:fifa/pages/table/table_international.dart';
import 'package:fifa/pages/table/table_nacional.dart';
import 'package:fifa/pages/transfers.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../classes/classification.dart';
import '../../classes/club.dart';
import '../../classes/geral/dificuldade.dart';
import '../../classes/my.dart';
import '../../popup/popup_expectativa.dart';
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

    globalHasInternet = await funcCheckInternet();

    adversario.getAdversario();

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

              Column(
                children: [

                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      //Escudo
                      Image.asset(Images().getMyEscudo(),height: 90,width: 90),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width:180,child: Text(myClass.clubName,textAlign: TextAlign.center,style: EstiloTextoBranco.negrito22)),
                          Text('${Translation(context).text.year}: '+ ano.toString(),style: EstiloTextoBranco.text14),
                          Text('${Translation(context).text.week}: '+ semana.toString(),style: EstiloTextoBranco.text14),
                          Text('${Translation(context).text.money}: \$'+ myClass.money.toStringAsFixed(2)+'mi',style: EstiloTextoBranco.text14),
                          Text('${Translation(context).text.clubOverall}: ' + Club(index: myClass.clubID).getOverall().toStringAsFixed(2),style: EstiloTextoBranco.text14),
                          Text('${Translation(context).text.clubValue}: \$' + myClass.getClubValue().toStringAsFixed(2)+'mi',style: EstiloTextoBranco.text14),
                        ],
                      ),

                      //UNIFORME
                      Image.asset(Images().getMyUniform(),height: 100,width: 100),

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
                        menuButton(Translation(context).text.table,(){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TableNacional()));
                        }),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              Expanded(
                                child: menuButton(Translation(context).text.international,(){
                                  //Mostra a competição internacional que o time está participando 1º
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => TableInternational(leagueInternational: My().getMyInternationalLeague())));
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
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CoachMenu()));
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


                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => const Calendar()));
                        },
                        child: Column(
                          children: [
                             Text(Translation(context).text.nextAdversary,style: EstiloTextoBranco.text14),
                            //Escudo
                            adversario.clubName.isNotEmpty ? Image.asset(Images().getEscudo(adversario.clubName),height: 50,width: 50) : Container(),
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
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('${Translation(context).text.matchWeek}: '+rodada.toString(),style: EstiloTextoBranco.text16),
                          Text(Translation(context).text.classification,style: EstiloTextoBranco.text14),
                          Text(Classification(leagueIndex: myClass.campeonatoID).getClubPosition(myClass.clubID).toString()+'º',style: EstiloTextoBranco.text30),
                          Text('${Translation(context).text.expectation}: '+myClass.getLastYearExpectativa().toString()+'º',style: EstiloTextoBranco.text14),
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

                        //DIFICULDADE
                        Container(
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.only(bottom:4),
                          child: GestureDetector(
                              onTap:(){
                              },
                              child: Text('${Translation(context).text.difficulty}: '+DificuldadeClass().getNameTranslated(context),style: EstiloTextoBranco.text12),
                          ),
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

                      ],
                    ),
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
Widget menuButton(String text, Function() function){
  return  InkWell(
    onTap: function,
    child: Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors().greyTransparent,
        border: Border.all(
        width: 2.0,
        color: Colors.green,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.text22),
    ),
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
      ResultGameNacional show = ResultGameNacional(rodadaLocal: rodada-i-1, clubID: myClass.clubID);
      if(show.victoryDrawLoss310 == 3){color = Colors.green;}
      if(show.victoryDrawLoss310 == 1){color = Colors.yellow;}
      if(show.victoryDrawLoss310 == 0){color = Colors.red;}
      if(show.exists){
        return Container(
          height:20,
          width: 20,
          margin: const EdgeInsets.all(2),
          color: color,
          child: Center(child: Image.asset(Images().getEscudo(show.clubName2),width: 15,height: 15,)),
        );
      }else{
        return Container();
      }
  }
////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////
  popupexpectativaCall(){
    if(rodada == testInitRodada){
      popUpExpectativa(context: context);
    }
  }

}