import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/tabela_national.dart';
import 'package:fifa/functions/order_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/historic/leagues_historic.dart';
import 'package:fifa/pages/table/statistics_league.dart';
import 'package:fifa/pages/table/table_widget.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class TableNacional extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final int choosenLeagueIndex;
  const TableNacional({Key? key, required this.choosenLeagueIndex}) : super(key: key);
  @override
  _TableNacionalState createState() => _TableNacionalState();
}

class _TableNacionalState extends State<TableNacional> {

  late int choosenLeagueIndex;
  League myLeague = League(index: My().campeonatoID);
  late int rodadaMatch = myLeague.nClubs-1;
  Map leaguesMap = {};

  int choosenIcon = 1;
////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }
  doThisOnLaunch() {
    //INDEX INICIAL
    choosenLeagueIndex = widget.choosenLeagueIndex;
    //rodada inicial mostrada
    if(rodada < myLeague.nClubs-1){
      rodadaMatch = rodada;
    }

    //GET LEAGUES CLASSES
    for(int i=0;i<leaguesListRealIndex.length;i++){
      int leagueID = leaguesListRealIndex[i];
      leaguesMap[leagueID] = League(index: leagueID);
    }

    setState(() {});
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    String leagueName = leaguesMap[choosenLeagueIndex].getName();

    return Scaffold(
        body:  Stack(
            children: [

              Images().getWallpaper(),

              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        backButton(context),
                        Image.asset(FIFAImages().campeonatoLogo(leagueName),height:25,width: 25),
                        Text(' ${Translation(context).text.matchWeek} '+ rodada.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text20),
                        const Spacer(),
                        IconButton(onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => HistoricLeague(choosenLeagueIndex: choosenLeagueIndex)));
                          }, icon: const Icon(Icons.outbond_rounded,color: Colors.white,size: 32,)),
                      ],
                    ),

                    Container(
                      height: Sized(context).height-130,
                      color: AppColors().greyTransparent,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ///////////////////
                            //CLASSIFICAÇÃO
                            ///////////////////
                            tabelaClassificacaoWidget(context,leaguesMap[choosenLeagueIndex]),

                            ///////////////////
                            //PRÓXIMAS PARTIDAS
                            ///////////////////
                            const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(
                              width: 70,
                              child: Column(
                                children: [
                                  //Matchs - VERSUS
                                  Container(
                                    color: choosenIcon==1 ? Colors.teal : Colors.transparent,
                                    padding: const EdgeInsets.all(2),
                                    child: GestureDetector(
                                      onTap:(){
                                        choosenIcon = 1;
                                        setState(() {});
                                      },
                                      child: Image.asset('assets/icons/versus.png',height:50),
                                    ),
                                  ),
                                  //Artilheiro
                                  Container(
                                    color: choosenIcon==2 ? Colors.teal : Colors.transparent,
                                    padding: const EdgeInsets.all(2),
                                    child: GestureDetector(
                                      onTap:(){
                                        choosenIcon = 2;
                                        setState(() {});
                                        //Navigator.push(context,MaterialPageRoute(builder: (context) => Artilheiros(choosenLeagueIndex:choosenLeagueIndex)));
                                      },
                                      child: Image.asset('assets/icons/artilheiro.png',height:50),
                                    ),
                                  ),
                                  //YELLOW CARDS
                                  Container(
                                    color: choosenIcon==3 ? Colors.teal : Colors.transparent,
                                    padding: const EdgeInsets.all(2),
                                    child: GestureDetector(
                                      onTap:(){
                                        choosenIcon = 3;
                                        setState(() {});
                                      },
                                      child: Image.asset('assets/icons/cartao-amarelo.png',height:50),
                                    ),
                                  ),
                                  //RED CARDS
                                  Container(
                                    color: choosenIcon==4 ? Colors.teal : Colors.transparent,
                                    padding: const  EdgeInsets.all(2),
                                    child: GestureDetector(
                                      onTap:(){
                                        choosenIcon = 4;
                                        setState(() {});
                                      },
                                      child: Image.asset('assets/icons/cartao-vermelho.png',height:50),
                                    ),
                                  ),

                                ],
                              ),
                            ),


                            Expanded(
                              child: Container(
                                color: AppColors().greyTransparent,
                                child: choosenIcon==1 ? matchsWidget()
                                    : choosenIcon==2 ? yellowRedCardWidget(0)
                                              : choosenIcon==3 ? yellowRedCardWidget(1)
                                              : choosenIcon==4 ? yellowRedCardWidget(2) : Container(),
                              ),
                            ),


                          ],
                        ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ////////////////////////////////////
              //SELECT LEAGUE
              selectLeagueWidget(context),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
 Widget selectLeagueWidget(BuildContext context){
    return              Container(
      padding: EdgeInsets.only(top:Sized(context).height- 50),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for(int i=0;i<leaguesListRealIndex.length;i++)
              leagueRow(i)
          ],
        ),
      ),
    );
 }
  Widget leagueRow(int league){
    int leagueID = leaguesListRealIndex[league];
    String leagueName = leaguesMap[leagueID].getName();
    return GestureDetector(
      onTap: (){
        choosenLeagueIndex = leagueID;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        color: choosenLeagueIndex == leagueID ? Colors.redAccent: Colors.white54,
        child: Image.asset(FIFAImages().campeonatoLogo(leagueName),height: 50,width: 50,),
      ),
    );
}



////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                 //
////////////////////////////////////////////////////////////////////////////


Widget matchsWidget(){

  League choosenLeagueClass = leaguesMap[choosenLeagueIndex];
  if(rodadaMatch>=choosenLeagueClass.nClubs-1){
    rodadaMatch = choosenLeagueClass.nClubs-1;
  }
  return Column(
    children: [
      Row(
        children: [

          GestureDetector(
              onTap:(){
                if(rodadaMatch>1) {
                  rodadaMatch --;
                }
                setState(() {});
              },
              child: const Icon(Icons.arrow_left,color:Colors.white,size:50)
          ),

          Expanded(child: Text('${Translation(context).text.matchWeek} '+rodadaMatch.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text16)),

          GestureDetector(
              onTap:(){
                if(rodadaMatch<choosenLeagueClass.getNTeams()-1) {
                  rodadaMatch ++;
                }
                setState(() {});
              },
              child: const Icon(Icons.arrow_right,color:Colors.white,size:50)
          ),


        ],
      ),

      Container(
        color: AppColors().greyTransparent,
        child: Table(
          columnWidths:
          (rodadaMatch<=rodada)
              ? const {0: FractionColumnWidth(.36),6: FractionColumnWidth(.36)}
              : const {0: FractionColumnWidth(.36),2: FractionColumnWidth(.0),4: FractionColumnWidth(.0),6: FractionColumnWidth(.36)},
          children: [
            for(int i=0; i<(leaguesMap[choosenLeagueIndex].getNTeams()/2);i++)
              rowMatches(i*2),
          ],
        ),
      ),

    ],
  );
}

  TableRow rowMatches(int numeroDoConfronto) {

    TableNational tableNational = TableNational(
        choosenLeagueIndex: choosenLeagueIndex,
        leagueClass: leaguesMap[choosenLeagueIndex],
        rodadaMatch: rodadaMatch,
        numeroDoConfronto: numeroDoConfronto
    );

    return TableRow(
      children: [
        Text(tableNational.teamName1,textAlign:TextAlign.end,style: EstiloTextoBranco.text14),
        Images().getEscudoWidget(tableNational.teamName1,22,22),
        (tableNational.showGoals)
            ? Text(tableNational.gol1.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text14) : Container(),
        const Text('x',style: EstiloTextoBranco.text16,textAlign: TextAlign.center,),
        (tableNational.showGoals)
            ? Text(tableNational.gol2.toString(),textAlign: TextAlign.center,style: EstiloTextoBranco.text14) : Container(),
        Images().getEscudoWidget(tableNational.teamName2,22,22),
        Text(tableNational.teamName2,style: EstiloTextoBranco.text14),
      ],
    );
  }


Widget yellowRedCardWidget(int goalOrYellowOrRed){

  List leaguePlayers = organizarVariavelLeague(leaguesMap[choosenLeagueIndex],  goalOrYellowOrRed);

    return Column(
      children: [
        Row(
          children: [
            goalOrYellowOrRed==0
                  ? Text(Translation(context).text.topScorers,style: EstiloTextoBranco.text16)
                  : goalOrYellowOrRed==1 ? Text(Translation(context).text.yellowCards,style: EstiloTextoBranco.text16)
                : Text(Translation(context).text.redCards,style: EstiloTextoBranco.text16),
          ],
        ),

        SizedBox(
          height: 205,
          child: SingleChildScrollView(
            child: Table(
              columnWidths: const{0: FractionColumnWidth(.1),1: FractionColumnWidth(.5),2: FractionColumnWidth(.4)},
              children: [
                for(int i=0; i<70; i++)
                  yellowRedCardWidgetRow(leaguePlayers[i],goalOrYellowOrRed)
              ],
            ),
          ),
        ),
      ],
    );
}
  TableRow yellowRedCardWidgetRow(int playerID,int goalOrYellowOrRed){
    Jogador player = Jogador(index: playerID);

    return TableRow(
      children: [
        Images().getEscudoWidget(player.clubName,20,20),
        Container(
            color: player.clubID == My().clubID ? Colors.teal : Colors.transparent,
            child: Text(player.name,style: EstiloTextoBranco.text14)),
        goalOrYellowOrRed==0
              ? Text(player.goalsLeague.toString(),style: EstiloTextoBranco.text16)
              : goalOrYellowOrRed==1 ? Text(player.yellowCard.toString(),style: EstiloTextoBranco.text16)
            : Text(player.redCard.toString(),style: EstiloTextoBranco.text16),
      ],
    );
  }


}