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
  const AfterPlay({Key? key}) : super(key: key);

  @override
  State<AfterPlay> createState() => _AfterPlayState();
}

class _AfterPlayState extends State<AfterPlay> with TickerProviderStateMixin {

  String name1 = 'CSKA';
  String name2 = 'Celtic';
  String gol1 = '1';
  String gol2 = '0';
  bool visitante = false;
  My myClass = My();
  Club myClubClass = Club(index: My().clubID);
  late TabController _tabController;

  ///////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
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
                    bestPlayerBox('Melhor Jogador', Jogador(index: 32),''),
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
    if(Semana(semana).isJogoCampeonatoNacional) {
      textRodada = '${Translation(context).text.matchWeek} ' + rodada.toString() + '/' + (League(index: myClass.campeonatoID).getNTeams()-1).toString();
    }else{
      textRodada = Name().groupsPhase;
      if(Semana(semana).isJogoGruposInternacional){textRodada += ' ${Semana(semana).rodadaGroupInternational}'; }
      else if(Semana(semana).isJogoMataMataInternacional){
        textRodada = Semana(semana).semanaStr;
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //Escudo time 1
        Image.asset(Images().getEscudo(name1),height: 80,width: 80),

        Column(
          children: [
            Semana(semana).isJogoCampeonatoNacional
                ? Image.asset(FIFAImages().campeonatoLogo(myClubClass.leagueName),height: 30,width: 30)
                : Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().libertadores),height: 35,width: 35),
            Text(textRodada,style: EstiloTextoBranco.text16),
            visitante
                ? Text(gol1 +'X'+ gol2,style: EstiloTextoBranco.text30)
                : Text(gol2 +'X'+ gol1,style: EstiloTextoBranco.text30),
          ],
        ),

        //Escudo time 2
        Image.asset(Images().getEscudo(name2),height: 80,width: 80),

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
    int nTeams = 12;
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
                const SizedBox(width:30,child: Text('OVR',style:EstiloTextoBranco.text14)),
              ],
            ),
            //CONTENT
            Container(
              height: 5*25,
              margin: const EdgeInsets.all(4),
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: nTeams,
                  itemBuilder: (c,i)=>classificationRow(i)
              ),
            ),
          ],
        ),
      );
    }

  Widget classificationRow(int i){
    String clubName1 = 'Chelsea';
    return Row(
      children: [
        SizedBox(width:25,child: Text((i+1).toString()+'º',style:EstiloTextoBranco.text14)),
        Image.asset(Images().getEscudo(clubName1),height: 25,width: 25,),
        Expanded(child: Text(clubName1,style:EstiloTextoBranco.text14)),
        const SizedBox(width:30,child: Text('6',style:EstiloTextoBranco.text14)),
        const SizedBox(width:30,child: Text('76.8',style:EstiloTextoBranco.text14)),
      ],
    );
  }
  Widget weekMatchs(){
    return Container(
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.all(4),
      child: Column(
        children: [
          Text('Rodada '+rodada.toString(),style: EstiloTextoBranco.negrito16),
              Container(
                height: 5*30,
                margin: const EdgeInsets.all(4),
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 5,
                    itemBuilder: (c,i)=>weekMatchRow()
                ),
              ),
        ],
      ),
    );
  }
  Widget weekMatchRow(){
    String clubName1 = 'Real Madrid';
    String clubName2 = 'Milan';
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(clubName1,style:EstiloTextoBranco.text14),
                Image.asset(Images().getEscudo(clubName1),height: 25,width: 25,),
                const Text('3',style:EstiloTextoBranco.text14),
              ],
            ),
          ),

          const SizedBox(width:15, child: Text('x',textAlign:TextAlign.center,style:EstiloTextoBranco.text14)),

          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('2',style:EstiloTextoBranco.text14),
                Image.asset(Images().getEscudo(clubName2),height: 25,width: 25,),
                Text(clubName2,style:EstiloTextoBranco.text14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
