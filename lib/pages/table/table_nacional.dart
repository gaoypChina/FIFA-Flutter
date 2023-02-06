import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/historic/leagues_historic.dart';
import 'package:fifa/pages/table/widgets/matchs.dart';
import 'package:fifa/pages/table/widgets/player_statistics.dart';
import 'package:fifa/pages/table/widgets/table_widget.dart';
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

class _TableNacionalState extends State<TableNacional>  with TickerProviderStateMixin  {

  late int choosenLeagueIndex;
  League myLeague = League(index: My().leagueID);
  late int rodadaMatch = myLeague.nClubs-1;
  Map leaguesMap = {};

  late TabController _tabController;
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
    _tabController = TabController(vsync: this, length: 1);
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

    return  DefaultTabController(
        length: 1,
        child: Scaffold(
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

                    SizedBox(
                      height: Sized(context).height-130,
                      child: TabBarView(
                        controller: _tabController,
                        children: [

                          SingleChildScrollView(
                            child: Column(
                              children: [
                                tabelaClassificacaoWidget(context,leaguesMap[choosenLeagueIndex]),                            ///////////////////
                                //PRÓXIMAS PARTIDAS
                                ///////////////////
                                const SizedBox(height: 8),
                                rowStatistics(),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),

                        ],
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
    )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget rowStatistics(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          color: AppColors().greyTransparent,
          child: choosenIcon==1 ? matchsWidget()
              : choosenIcon==2 ? wYellowRedCardWidget(context, leaguesMap[choosenLeagueIndex], 0)
              : choosenIcon==3 ? wYellowRedCardWidget(context, leaguesMap[choosenLeagueIndex], 1)
              : choosenIcon==4 ? wYellowRedCardWidget(context, leaguesMap[choosenLeagueIndex], 2)
              : choosenIcon==5 ? wYellowRedCardWidget(context, leaguesMap[choosenLeagueIndex], 3)
              : choosenIcon==6 ? wYellowRedCardWidget(context, leaguesMap[choosenLeagueIndex], 4)
              : Container(),
        ),

        SizedBox(
          height: 70,
          child: Row(
            children: [
              componentTable(0),
              componentButton(1, 'assets/icons/versus.png'),
              componentButton(2, 'assets/icons/artilheiro.png'),
              componentButton(5, 'assets/icons/assists.png'),
              componentButton(3, 'assets/icons/cartao-amarelo.png'),
              componentButton(4, 'assets/icons/cartao-vermelho.png'),
              componentButton(6, 'assets/icons/craque.png'),
            ],
          ),
        ),




      ],
    );
  }
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
Widget componentButton(int optionNumber, String image){
  return Container(
    color: choosenIcon==optionNumber ? Colors.teal : Colors.transparent,
    padding: const  EdgeInsets.all(2),
    child: GestureDetector(
      onTap:(){
        choosenIcon = optionNumber;
        setState(() {});
      },
      child: Image.asset(image,height:50),
    ),
  );
}
  Widget componentTable(int optionNumber){
    return Container(
      color: choosenIcon==optionNumber ? Colors.teal : Colors.transparent,
      padding: const  EdgeInsets.all(2),
      child: GestureDetector(
        onTap:(){
          choosenIcon = optionNumber;
          setState(() {});
        },
        child: const Icon(Icons.table_chart, color: Colors.white, size:50),
      ),
    );
  }
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

      wMatchsTable(rodadaMatch, leaguesMap[choosenLeagueIndex], choosenLeagueIndex),

    ],
  );
}


}