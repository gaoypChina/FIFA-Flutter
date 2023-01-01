import 'package:fifa/classes/chaves.dart';
import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/menu/c_menu.dart';
import 'package:fifa/theme/background/background_position.dart';
import 'package:fifa/theme/background/moral_icon.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/best_player_box/best_player_box.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:flutter/material.dart';

class AfterPlay extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final int adversarioClubID;
  final int gol1;
  final int gol2;
  final bool visitante;
  const AfterPlay({Key? key,required this.adversarioClubID, required this.visitante, required this.gol1, required this.gol2}) : super(key: key);

  @override
  State<AfterPlay> createState() => _AfterPlayState();
}

class _AfterPlayState extends State<AfterPlay> with TickerProviderStateMixin {

  String name1 = '';
  String name2 = '';
  My myClass = My();
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
                      statistics(),
                      playerStatistics(),
                    ],
                  ),
                ),
                Row(
                  children: [
                    bestPlayerBox('Melhor Jogador', Jogador(index: myClass.jogadores[8]),''),
                    Expanded(child: classification()),
                  ],
                ),
                weekMatchs(),
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
                : Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().libertadores),height: 35,width: 35),
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

Widget statistics(){
    return Column(
      children: [
        statisticsRow(53,'Posse de bola',47),
        statisticsRow(1,'Chutes',3),
        statisticsRow(1,'Chutes no Gol',3),
        statisticsRow(1,'Escanteios',3),
      ],
    );
}
  Widget statisticsRow(int value1, String name, int value2){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(value1.toString(),style: EstiloTextoBranco.text14),
            SizedBox(
                width: Sized(context).width*0.3,
                child: Text(name,textAlign:TextAlign.center,style: EstiloTextoBranco.text16)
            ),
            Text(value2.toString(),style: EstiloTextoBranco.text14),
          ],
        )
      ],
    );
  }

  Widget playerStatistics(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            playerRow(Jogador(index: 12)),
            playerRow(Jogador(index: 15)),
          ],
        ),
        Column(
          children: [
            playerRow(Jogador(index: 12)),
            playerRow(Jogador(index: 15)),
          ],
        ),
      ],
    );
  }
  Widget playerRow(Jogador player){
    return Row(
      children: [
          const SizedBox(width: 4),
          positionContainer(player.position),
          const SizedBox(width: 4),
          moralContainer(player,size: 20),
          const SizedBox(width: 4),
          SizedBox(width:100,child: Text(player.name,style: EstiloTextoBranco.text14)),
          const SizedBox(width: 4),
      ],
    );
  }
  Widget classification(){
    List classificationClubsIndexes = Classification(leagueIndex: myClass.getLeagueID()).classificationClubsIndexes;

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
            //CONTENT
            Container(
              height: 5*25,
              margin: const EdgeInsets.all(4),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: classificationClubsIndexes.length,
                  itemBuilder: (c,i)=>classificationRow(i,classificationClubsIndexes[i])
              ),
            ),
          ],
        ),
      );
    }

  Widget classificationRow(int position, int indexClub){
    Club clubClass = Club(index: indexClub);
    String clubName1 = clubClass.name;
    int points = clubClass.leaguePoints;
    int golsMarcados = clubClass.leagueGM;
    int golsSofridos = clubClass.leagueGS;

    return Row(
      children: [
        SizedBox(width:25,child: Text((position+1).toString()+'º',style:EstiloTextoBranco.text14)),
        Images().getEscudoWidget(clubName1,25,25),
        Expanded(
            child: Container(color:(clubName1==myClass.clubName) ? Colors.purple : Colors.transparent,
            padding:const EdgeInsets.all(1),
            child: Text(clubName1,style:EstiloTextoBranco.text12))),
        SizedBox(width:25,child: Text(points.toString(),style:EstiloTextoBranco.text14)),
        SizedBox(width:25,child: Text(golsMarcados.toString(),style:EstiloTextoBranco.text14)),
        SizedBox(width:25,child: Text(golsSofridos.toString(),style:EstiloTextoBranco.text14)),
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

    List chave = Chaves().obterChave((rodada-1), myClass.campeonatoID);
    int chaveClub1 = chave[numeroDoConfronto];
    String teamName1 = leagueClass.getClubName(chaveClub1);
    int chaveClub2 = Chaves().chaveIndexAdvCampeonato((rodada-1),  myClass.campeonatoID, chaveClub1)[0];
    String teamName2 = leagueClass.getClubName(chaveClub2);

    int gol1=0;
    int gol2=0;
    //quando chega na rodada max ele acabaria nao mostrando, por isso quando termina o campeonato mostra a ultima rodada
      List results = globalHistoricLeagueGoalsAll[(rodada-1)][ myClass.campeonatoID];
      gol1 = results[chaveClub1];
      gol2 = results[chaveClub2];


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
                    color:(myClass.clubName == teamName1) ?Colors.purple:Colors.transparent,
                    child: Text(teamName1,style:EstiloTextoBranco.text14)),
                Images().getEscudoWidget(teamName1,25,25),
                Text(gol1.toString(),style:EstiloTextoBranco.text14),
              ],
            ),
          ),

          const SizedBox(width:15, child: Text('x',textAlign:TextAlign.center,style:EstiloTextoBranco.text14)),

          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(gol2.toString(),style:EstiloTextoBranco.text14),
                Images().getEscudoWidget(teamName2,25,25),
                Container(
                    padding: const EdgeInsets.all(1),
                    color:(myClass.clubName == teamName2) ?Colors.purple:Colors.transparent,
                    child: Text(teamName2,style:EstiloTextoBranco.text14)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
