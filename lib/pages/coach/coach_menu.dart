import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/data_graphics.dart';
import 'package:fifa/classes/expectativa.dart';
import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/historic/historic_club_year.dart';
import 'package:fifa/classes/historic/historic_my_tranfers.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/coach/coach_best_results.dart';
import 'package:fifa/classes/coach/coach_historic_data.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/coach/change_club.dart';
import 'package:fifa/pages/coach/coach_achievements.dart';
import 'package:fifa/pages/coach/coachs_ranking.dart';
import 'package:fifa/pages/historic/my_players_historic.dart';
import 'package:fifa/widgets/button/button_border_green.dart';
import 'package:fifa/widgets/popup/popup_ask_money.dart';
import 'package:fifa/widgets/popup/popup_player_info.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/league_trophy_image.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CoachMenu extends StatefulWidget {
  const CoachMenu({Key? key}) : super(key: key);

  @override
  State<CoachMenu> createState() => _CoachMenuState();
}

class _CoachMenuState extends State<CoachMenu> {

  My my = My();
  CoachHistoricData coachHistoricData = CoachHistoricData();
  Expectativa expectativa = Expectativa(My());
  CoachBestResults coachBestResults = CoachBestResults();

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    //TODO: ISSO AQUI DA UM ERRO DE WIDGET PRA CARREGAR A PÁGINA
    coachBestResults.updateVariables();

    return Scaffold(
      body: Container(
        decoration: Images().getWallpaperContainerDecoration(),
        child: Column(
          children: [

            backButtonText(context,Translation(context).text.coachMenu, true),

            //Botões
            Container(
              color: appBarMyClubColor(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  changeClub(context),
                  coachAchievements(context),
                  coachPoints(context),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                      color: AppColors().greyTransparent,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          trophyWidget(context,0),
                          trophyWidget(context,1),
                        ],
                      ),
                    ),

                    Container(
                      color: AppColors().greyTransparent,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          pieChart(coachHistoricData.dataPieChartMap(context)),
                          victoryDrawLoses('%',coachHistoricData.pointsPercentage.toStringAsFixed(1)),
                        ],
                      ),
                    ),


                    expectations(),

                    //TABELA
                    ano > anoInicial ? Container(
                      color: AppColors().greyTransparent,
                      width: Sized(context).width,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Text(Translation(context).text.pastTeams,style: EstiloTextoBranco.text16),

                          for(int year=anoInicial;year<ano;year++)
                            yearRow(year,context),
                        ],
                      ),
                    ) : Container(),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        sequenceWidget(Translation(context).text.biggestVictory, coachBestResults.maxVictory, coachBestResults.maxVictoryClubID,coachBestResults.maxVictoryClubAdvID),
                        sequenceWidget(Translation(context).text.biggestDefeat, coachBestResults.maxLoss, coachBestResults.maxLossClubID,coachBestResults.maxLossClubAdvID),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        sequenceWidget(Translation(context).text.sequenceNoDefeats, coachBestResults.maxSequenceNoLosses.toString(), coachBestResults.maxSequenceNoLossesClubID),
                        sequenceWidget(Translation(context).text.sequenceVictories,coachBestResults.maxSequenceVictory.toString(), coachBestResults.maxSequenceVictoryClubID),
                      ],
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        signWidget('Contratação mais cara',HistoricMyTransfers().buyKeyword),
                        signWidget('Venda mais cara',HistoricMyTransfers().sellKeyword),
                      ],
                    ),

                    financeWidget(),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget coachPoints(BuildContext context){
  return ButtonBorderGreen(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CoachRanking()));
      },
      child: Text('${Translation(context).text.points}: ${my.scoreGame} ',style: EstiloTextoBranco.text16)
  );
}
Widget changeClub(BuildContext context){
  return Column(
    children: [
      ButtonBorderGreen(
      onTap: (){
        customToast(Translation(context).text.loading);
        if(!alreadyChangedClubThisSeason){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChangeClub()));
        }else{
          customToast(Translation(context).text.alreadyChangedYourClub);
        }
      },
        child: Text(Translation(context).text.changeClub,style: EstiloTextoBranco.text16)
      ),
    ],
  );
}
Widget coachAchievements(BuildContext context){
  return Column(
    children: [
      ButtonBorderGreen(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CoachAchievements()));
            customToast(Translation(context).text.inDevelopment);
          },
          child: Text(Translation(context).text.coachAchievements,style: EstiloTextoBranco.text16)
      ),
    ],
  );
}



Widget trophyWidget(BuildContext context, int i) {
  late String name;
  late String image;
  late int qntd;

  if(i==0){
    name = Translation(context).text.nationalChampionship;
    image = getTrophyImage(My().campeonatoName);
    qntd = HistoricFunctions().myLeagueTitles();
  }
  if(i==1){
    name = Translation(context).text.internationalChampionship;
    image = getTrophyImage(My().getMyInternationalLeague());
    qntd = HistoricFunctions().myInternationalTitle();
  }
  return Container(
    height: 160,
    width: 120,
    color: AppColors().greyTransparent,
    child: Stack(
      children: [
        //LOGO DE FUNDO OPACA
        SizedBox(
          height: 200,width: 200,
          child: Opacity(
            opacity: 0.4,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    alignment: FractionalOffset.center,
                    image: AssetImage('assets/trophy/$image.png')),
                  )
              ),
            ),
          ),
        Center(child: Text(name,textAlign:TextAlign.center,style: EstiloTextoBranco.text14)),
        Padding(
          padding: const EdgeInsets.only(top: 110, left: 50),
          child: Text(qntd.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.negrito40),
        ),

      ],
    ),
  );
  }


Widget pieChart(Map<String,double> dataMap){
  return  SizedBox(
    height: 100,
    child: PieChart(
      dataMap: dataMap,
      colorList: const [Colors.green,Colors.grey,Colors.red],
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        showLegends: true,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  );
}
Widget victoryDrawLoses(String text, String value){
  return Column(
    children: [
      Text(text,style: EstiloTextoBranco.text22),
      Text(value,style: EstiloTextoBranco.text22),
    ],
  );
}
Widget expectations(){
    return Container(
      color: AppColors().greyTransparent,
      width: Sized(context).width,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(Translation(context).text.expectation,style: EstiloTextoBranco.negrito18),
              const Spacer(),
              buttonMoreMoney(),
            ],
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                Image.asset(Images().getMyLeagueLogo(),height: 25,width: 25),
                const SizedBox(width: 8),
                Text('${my.campeonatoName}: ${expectativa.expectativaNacional.toString()}º',style: EstiloTextoBranco.text16),
              ],
            ),
          ),
          Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              Image.asset(Images().getMyInternationalLeagueLogo(),height: 25,width: 25),
              const SizedBox(width: 8),
              Text('${my.getMyInternationalLeague()}: ${Name().showTranslated(context, expectativa.expInternacional.toString())}',style: EstiloTextoBranco.text16),
            ],
          ),
          ),

          const SizedBox(height: 12),
          const Text('Desempenho',style: EstiloTextoBranco.negrito18),
          const SizedBox(height: 6),

          expectationBar(),



        ],
      ),
    );
}

Widget expectationBar(){
    int actualPosition = Classification(leagueIndex: my.leagueID).getClubPosition(my.clubID);
    int expectativaPosition = expectativa.expectativaNacional;
    double value = 0.65 + 0.0786*(expectativaPosition-actualPosition); //MADE-UP FORMULA

    return LinearProgressIndicator(
      minHeight: 10,
      value: value,
      color: value>=0.65 ? Colors.teal : value > 0.45 ? Colors.yellow : Colors.red,
      backgroundColor: Colors.grey,
    );
}
Widget buttonMoreMoney(){
    return           GestureDetector(
        onTap: (){
          popUpAskMoney(
              context: context,
              expectativa: expectativa,
              overall: Club(index: my.clubID).getOverall(),
              functionSetState: (){setState((){});}
          );
        },child: Container(
        color: AppColors().greyTransparent,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(4),
        child: const Text('Pedir Dinheiro',style: EstiloTextoBranco.text16))
    );
}
Widget sequenceWidget(String text, String value, int clubID, [int? advClubID]){
  return Container(
    decoration: BoxDecoration(
      color: AppColors().greyTransparent,
    ),
    width: 170,
    padding: const EdgeInsets.all(4),
    margin: const EdgeInsets.all(4),
    child: Column(
      children: [
        Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.negrito14),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Images().getEscudoWidget(Club(index: clubID).name,40,40),
              Text(value,style: EstiloTextoBranco.text30),
              advClubID != null && advClubID !=clubID
                  ? Images().getEscudoWidget(Club(index: advClubID).name,40,40)
                  : Container(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget signWidget(String text, String keyword){
  HistoricMyTransfers historicTransfers = HistoricMyTransfers();
  HighestSellBuy highestSellBuy = historicTransfers.getHighest(keyword);
  
  Jogador player = Jogador(index: highestSellBuy.playerID);
  return highestSellBuy.maxPrice>0 ? Container(
    decoration: BoxDecoration(
      color: AppColors().greyTransparent,
    ),
    width: 170,
    padding: const EdgeInsets.all(4),
    margin: const EdgeInsets.all(4),
    child: GestureDetector(
      onTap: (){
        popUpOkShowPlayerInfos(context: context, playerID: player.index, funcSetState: (){setState(() {});});
      },
      child: Column(
        children: [
          Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.text14),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Images().getPlayerPictureWidget(player,50,50),
                Column(
                  children: [
                    Text(highestSellBuy.maxPrice.toStringAsFixed(2),style: EstiloTextoBranco.text20),
                    SizedBox(width:80,child: Text(player.name,maxLines:2,textAlign:TextAlign.center,style: EstiloTextoBranco.text14)),
                  ],
                ),
                ],
            ),
          ),
        ],
      ),
    ),
  ) : Container(width: 170);
}
Widget yearRow(int year, BuildContext context){

  HistoricClubYear myClubData = HistoricClubYear(year);

  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyPlayersHistoric(year: year)));
    },
    child: Row(
      children: [
        Text(year.toString(),style: EstiloTextoBranco.text16),
        Images().getEscudoWidget(myClubData.clubName,20,20),
        SizedBox(
            width: Sized(context).width*0.25,
            child: Text(myClubData.clubName,style: EstiloTextoBranco.text14)
        ),
        Text('${myClubData.leagueName}: \n${myClubData.internationalLeagueName}: ',style: EstiloTextoBranco.text12),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text('${myClubData.leaguePosition}º\n${Name().showTranslated(context, myClubData.internationalLeaguePosition)}', overflow: TextOverflow.clip,style: EstiloTextoBranco.text14),
        ),
      ],
    ),
  );
}

Widget financeWidget(){

    Map<int,double> balanceByWeek = {};
    for(int week=1;week<=semana;week++){
      balanceByWeek[week] = HistoricMyTransfers().getWeekBalance(week);
    }

    return Container(
      width: Sized(context).width,
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('Finanças - '+ano.toString(),style: EstiloTextoBranco.negrito18),

          const SizedBox(height: 12),

          graphFinance(balanceByWeek),

          const Text('Saldo',style: EstiloTextoBranco.negrito16),
          Text('\$'+my.money.toStringAsFixed(2),style: EstiloTextoBranco.text16),
        ],
      ),
    );
}
Widget graphFinance(Map expensesMap){
    List<GraphPoint> lista = [];
  for(int week=1;week<=semana;week++){
    if(expensesMap.containsKey(week)){
      lista.add(GraphPoint(week, expensesMap[week]));
    }else{
      lista.add(GraphPoint(week, expensesMap[week]));
    }
  }

    return SizedBox(
        height: 150,
        width: Sized(context).width,
        child: SfCartesianChart(
          //tooltipBehavior: _tooltipBehavior,
          //https://pub.dev/documentation/syncfusion_flutter_charts/latest/charts/SfCartesianChart-class.html?utm_source=pubdev&utm_medium=listing&utm_campaign=flutter-charts-pubdev
          // Initialize category axis
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            // Initialize line series
            LineSeries<GraphPoint, String>(
              xAxisName: Translation(context).text.years,
              yAxisName: Translation(context).text.position,
              name: 'nome',
              dataSource: lista,
              enableTooltip: true,
              xValueMapper: (GraphPoint data, _) => data.x.toString(),
              yValueMapper: (GraphPoint data, _) => data.y,
              dataLabelSettings: const DataLabelSettings(
                  isVisible: true, color: Colors.white),
              markerSettings: const MarkerSettings(
                  isVisible: true,
                  height: 4,
                  width: 4,
                  borderWidth: 3,
                  borderColor: Colors.white
              ),
            ),

          ],
        ),
      );
}

}
