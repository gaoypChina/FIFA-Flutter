import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/coach/coach_best_results.dart';
import 'package:fifa/classes/mata_mata/cup_classification.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/match/adversario.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/result_game/result_match.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/simulate/simulate_functions.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/calendar/calendar_adv_box.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/pages/menu/c_menu.dart';
import 'package:fifa/pages/simulacao/end_year.dart';
import 'package:fifa/pages/simulacao/not_play.dart';
import 'package:fifa/pages/simulacao/pre_match.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/leagues_prize.dart';
import 'package:flutter/material.dart';

Widget wPlayButton(BuildContext context, Club club, Adversario adversario, Semana week){

  String positionText = "";
  if(adversario.clubName.isNotEmpty && week.isJogoCampeonatoNacional){
    positionText = '${Translation(context).text.position}: '+adversario.posicao.toString()+'º';
  }else if(adversario.clubName.isNotEmpty && week.isJogoMataMataInternacional){
    positionText = week.semanaStr;
  } else if(week.isJogoCopa){
    String phaseName = CupClassification().getPhaseKeyName(week.week);
    positionText = CupClassification().getIdaOrVoltaKey(phaseName, week.week);
  }

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
          onTap: (){
            playFunction(context, adversario);
          },
          child: Stack(
            children: [

              backgroundStadium(context, adversario.visitante ? adversario.clubName : club.name),

              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      children: [
                        Images().getMyActualCampeonatoLogo().isNotEmpty
                            ? Image.asset(Images().getMyActualCampeonatoLogo(),height: 80,width: 80)
                            : const SizedBox(height: 80,width: 80),

                        const SizedBox(height: 10),
                        insideButton("Simular", club, ()async{
                          await simulateFunction(context, adversario, My());
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
                          width: Sized(context).width*0.36,
                          padding:  const EdgeInsets.all(4),
                          child: Column(
                            children: [
                              Text(week.semanaCalendarStr.toString(),style: EstiloTextoBranco.negrito18),
                              adversario.clubName.isNotEmpty ? Text(adversario.clubName,style: EstiloTextoBranco.negrito14) : Container(),
                              Text(positionText,style: EstiloTextoBranco.text14),
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
                            Navigator.push(context,MaterialPageRoute(builder: (context) => CalendarPage(club: club)));
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

                        const SizedBox(height: 10),
                        insideButton("Play", club, (){
                          playFunction(context, adversario);
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
      child: Text(title,textAlign:TextAlign.center,style: EstiloRajdhani.menubuttons),
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
                    fit: BoxFit.fill,
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

playFunction(BuildContext context,Adversario adversario){
  if(adversario.clubName.isNotEmpty){
    navigatorReplace(context, PreMatch(adversarioClubID: adversario.clubID, visitante: adversario.visitante, isSingleMatch: false));
  }else{
    navigatorReplace(context, const NotPlay());
  }
}

Future simulateManyWeeksFunction(BuildContext context, int semanaLocal) async{
  for(int i=semana; i<=semanaLocal; i++){
    Adversario adversario = Adversario();
    adversario.getAdversario();
    await simulateFunction(context, adversario, My());
  }
}

Future simulateFunction(BuildContext context, Adversario adversario, My myClass) async{

  //SIMULA JOGOS
  Simulate().startVariables();
  await Simulate().simulateWeek(simulMyMatch: true);

  ResultMatch resultMatch = ResultMatch();
  resultMatch.getWeekResult(Semana(semana-1), Club(index: myClass.clubID));
  if(resultMatch.isAlreadyPlayed) {
    Confronto confronto = Confronto(clubName1: resultMatch.clubName1, clubName2: resultMatch.clubName2);
    confronto.setGoals(goal1: resultMatch.goal1, goal2: resultMatch.goal2);

    customToast("${confronto.clubName1} ${confronto.goal1} x ${confronto.goal2} ${confronto.clubName2}");

    premiacao(My(), confronto);

    CoachBestResults coachBestResults = CoachBestResults();
    coachBestResults.updateSequence(confronto);

  }else{
    customToast("Simulating matchs");
  }


}