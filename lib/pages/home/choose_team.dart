import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/change_club_control.dart';
import 'package:fifa/classes/functions/func_number_clubs_total.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/database/select_database.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/configuration/controller/configuration_state.dart';
import 'package:fifa/pages/home/bottom_row_buttons.dart';
import 'package:fifa/pages/home/logo_kit_stack.dart';
import 'package:fifa/pages/negotiation/negotiation_class.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/decoration/box_shadow.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/widgets/loader.dart';
import 'package:flutter/material.dart';

import '../../classes/league.dart';
import '../menu/c_menu.dart';

class ChooseTeam extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const ChooseTeam({Key? key}) : super(key: key);
  @override
  _ChooseTeamState createState() => _ChooseTeamState();
}

class _ChooseTeamState extends State<ChooseTeam> {

  double buttonSize = 60;

  int posicao=0;
  int posicaoPais=0;

  late String leagueName;
  late int nLeagueTeams;
  late int clubID;
  late Club club;
  late int indexLeague;
  int indexJog = 0;

  bool loaded = false;

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }
  Map getCloneMap(Map data) {
    return data.map((k, v) => MapEntry(k, v is Map ? getCloneMap(v) : v));
  }
  doThisOnLaunch() async {

    //RESETA LISTA ORIGINAL A MOSTRAR CLUBES
    clubNameMap = getCloneMap(clubNameMapImmutable); //Mapa sem mudar mapa original

    ConfigurationState config = ConfigurationState();
    config.setLegends();

    //Pontos do treinador zera
    globalCoachPoints = 0;

    globalHistoricCoachResults = {};

    globalJogadoresCarrerMatchs = List.filled(globalMaxPlayersPermitted, 0);
    globalJogadoresCarrerGoals = List.filled(globalMaxPlayersPermitted, 0);
    globalJogadoresCarrerAssists = List.filled(globalMaxPlayersPermitted, 0);

    ano = anoInicial;
    setState(() {});
    await SelectDatabase().load();

    globalNumberClubsTotal = funcNumberClubsTotal(); //get number of total clubs

    Negotiation().resetNegotiatedPlayers();

    loaded = true;
    setState(() {});
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    if(posicaoPais >= leaguesListRealIndex.length) {
      posicaoPais = 0;
      posicao = 0;
    }
    indexLeague = leaguesListRealIndex[posicaoPais];
    League leagueClass = League(index: indexLeague);
    leagueName = leagueClass.name;
    clubID = leagueClass.getClubRealID(posicao);
    nLeagueTeams = leagueClass.nClubs;
    if(loaded) {
      club = Club(index: clubID);
    }

      return Scaffold(
          body:  Container(
            height: Sized(context).height,
            width: Sized(context).width,
            decoration: Images().getWallpaperContainerDecoration(),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  backButtonText(context,'Create new carrer'),

                  const SizedBox(height: 8),

                  title(),

                  const SizedBox(height: 8),

                  ////////////
                  //PAIS
                  ////////////
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors().greyTransparent,
                      boxShadow: boxShadowApp(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: leftButton(onTap: (){
                                if(posicaoPais>0) {
                                  posicaoPais --;
                                  posicao = 0;
                                }else{
                                  posicaoPais = leaguesListRealIndex.length-1;
                                  posicao = 0;
                                }
                              }),
                            ),

                            rightButton(
                                onTap: (){
                                  if(posicaoPais< leaguesListRealIndex.length-1) {
                                    posicaoPais ++;
                                    posicao = 0;
                                  }else{
                                    posicaoPais = 0;
                                    posicao = 0;
                                  }
                                }),
                          ],
                        ),


                        leagueLogoAndName(),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),
                  /////////////////////////////////////////
                  //TIME
                  /////////////////////////////////////////
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors().greyTransparent,
                      boxShadow: boxShadowApp(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        Column(
                          children: [

                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: leftButton(onTap: (){
                                if(posicao>0) {
                                  posicao --;
                                }else{
                                  posicao = nLeagueTeams-1;
                                }
                              }),
                            ),

                            rightButton(onTap: (){
                              if(posicao<nLeagueTeams-1) {
                                posicao ++;
                              }else{
                                posicao = 0;
                              }
                            }),

                          ],
                        ),

                        //ESCUDO E UNIFORME
                        loaded ? wHomeClubLogoAndKitStack(context, club) : SizedBox(
                          height: 200+40,
                          width: 200,
                        child:  loader()),

                      ],
                    ),
                  ),


                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: continueButton(),
                  ),
                  const SizedBox(height: 24),

                  HomeBottomRowButtons(
                      context: context, clubID: clubID,
                      refreshCallback: (){
                        setState((){});
                      }),


                ],
              ),
            ),
          ),
      );

  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget title(){
    return Stack(
      children: const [
        Text('FSIM 2024',style: EstiloRowdies.titleWhite),
        Padding(
          padding: EdgeInsets.only(left:2.0,top: 1),
          child: Text('FSIM 2024',style: EstiloRowdies.titleGreen),
        ),
      ],
    );
  }
  Widget rightButton({required Function onTap}){
    return Stack(
      children: [
        Image.asset('assets/icons/button_right.png',height: buttonSize,width: buttonSize),
        SizedBox(
          height: buttonSize,width: buttonSize,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonSize)),
              onTap: (){
                onTap();
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }
  Widget leftButton({required Function onTap}){
    return Stack(
      children: [
        Image.asset('assets/icons/button_left.png',height: buttonSize,width: buttonSize),
        SizedBox(
        height: buttonSize,width: buttonSize,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonSize)),
              onTap: (){
                onTap();
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }
  Widget leagueLogoAndName(){
    String leagueName = League(index: indexLeague).getName();
    return Column(
      children: [
        //LOGO CAMPEONATO
        Image.asset(FIFAImages().campeonatoLogo(leagueName),height: 160,width: 160),
        const SizedBox(height: 8),
        Text(leagueName,style:EstiloRajdhani.bold22),
      ],
    );
  }


Widget continueButton(){
    return
      customButtonContinue(
          title: Translation(context).text.continueButton,
          function: () {
            funcChangeClub(club.name,indexLeague);
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Menu()));
          }
      );
}



////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////


}