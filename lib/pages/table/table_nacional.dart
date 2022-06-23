import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/chaves.dart';
import 'package:fifa/functions/order_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/pages/table/table_widget.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class TableNacional extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const TableNacional({Key? key}) : super(key: key);
  @override
  _TableNacionalState createState() => _TableNacionalState();
}

class _TableNacionalState extends State<TableNacional> {

  int choosenLeagueIndex = My().campeonatoID;
  int rodadaMatch = League(index: My().campeonatoID).nClubs-1;

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
    //rodada inicial mostrada
    if(rodada < League(index: My().campeonatoID).nClubs-1){
      rodadaMatch = rodada;
    }
    setState(() {});
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:  Stack(
            children: [

              Images().getWallpaper(),

              Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      height: Sized(context).height-80,
                      color: AppColors().greyTransparent,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [

                            Row(
                              children: [
                                backButton(context),
                                Image.asset(FIFAImages().campeonatoLogo(choosenLeagueIndex),height:25,width: 25),
                                Expanded(child: Text(' ${Translation(context).text.matchWeek} '+ rodada.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text20)),
                              ],
                            ),

                            ///////////////////
                            //CLASSIFICAÇÃO
                            ///////////////////
                            tabelaClassificacaoWidget(context,choosenLeagueIndex),

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
    int leagueIndex = leaguesListRealIndex[league];
    return GestureDetector(
      onTap: (){
        choosenLeagueIndex = leagueIndex;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        color: choosenLeagueIndex == leagueIndex ? Colors.redAccent: Colors.white54,
        child: Image.asset(FIFAImages().campeonatoLogo(leagueIndex),height: 50,width: 50,),
      ),
    );
}



////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                 //
////////////////////////////////////////////////////////////////////////////


Widget matchsWidget(){

  League choosenLeagueClass = League(index: choosenLeagueIndex);
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
          (rodadaMatch<rodada)
              ? const {0: FractionColumnWidth(.36),6: FractionColumnWidth(.36)}
              : const {0: FractionColumnWidth(.36),2: FractionColumnWidth(.0),4: FractionColumnWidth(.0),6: FractionColumnWidth(.36)},
          children: [
            for(int i=0; i<(League(index:choosenLeagueIndex).getNTeams()/2);i++)
              rowMatches(i*2),
          ],
        ),
      ),

    ],
  );
}

  TableRow rowMatches(int numeroDoConfronto) {
    List chave = Chaves().obterChave(rodadaMatch, choosenLeagueIndex);
    int chaveClub1 = chave[numeroDoConfronto];
    League leagueClass = League(index: choosenLeagueIndex);
    String teamName1 = leagueClass.getClubName(chaveClub1);
    int chaveClub2 = Chaves().chaveIndexAdvCampeonato(rodadaMatch, choosenLeagueIndex, chaveClub1)[0];
    String teamName2 = leagueClass.getClubName(chaveClub2);

    bool showGoals = (rodadaMatch<rodada || semana > semanasJogosNacionais[leagueClass.nClubs-2]);

    late int gol1,gol2;
    //quando chega na rodada max ele acabaria nao mostrando, por isso quando termina o campeonato mostra a ultima rodada
    if(showGoals) {
      List results = globalHistoricLeagueGoalsAll[rodadaMatch][choosenLeagueIndex];
      gol1 = results[chaveClub1];
      gol2 = results[chaveClub2];
    }

    return TableRow(
      children: [
        Text(teamName1,textAlign:TextAlign.end,style: EstiloTextoBranco.text14),
        Image.asset(Images().getEscudo(teamName1),height: 22,width: 22),
        (showGoals)
            ? Text(gol1.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text14) : Container(),
        const Text('x',style: EstiloTextoBranco.text16,textAlign: TextAlign.center,),
        (showGoals)
            ? Text(gol2.toString(),textAlign: TextAlign.center,style: EstiloTextoBranco.text14) : Container(),
        Image.asset(Images().getEscudo(teamName2),height: 22,width: 22),
        Text(teamName2,style: EstiloTextoBranco.text14),
      ],
    );
  }

  List organizarVariavelLeague(int leagueID, int goalOrYellowOrRed) {
    //Oraganiza em ordem lista de artilheiros, cartoes amarelos ou cartoes amarelos
    //Mostra no Widget de League Results

    List global = [];
    if(goalOrYellowOrRed==0){global = globalJogadoresLeagueGoals;}
    if(goalOrYellowOrRed==1){global = globalJogadoresYellowCard;}
    if(goalOrYellowOrRed==2){global = globalJogadoresRedCard;}

    List copyVariableList = [];
    List leaguePlayers = [];

    List clubsInLeague = League(index: leagueID).getClassification();
    for(int index=0; index<globalJogadoresClubIndex.length; index++){
      if(clubsInLeague.contains(globalJogadoresClubIndex[index])){
        try {// Na 1ªrodada pode dar pau, pq a lista nao foi criada
          if (global[index] >= 0) {
            copyVariableList.add(global[index]);
            leaguePlayers.add(index);
          }
        }catch(e){
          print('Error GlobalFunctions().organizarVariavelLeague: '+e.toString());
        }
      }
    }
    //ARTILHEIROS/lista EM ORDEM
    leaguePlayers = Order().listDecrescente(listA: copyVariableList, listB: leaguePlayers, length: leaguePlayers.length)[1];

    return leaguePlayers;
  }

Widget yellowRedCardWidget(int goalOrYellowOrRed){

  List leaguePlayers = organizarVariavelLeague(choosenLeagueIndex,  goalOrYellowOrRed);

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
        Image.asset(Images().getEscudo(player.clubName),height: 20,width: 20),
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