import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/chaves.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/functions/globalfunctions.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/table_widget.dart';
import 'package:fifa/theme/textstyle.dart';
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
    double _height = MediaQuery.of(context).size.height;


    return Scaffold(

        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [

              Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

              Column(
                children: [
                  Container(
                    height: _height-50,
                    color: AppColors().greyTransparent,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          const SizedBox(height: 40),
                          Row(
                            children: [
                              Image.asset(FIFAImages().campeonatoLogo(choosenLeagueIndex),height:25,width: 25),
                              Expanded(child: Text(' Rodada '+ rodada.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text20)),
                            ],
                          ),

                          ///////////////////
                          //CLASSIFICAÇÃO
                          ///////////////////
                          tabelaClassificacaoWidget(choosenLeagueIndex),

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

                          const SizedBox(height: 40),

                        ],
                      ),
                    ),
                  ),
                ],
              ),

              ////////////////////////////////////
              //SELECT LEAGUE
              Container(
                padding: EdgeInsets.only(top:_height-50),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for(int i=0;i<leaguesListRealIndex.length;i++)
                        leagueRow(i)
                    ],
                  ),
                ),
              ),
            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

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

          Expanded(child: Text('Rodada '+rodadaMatch.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text16)),

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
        Image.asset('assets/clubs/${FIFAImages().imageLogo(teamName1)}.png',height: 22,width: 22),
        (showGoals)
            ? Text(gol1.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text14) : Container(),
        const Text('x',style: EstiloTextoBranco.text16,textAlign: TextAlign.center,),
        (showGoals)
            ? Text(gol2.toString(),textAlign: TextAlign.center,style: EstiloTextoBranco.text14) : Container(),
        Image.asset('assets/clubs/${FIFAImages().imageLogo(teamName2)}.png',height: 22,width: 22),
        Text(teamName2,style: EstiloTextoBranco.text14),
      ],
    );
  }

Widget yellowRedCardWidget(int goalOrYellowOrRed){

  List leaguePlayers = GlobalFunctions().organizarVariavelLeague(choosenLeagueIndex,  goalOrYellowOrRed);

    return Column(
      children: [
        Row(
          children: [
            goalOrYellowOrRed==0 ? const Text('Artilharia',style: EstiloTextoBranco.text16) : goalOrYellowOrRed==1 ? const Text('Cartão Amarelo',style: EstiloTextoBranco.text16) : const Text('Cartão Vermelho',style: EstiloTextoBranco.text16),
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
    Jogador players = Jogador(index: playerID);

    return TableRow(
      children: [
        Image.asset('assets/clubs/${FIFAImages().imageLogo(players.clubName)}.png',height: 20,width: 20,),
        Text(players.name,style: EstiloTextoBranco.text14),
        goalOrYellowOrRed==0 ? Text(players.goals.toString(),style: EstiloTextoBranco.text16) : goalOrYellowOrRed==1 ? Text(players.yellowCard.toString(),style: EstiloTextoBranco.text16): Text(players.redCard.toString(),style: EstiloTextoBranco.text16),
      ],
    );
  }


}