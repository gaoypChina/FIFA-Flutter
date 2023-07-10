import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/international.dart';
import 'package:fifa/classes/international_league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/pages/table_international/table_brackets.dart';
import 'package:fifa/pages/table_international/table_international_scorers.dart';
import 'package:fifa/pages/table_international/table_mata_mata.dart';
import 'package:fifa/pages/table_international/table_matchs.dart';
import 'package:fifa/theme/decoration/my_team_gradient.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/background_image/backimage_international_league.dart';
import 'package:fifa/widgets/number_circle.dart';
import 'package:flutter/material.dart';

class TableInternational extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final String leagueInternational;
  const TableInternational({Key? key, required this.leagueInternational}) : super(key: key);
  @override
  _TableInternationalState createState() => _TableInternationalState();
}

class _TableInternationalState extends State<TableInternational>  with TickerProviderStateMixin {

  String leagueInternational = '';
  late TabController _tabController;
  List clubsID = [];

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    onStart();
    selectTeams();
    super.initState();
  }
  onStart(){
    _tabController = TabController(vsync: this, length: 5);

    leagueInternational = widget.leagueInternational;
    if(leagueInternational == LeagueOfficialNames().resto){
      leagueInternational = LeagueOfficialNames().championsLeague;
    }
  }
  selectTeams(){
    clubsID = [];
    //ANO INICIAL, COM TIMES DEMO
      if(semana<semanasJogosInternacionais[0] && ano==anoInicial || semanasJogosInternacionais[0]==1){
        clubsID = InternationalLeague().getClubs(leagueInternational);
      //SE JÁ TIVER OS CLUBES DO CAMPEONATO CONFIGURADO
      }else{
        clubsID = International(leagueInternational).getClassification();
        if(leagueInternational == LeagueOfficialNames().europaLeagueOficial ||
            leagueInternational == LeagueOfficialNames().copaSulAmericana){
          clubsID =  InternationalLeague().getClubs(leagueInternational);
        }
      }

  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 5,
      child: Scaffold(

          body:  Stack(
              children: [

                backgroundInternationalLeague(leagueInternational),

                Column(
                  children: [
                    const SizedBox(height: 30),

                    SizedBox(
                      height: 30,
                      child: TabBar(
                        isScrollable: true,
                        controller: _tabController,
                        indicatorColor: AppColors().green,
                        unselectedLabelColor: Colors.white54,
                        tabs: [
                          Tab(text: Translation(context).text.classification),
                          Tab(text: Translation(context).text.matchs),
                          const Tab(text: 'Brackets'),
                          Tab(text: Translation(context).text.knockoutStage),
                          Tab(text: Translation(context).text.topScorers),
                        ],
                      ),
                    ),

                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          groupStageTable(),
                          TableMatchs(leagueInternational: leagueInternational),
                          interBrackets(context, leagueInternational),
                          TableMataMata(leagueInternational: leagueInternational),
                          TableInternationalScorers(leagueInternational: leagueInternational),
                        ],
                      ),
                    ),


                    intleagueSelection(),

                ]),

          ]),
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget intleagueSelection(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        intLeagueImage(LeagueOfficialNames().championsLeague),
        intLeagueImage(LeagueOfficialNames().libertadores),
        intLeagueImage(LeagueOfficialNames().europaLeagueOficial),
        intLeagueImage(LeagueOfficialNames().copaSulAmericana),
      ],
    );
  }
  Widget intLeagueImage(String leagueIntImage){
    return GestureDetector(
      onTap: (){
        leagueInternational = leagueIntImage;
        selectTeams();
        setState((){});
      },
      child: Container(
          color: leagueInternational == leagueIntImage ? Colors.deepPurple : Colors.transparent,
          child: Image.asset(FIFAImages().campeonatoLogo(leagueIntImage), width: 50,height: 50)),
    );
  }
  Widget groupStageTable(){

    My my = My();

    return Container(
          color: AppColors().greyTransparent,
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                for (int groupNumber = 0; groupNumber < 8; groupNumber++)
                  for (int i = 0; i < 5; i++)
                    if (i == 0)
                      groupTitle(groupNumber)
                    else
                      groupRow(i,4*groupNumber+(i-1), my)
              ],
            ),
          ),
        );
  }

  Widget groupTitle(int groupNumber){
    String groupLetter = 'A';
    if(groupNumber==1){groupLetter='B';}
    if(groupNumber==2){groupLetter='C';}
    if(groupNumber==3){groupLetter='D';}
    if(groupNumber==4){groupLetter='E';}
    if(groupNumber==5){groupLetter='F';}
    if(groupNumber==6){groupLetter='G';}
    if(groupNumber==7){groupLetter='H';}
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(child: Text('${Translation(context).text.group} ' + groupLetter,style: EstiloTextoBranco.negrito16)),
          const Text('PTS ',style: EstiloTextoCinza.text16),
          const Text(' GM ',style: EstiloTextoCinza.text16),
          const Text(' GS ',style: EstiloTextoCinza.text16),
          const Text(' SG ',style: EstiloTextoCinza.text16),
          const Text('OVR ',style: EstiloTextoCinza.text16),
        ],
      ),
    );
  }
  Widget groupRow(int position, int index032, My my){

    int clubIndex = clubsID[index032];
    Club clubClass = Club(index: clubIndex, clubDetails: false);
    String clubName = clubClass.name;
    int points = clubClass.internationalPoints;
    int golsMarcados = clubClass.internationalGM;
    int golsSofridos = clubClass.internationalGS;
    int saldo = golsMarcados - golsSofridos;
    double overall = clubClass.getOverall();

    TextStyle textStyle = EstiloTextoBranco.text14;
    TextStyle textStyle2 = EstiloTextoBranco.text16;
    TextStyle textStyle3 = EstiloTextoBranco.negrito14;
    bool isMyClub = false;
    if(clubClass.name == my.clubName){
      isMyClub = true;
      textStyle = EstiloTextoVerdee.text14;
      textStyle2 = EstiloTextoVerdee.text16;
      textStyle3 = EstiloTextoVerdee.negrito14;
    }

    return  Container(
      decoration: isMyClub
          ? BoxDecoration(gradient: gradientMyTeam(true))
          : position==1 || position==2 ? BoxDecoration(gradient: gradientTeam(Colors.purple))
                                    : const BoxDecoration(),
      child: Row(
        children: [

          Stack(
            children: [
              Row(
                children: [
                  numberCircle(position, 30),
                  Images().getEscudoWidget(clubClass.name,26,26),
                  const SizedBox(width: 4),
                ],
              )
            ],
          ),
          const SizedBox(width: 4),
          GestureDetector(
            onTap: (){
              clickClubProfilePage(context,clubClass);
            },
            child: Container(
                width: 170,
                height: 28,
                padding: const EdgeInsets.all(4),
                margin: const EdgeInsets.all(1),
                child: Text(clubName, style: textStyle2)
            ),
          ),
          SizedBox(width: 30, child: Center(child: Text(points.toString(),style: textStyle3))),
          SizedBox(width: 30, child: Center(child: Text(golsMarcados.toString(),style: textStyle))),
          SizedBox(width: 30, child: Center(child: Text(golsSofridos.toString(),style: textStyle))),
          SizedBox(width: 30, child: Center(child: Text(saldo.toString(),style: textStyle))),
          Text(overall.toStringAsFixed(2),style: textStyle),

        ],
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////


}