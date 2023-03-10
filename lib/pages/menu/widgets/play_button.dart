import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/coach/coach_best_results.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/match/adversario.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/result_game/result_game_nacional.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/simulate/simulate_functions.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/pages/menu/c_menu.dart';
import 'package:fifa/pages/simulacao/end_year.dart';
import 'package:fifa/pages/simulacao/not_play.dart';
import 'package:fifa/pages/simulacao/play.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';

import '../../calendar/calendar.dart';

Widget wPlayButton(BuildContext context, Club club, Adversario adversario, Semana week, Function() function){
  return Container(
    margin: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      border: Border.all(
        width: 2.0,
        color: club.colors.secondColor,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: function,
          child: Stack(
            children: [

              backgroundStadium(context, adversario.visitante ? adversario.clubName : club.name),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      children: [
                        Images().getMyActualCampeonatoLogo().isNotEmpty
                            ? Image.asset(Images().getMyActualCampeonatoLogo(),height: 80,width: 80)
                            : const SizedBox(height: 80,width: 80),


                        insideButton("Simular", club, ()async{
                          await simulateFunction(adversario, My());
                          if(semana > globalUltimaSemana){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EndYear()));
                          }else{
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Menu()));
                          }
                        }),

                      ],
                    ),
                    //DESCRIPTION
                    Column(
                      children: [

                        Container(
                          color: AppColors().greyTransparent,
                          padding:  const EdgeInsets.all(4),
                          child: Column(
                            children: [
                              Text(week.semanaCalendarStr.toString(),style: EstiloTextoBranco.negrito18),
                              adversario.clubName.isNotEmpty ? Text(adversario.clubName,style: EstiloTextoBranco.negrito14) : Container(),
                              adversario.clubName.isNotEmpty
                                  ? week.isJogoMataMataInternacional
                                  ? Text(week.semanaStr,style: EstiloTextoBranco.text14)
                                  : Text('${Translation(context).text.position}: '+adversario.posicao.toString()+'º',style: EstiloTextoBranco.text14)
                                  : Container(),
                              adversario.clubName.isNotEmpty ? adversario.visitante
                                  ? Text(Translation(context).text.away,style: EstiloTextoBranco.text14)
                                  : Text(Translation(context).text.home,style: EstiloTextoBranco.text14) : Container(),
                              adversario.clubName.isNotEmpty ? Container() : Container(height:30),
                            ],
                          ),
                        ),

                        GestureDetector(
                          onTap: (){
                            customToast("Abrindo Calendário");
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const Calendar()));
                          },
                          child: const Opacity(opacity:0.8,child: Icon(Icons.calendar_month,size:80,color: Colors.white)),
                        ),


                      ],
                    ),

                    //IMAGE
                    Column(
                      children: [
                        adversario.clubName.isNotEmpty
                            ? GestureDetector(onTap:(){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: adversario.clubID)));
                            },child: Images().getEscudoWidget(adversario.clubName,80,80))
                            : const SizedBox(height: 80),

                        insideButton("Play", club, (){
                          if(adversario.clubName.isNotEmpty){
                            navigatorReplace(context, Play(
                                adversarioClubID: adversario.clubID,
                                visitante: adversario.visitante,
                                isSingleMatch: false
                            ));
                          }else{
                            navigatorReplace(context, const NotPlay());
                          }
                        }),

                      ],
                    ),



                  ],
                ),
              ),

            ],
          )),
    ),
  );
}

Widget insideButton(String title, Club club, Function() function){
  return                   GestureDetector(
    onTap: (){
      function();
    },
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: club.colors.primaryColor.withOpacity(0.6),
        border: Border.all(
          width: 1.0,
          color: club.colors.secondColor,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Text(title,textAlign:TextAlign.center,style: EstiloTextoBranco.text20),
    ),
  );
}


Widget backgroundStadium(BuildContext context, String clubName){
  return               SizedBox(
    width: Sized(context).width*0.99,
    height: 170,
    child: Center(
      child: SizedBox(
        height: 170,width: Sized(context).width*0.99,
        child: Opacity(
          opacity: 0.6,
          child: AspectRatio(
            aspectRatio: 350 / 451,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: FractionalOffset.center,
                    image: AssetImage(Images().getStadium(clubName)),
                  )
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

simulateFunction(Adversario adversario, My myClass) async{

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
        goal1: show.gol1,
        goal2: show.gol2
    );
    CoachBestResults coachBestResults = CoachBestResults();
    coachBestResults.updateSequence(confronto);
  }

  customToast('Done');

}