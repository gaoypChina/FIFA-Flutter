import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/pages/club_profile/my_team.dart';
import 'package:fifa/pages/simulacao/play.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/background_image/backimage_international_league.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:fifa/widgets/player_templates/player_field.dart';
import 'package:flutter/material.dart';

class PreMatch extends StatefulWidget {
  final int adversarioClubID;
  final bool visitante;
  final bool isSingleMatch;
  const PreMatch({Key? key,required this.adversarioClubID, required this.visitante, required this.isSingleMatch}) : super(key: key);

  @override
  State<PreMatch> createState() => _PreMatchState();
}

class _PreMatchState extends State<PreMatch> {

  bool visitante = false;
  My myClass = My();
  late Club myClubClass;

  late Club adversarioClubClass;

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    myClubClass = Club(index: myClass.clubID);
    adversarioClubClass = Club(index: widget.adversarioClubID);
    super.initState();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    My my = My();

    return Scaffold(
      body: Stack(
        children: [

          backgroundTournament(Semana(semana),myClass),

          Column(
            children: [

              backButtonText(context,'Pre Match'),

              header(),

              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: 695,
                    child: Stack(
                      children: [

                        Image.asset('assets/icons/campo.png',height:double.infinity,width:double.infinity,fit:BoxFit.fill),

                        Column(
                          children: [
                            const SizedBox(height: 16),
                            fieldWidgetSelection(context, my.jogadores, my, true),
                            const SizedBox(height: 32),
                            fieldWidgetSelection(context, adversarioClubClass.escalacao, my, false),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              substitutions(),

              customButtonContinue(
                title: Translation(context).text.play,
                function: () {
                  navigatorReplace(context, Play(
                      adversarioClubID: widget.adversarioClubID,
                      visitante: widget.visitante,
                      isSingleMatch: widget.isSingleMatch,
                  ));
                },
              ),

            ],
          ),


        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget header(){

    String textRodada = getTextRodada(context, myClass.leagueID);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors().greyTransparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Escudo time 1
            Images().getEscudoWidget(myClubClass.name,80,80),

            Column(
              children: [
                Images().getWeekCompetitionLogo(My()),
                Text(textRodada,style: EstiloTextoBranco.text16),
              ],
            ),

            //Escudo time 2
            GestureDetector(
                onTap:(){
                  navigatorPush(context, ClubProfile(clubID: adversarioClubClass.index));
              },child: Images().getEscudoWidget(adversarioClubClass.name,80,80)),

          ],
        ),
      ),
    );
  }


  Widget substitutions(){
    return Container(
      margin: const EdgeInsets.all(4),
      child: PressableButton(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyTeam())).then((value) => (){
              setState((){});
              print("update");
            });
            setState((){});
            myClubClass = Club(index: myClass.clubID);
          },
          child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: const BorderRadius.all(
                Radius.circular(4.0) //                 <--- border radius here
            ),
            border:  Border.all(color: AppColors().green, width:1),
          ),child: const Text("Substituições", style: EstiloTextoBranco.text16)
          ),
      ),
    );
  }



}




String getTextRodada(BuildContext context, int leagueID){
  String textRodada = '';
  Semana weekClass = Semana(semana);

  if(weekClass.isJogoCampeonatoNacional) {
    textRodada = '${Translation(context).text.matchWeek} ' + rodada.toString() + '/' + (League(index: leagueID).getNTeams()-1).toString();
  }else{
    textRodada = Name().groupsPhase;
    if(weekClass.isJogoGruposInternacional){textRodada += ' ${weekClass.rodadaGroupInternational}'; }
    else{
      textRodada = weekClass.semanaStr;
    }
  }
  return textRodada;
}