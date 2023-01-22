import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/international.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/match/goal_my_match.dart';
import 'package:fifa/classes/match/match.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/tabela_national.dart';
import 'package:fifa/classes/table_matchs_control.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/menu/c_menu.dart';
import 'package:fifa/pages/simulacao/not_play_international/not_play_international_matamata.dart';
import 'package:fifa/theme/background/background_position.dart';
import 'package:fifa/theme/background/color_grade.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/best_player_box/best_player_box.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:flutter/material.dart';

class PlayerGrade{
  late int id;
  late String name;
  late double grade;
  PlayerGrade({required this.id,required this.name, required this.grade});
}

class AfterPlay extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final int adversarioClubID;
  final int gol1;
  final int gol2;
  final bool visitante;
  const AfterPlay({Key? key, required this.adversarioClubID, required this.visitante, required this.gol1, required this.gol2}) : super(key: key);

  @override
  State<AfterPlay> createState() => _AfterPlayState();
}

class _AfterPlayState extends State<AfterPlay> with TickerProviderStateMixin {

  String name1 = '';
  String name2 = '';
  My myClass = My();
  late PlayerGrade playerGrade;
  Club myClubClass = Club(index: My().clubID);
  late Club adversarioClubClass;
  late League leagueClass;
  late TabController _tabController;

  ///////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    onInit();
    bestPlayer();
    super.initState();
  }
  onInit(){
    adversarioClubClass = Club(index: widget.adversarioClubID);
    if(widget.visitante){
      name2 = myClass.clubName;
      name1 = adversarioClubClass.name;
    }else{
      name1 = myClass.clubName;
      name2 = adversarioClubClass.name;
    }
    leagueClass = League(index: myClass.campeonatoID);
  }
  bestPlayer(){
    int bestPlayerID = 0;
    double highestGrade = 0;
    for(int playerID in myClubClass.escalacao){
      if(Match(playerID: playerID).grade > highestGrade){
        highestGrade = Match(playerID: playerID).grade;
        bestPlayerID = playerID;
      }
    }
    for(int playerID in adversarioClubClass.escalacao){
      if(Match(playerID: playerID).grade > highestGrade){
        highestGrade = Match(playerID: playerID).grade;
        bestPlayerID = playerID;
      }
    }
    playerGrade = PlayerGrade(id: bestPlayerID,name: Jogador(index: bestPlayerID).name,grade: highestGrade);
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
      length: 2,
      child: Scaffold(
        body: Stack(
          children: [
            Images().getWallpaper(),

            Column(
              children: [

                const SizedBox(height: 30),
                header(),

                SizedBox(
                  height: 30,
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors().primary,
                    tabs: [
                      Tab(text: Translation(context).text.timeline),
                      Tab(text: Translation(context).text.players),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      goalsWidget(),
                      playerStatistics(),
                    ],
                  ),
                ),
                Row(
                  children: [
                    bestPlayerBox('Melhor Jogador', Jogador(index: playerGrade.id),playerGrade.grade.toStringAsFixed(1)),
                    Expanded(child: classification()),
                  ],
                ),

                Semana(semana).isJogoCampeonatoNacional
                    ? weekMatchs()
                    : Semana(semana).isJogoGruposInternacional
                      ? tableWidget()
                      : tableWidgetMataMata(),

                customButtonContinue(
                  title: Translation(context).text.nextMatchWeek,
                  function: (){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Menu()));
                  },
                ),

              ],
            ),


          ],
        ),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget header(){
    String textRodada = '';
    Semana semanaClass = Semana(semana);
    if(semanaClass.isJogoCampeonatoNacional) {
      textRodada = '${Translation(context).text.matchWeek} ' + (rodada-1).toString() + '/' + (League(index: myClass.campeonatoID).getNTeams()-1).toString();
    }else{
      textRodada = Name().groupsPhase;
      if(semanaClass.isJogoGruposInternacional){textRodada += ' ${semanaClass.rodadaGroupInternational}'; }
      else if(semanaClass.isJogoMataMataInternacional){
        textRodada = semanaClass.semanaStr;
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //Escudo time 1
        Images().getEscudoWidget(name1,80,80),

        Column(
          children: [
            Semana(semana).isJogoCampeonatoNacional
                ? Image.asset(FIFAImages().campeonatoLogo(myClubClass.leagueName),height: 30,width: 30)
                : Image.asset(FIFAImages().campeonatoLogo(myClubClass.internationalLeagueName),height: 35,width: 35),
            Text(textRodada,style: EstiloTextoBranco.text16),
            widget.visitante
                ? Text(widget.gol2.toString() +'X'+ widget.gol1.toString() ,style: EstiloTextoBranco.text30)
                : Text(widget.gol1.toString()  +'X'+ widget.gol2.toString() ,style: EstiloTextoBranco.text30),
          ],
        ),

        //Escudo time 2
        Images().getEscudoWidget(name2,80,80),

      ],
    );
  }

Widget goalsWidget(){
  List<GoalMyMatch> goals = [];
  List<GoalMyMatch> goals1 = [];
  List<GoalMyMatch> goals2 = [];
  for(int i=0; i < widget.gol1;i++){
    if(!widget.visitante){
      GoalMyMatch goal1 = GoalMyMatch();
      goal1.getMyGoal(i);
      goals1.add(goal1);
    }else{
      GoalMyMatch goal2 = GoalMyMatch();
      goal2.getMyGoal(i);
      goals2.add(goal2);
    }
  }
  for(int i=0; i< widget.gol2;i++){
    if(widget.visitante){
      GoalMyMatch goal1 = GoalMyMatch();
      goal1.getAdvGoal(i);
      goals1.add(goal1);
    }else{
      GoalMyMatch goal2 = GoalMyMatch();
      goal2.getAdvGoal(i);
      goals2.add(goal2);
    }
  }

  goals = goals1+goals2;
  goals.sort((a, b) => a.minute.compareTo(b.minute));

    return
        Column(
          children: [
            for(int i=0; i<goals.length;i++)
              goalRow(goals[i], goals2.contains(goals[i])),
          ],
        );
}

Widget goalRow(GoalMyMatch goalMyMatch, bool visitante){
    double paddingSize = 6;
  return
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        visitante ? Container(width: Sized(context).width*0.50-1) : Container(),
        visitante ? Container(width: 1,height:18,color: Colors.white): Container(),
        Container(padding: EdgeInsets.only(left: paddingSize)),
        Image.asset('assets/icons/bola.png',height:15,width: 15),
        Text(goalMyMatch.minute.toString()+'\'  ',style: EstiloTextoBranco.text14),
        SizedBox(width:135,
            child: Text(goalMyMatch.playerName,overflow: TextOverflow.ellipsis,style: EstiloTextoBranco.text14),
          ),
          const Spacer(),
          !visitante ? Container(width: 1,height:18,color: Colors.white): Container(),
          !visitante ? Container(width: Sized(context).width*0.5) : Container(),
      ],
    );
}

  Widget playerStatistics(){
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              for(int i=0;i<11;i++)
                playerRow(Jogador(index: !widget.visitante ? myClubClass.escalacao[i] : adversarioClubClass.escalacao[i])),
            ],
          ),

          Column(
            children: [
              for(int i=0;i<11;i++)
                playerRow(Jogador(index: widget.visitante ? myClubClass.escalacao[i] : adversarioClubClass.escalacao[i])),
            ],
          ),
        ],
      ),
    );
  }
  Widget playerRow(Jogador player){
    Match match = Match(playerID: player.index);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
            const SizedBox(width: 2),
            positionContainer(player.position),
            Images().getPlayerPictureWidget(player,25,25),
            SizedBox(width:100,child: Text(player.name,style: EstiloTextoBranco.text12)),
            const SizedBox(width: 4),
            Container(
                height:18,width:25,color:colorAgeBackground(match.grade.floorToDouble()),
                child: Center(child: Text(match.grade.toStringAsFixed(1),style: EstiloTextoPreto.text12))),
        ],
      ),
    );
  }
  Widget classification(){
      return Container(
        height: 5*36,
        color: AppColors().greyTransparent,
        margin: const EdgeInsets.all(4),
        child: Column(
          children: [
            const Text('Classificação',style: EstiloTextoBranco.negrito16),
            //TITLE
            Row(
              children: [
                Container(width:30),
                const Expanded(child: Text('Nome',style:EstiloTextoBranco.text14)),
                const SizedBox(width:30,child: Text('PTS',style:EstiloTextoBranco.text14)),
                const SizedBox(width:25,child: Text('GM',style:EstiloTextoBranco.text14)),
                const SizedBox(width:25,child: Text('GS',style:EstiloTextoBranco.text14)),
                const SizedBox(width:30,child: Text('OVR',style:EstiloTextoBranco.text14)),
                const SizedBox(width:10)
              ],
            ),

            classificationBox(),

          ],
        ),
      );
    }

  Widget classificationBox(){
    List classificationClubsIndexes = [];
    if(Semana(rodada).isJogoCampeonatoNacional){
      classificationClubsIndexes = Classification(leagueIndex: myClass.getLeagueID()).classificationClubsIndexes;
    }else{
      List classificationClubsIndexesAll = International(myClubClass.internationalLeagueName).getClassification();
      int index = myClass.getMyClubInternationalGroup()*4;
      classificationClubsIndexes = [
        classificationClubsIndexesAll[index],
        classificationClubsIndexesAll[index+1],
        classificationClubsIndexesAll[index+2],
        classificationClubsIndexesAll[index+3]
      ];
    }

    return             //CONTENT
      Container(
        height: 5*25,
        margin: const EdgeInsets.all(4),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: classificationClubsIndexes.length,
            itemBuilder: (c,i)=>classificationRow(i,classificationClubsIndexes[i])
        ),
      );
  }

  Widget classificationRow(int position, int indexClub){
    Club clubClass = Club(index: indexClub);

    return Row(
      children: [
        SizedBox(width:25,child: Text((position+1).toString()+'º',style:EstiloTextoBranco.text14)),
        Images().getEscudoWidget(clubClass.name,25,25),
        Expanded(
            child: Container(color:(clubClass.name==myClass.clubName) ? Colors.purple : Colors.transparent,
            padding:const EdgeInsets.all(1),
            child: Text(clubClass.name,style:EstiloTextoBranco.text12))),
        SizedBox(width:25,
            child: Text(Semana(rodada).isJogoCampeonatoNacional
                ? clubClass.leaguePoints.toString()
                : clubClass.internationalPoints.toString()
                ,style:EstiloTextoBranco.text14)),
        SizedBox(width:25,
            child: Text(Semana(rodada).isJogoCampeonatoNacional
                ? clubClass.leagueGM.toString()
                : clubClass.internationalGM.toString(),style:EstiloTextoBranco.text14)),
        SizedBox(width:25,
            child: Text(Semana(rodada).isJogoCampeonatoNacional
                ? clubClass.leagueGS.toString()
                : clubClass.internationalGS.toString(),style:EstiloTextoBranco.text14)),
        SizedBox(width:40,child: Text(clubClass.getOverall().toStringAsFixed(2),style:EstiloTextoBranco.text14)),
      ],
    );
  }

  Widget weekMatchs(){
    int nteamsLeague = leagueClass.getNTeams();

    return Container(
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.all(4),
      child: Column(
        children: [
          Text('Rodada '+(rodada-1).toString(),style: EstiloTextoBranco.negrito16),
              Container(
                height: 5*30,
                margin: const EdgeInsets.all(4),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: (nteamsLeague/2).round(),
                    itemBuilder: (c,i)=>weekMatchRow(i*2)
                ),
              ),
        ],
      ),
    );
  }
  Widget weekMatchRow(int numeroDoConfronto){

    TableNational tableNational = TableNational(
        choosenLeagueIndex: myClass.campeonatoID,
        leagueClass: leagueClass,
        rodadaMatch: rodada-1,
        numeroDoConfronto: numeroDoConfronto
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    padding: const EdgeInsets.all(1),
                    color:(myClass.clubName == tableNational.teamName1) ?Colors.purple:Colors.transparent,
                    child: Text(tableNational.teamName1,style:EstiloTextoBranco.text14)),
                Images().getEscudoWidget(tableNational.teamName1,25,25),
                Text(tableNational.gol1.toString(),style:EstiloTextoBranco.text14),
              ],
            ),
          ),

          const SizedBox(width:15, child: Text('x',textAlign:TextAlign.center,style:EstiloTextoBranco.text14)),

          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(tableNational.gol2.toString(),style:EstiloTextoBranco.text14),
                Images().getEscudoWidget(tableNational.teamName2,25,25),
                Container(
                    padding: const EdgeInsets.all(1),
                    color:(myClass.clubName == tableNational.teamName2) ?Colors.purple:Colors.transparent,
                    child: Text(tableNational.teamName2,style:EstiloTextoBranco.text14)),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget tableWidget() {
    return Container(
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.all(4),
      height: 5*30,
      child: SingleChildScrollView(
        child: Column(
          children: [

            for (int groupNumber = 0; groupNumber < 8; groupNumber++)
              for (int nConfronto = -1; nConfronto < 2; nConfronto++) //Tem linha com título
                Table(
                  columnWidths: const{0: FractionColumnWidth(.35),4: FractionColumnWidth(.35)},
                  children: [
                    if (nConfronto == -1)
                      groupTitle(groupNumber)
                    else
                      groupRow(groupNumber,nConfronto)
                  ],
                )
          ],
        ),
      ),
    );
  }

  TableRow groupTitle(int groupNumber){
    String groupLetter = 'A';
    if(groupNumber==1){groupLetter='B';}
    if(groupNumber==2){groupLetter='C';}
    if(groupNumber==3){groupLetter='D';}
    if(groupNumber==4){groupLetter='E';}
    if(groupNumber==5){groupLetter='F';}
    if(groupNumber==6){groupLetter='G';}
    if(groupNumber==7){groupLetter='H';}
    return TableRow(
      children: [
        Text('\n${Translation(context).text.group} ' + groupLetter,style: EstiloTextoBranco.text16),
        Container(),
        Container(),
        Container(),
        Container(),
      ],
    );
  }
  TableRow groupRow(int groupNumber, int nConfronto){
    MatchResultInternational match = MatchResultInternational(rodadaNumber: semanasGruposInternacionais.indexOf(semana-1),groupNumber: groupNumber, nConfronto: nConfronto, competitionName: myClubClass.internationalLeagueName);
    My my = My();

    String teamNameA = match.clubName1;
    String teamNameB =  match.clubName2;
    int golsA = match.goals1;
    int golsB = match.goals2;

    return  TableRow(
      children: [
        Container(
            color: teamNameA == my.clubName ? Colors.green : Colors.transparent,
            child: Text(teamNameA,textAlign: TextAlign.right,style: EstiloTextoBranco.text16)),
        //Escudo
        Images().getEscudoWidget(teamNameA,20,20),

        match.isAlreadyPlayed
            ? Text(golsA.toString()+'x'+golsB.toString(),style: EstiloTextoBranco.text16)
            : const Center(child: Text('x',style: EstiloTextoBranco.text16)),

        //Escudo
        Images().getEscudoWidget(teamNameB,20,20),

        Container(
            color: teamNameB == my.clubName ? Colors.green : Colors.transparent,
            child: Text(teamNameB,style: EstiloTextoBranco.text16)),
      ],
    );
  }

Widget tableWidgetMataMata(){
  return Container(
    color: AppColors().greyTransparent,
    margin: const EdgeInsets.all(4),
    height: 5*30,
    child: SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              for(int phaseStage = 0; phaseStage < 7; phaseStage++)
                phaseTableMataMataWidget(myClubClass.internationalLeagueName,semana,phaseStage)
            ],
          ),
        ],
      ),
    ),
  );
}

}
