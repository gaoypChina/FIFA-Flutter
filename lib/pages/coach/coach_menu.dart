import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/expectativa.dart';
import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/historic.dart';
import 'package:fifa/classes/historic_tranfers.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/coach/coach_best_results.dart';
import 'package:fifa/functions/coach/coach_historic_data.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/change_club.dart';
import 'package:fifa/pages/coach/coach_achievements.dart';
import 'package:fifa/pages/coach/coach_past_club.dart';
import 'package:fifa/pages/coach/coachs_ranking.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/league_trophy_image.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
    coachBestResults.updateVariables();

    return Scaffold(
      body: Container(
        decoration: Images().getWallpaperContainerDecoration(),
        child: Column(
          children: [

            backButtonText(context,Translation(context).text.coachMenu),

            //Botões
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                changeClub(context),
                coachAchievements(context),
                coachPoints(context),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    Container(
                      color: AppColors().greyTransparent,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
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
                        signWidget('Contratação mais cara',HistoricTransfers().sellKeyword),
                        signWidget('Venda mais cara',HistoricTransfers().buyKeyword),
                      ],
                    ),


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
  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CoachRanking()));
    },
    child: Container(
      color: AppColors().greyTransparent,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      child: Text('${Translation(context).text.points}: ${my.scoreGame} ',style: EstiloTextoBranco.text16),

    ),
  );
}
Widget changeClub(BuildContext context){
  return Column(
    children: [
      Container(
        color: AppColors().greyTransparent,
        margin: const EdgeInsets.all(8),
        child: Material(
          color: AppColors().greyTransparent,
          child: InkWell(
            onTap:(){
              customToast(Translation(context).text.loading);
              if(!alreadyChangedClubThisSeason){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChangeClub()));
              }else{
                customToast(Translation(context).text.alreadyChangedYourClub);
              }
            },
            child: Container(
                padding: const EdgeInsets.all(8),
                child: Text(Translation(context).text.changeClub,style: EstiloTextoBranco.text16)),
          ),
        ),
      ),
    ],
  );
}
Widget coachAchievements(BuildContext context){
  return Column(
    children: [
      Container(
        color: AppColors().greyTransparent,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap:(){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CoachAchievements()));
              customToast(Translation(context).text.inDevelopment);
          },
          child: Text(Translation(context).text.coachAchievements,style: EstiloTextoBranco.text16),
        ),
      ),
    ],
  );
}




Widget trophyWidget(BuildContext context, int i){
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
  return Column(
    children: [
      SizedBox(
          width: 100,
          child: Text(name,textAlign:TextAlign.center,style: EstiloTextoBranco.text14)
      ),
      const SizedBox(height: 4),
      Image.asset('assets/trophy/$image.png',height: 100,width: 100),
      Text(qntd.toString(),style: EstiloTextoBranco.text20),
    ],
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
        legendPosition: LegendPosition.right,
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
          Text(Translation(context).text.expectation,style: EstiloTextoBranco.text20),
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
        ],
      ),
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
        Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.text14),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(Images().getEscudo(Club(index: clubID).name),height:40,width: 40),
              Text(value,style: EstiloTextoBranco.text30),
              advClubID != null && advClubID !=clubID ? Image.asset(Images().getEscudo(Club(index: advClubID).name),height:40,width: 40) : Container(),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget signWidget(String text, String keyword){
  HistoricTransfers historicTransfers = HistoricTransfers();
  HighestSellBuy highestSellBuy = historicTransfers.getHighest(keyword);
  
  Jogador player = Jogador(index: highestSellBuy.playerID);
  return Container(
    decoration: BoxDecoration(
      color: AppColors().greyTransparent,
    ),
    width: 170,
    padding: const EdgeInsets.all(4),
    margin: const EdgeInsets.all(4),
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
  );
}
Widget yearRow(int year, BuildContext context){

  HistoricClubYear myClubData = HistoricClubYear(year);

  return GestureDetector(
    onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CoachHistoricClub(clubID: myClubData.clubID, year: year)));
    },
    child: Row(
      children: [
        Text(year.toString(),style: EstiloTextoBranco.text16),
        Image.asset(Images().getEscudo(myClubData.clubName),height: 20,width: 20,),
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
}
