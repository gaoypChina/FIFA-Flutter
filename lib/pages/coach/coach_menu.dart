import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/expectativa.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/historic.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/coach/coach_best_results.dart';
import 'package:fifa/functions/coach/coach_historic_data.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/change_club.dart';
import 'package:fifa/pages/coach/coach_past_club.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/league_trophy_image.dart';
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

  @override
  Widget build(BuildContext context) {
    coachBestResults.updateVariables();

    return Scaffold(
      body: Stack(
        children: [

          Images().getWallpaper(),

          Column(
            children: [
              const SizedBox(height: 40),
              const Text('Menu do Técnico',style: EstiloTextoBranco.text30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Pontos: ${my.scoreGame} ',style: EstiloTextoBranco.text16),
                  changeClub(context),
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
                            trophyWidget(0),
                            trophyWidget(1),
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
                            pieChart(coachHistoricData.dataPieChartMap()),
                            victoryDrawLoses('V',coachHistoricData.victory.toString()),
                            victoryDrawLoses('E',coachHistoricData.draw.toString()),
                            victoryDrawLoses('D',coachHistoricData.loss.toString()),
                            victoryDrawLoses('%',coachHistoricData.pointsPercentage.toStringAsFixed(1)),
                          ],
                        ),
                      ),

                      Container(
                        color: AppColors().greyTransparent,
                        width: Sized(context).width,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Expectativa',style: EstiloTextoBranco.text20),
                            Row(
                              children: [
                                Image.asset(Images().getMyLeagueLogo(),height: 25,width: 25),
                                const SizedBox(width: 4),
                                Text('${my.campeonatoName}: ${expectativa.expectativaNacional.toString()}º',style: EstiloTextoBranco.text16),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(Images().getMyInternationalLeagueLogo(),height: 25,width: 25),
                                const SizedBox(width: 4),
                                Text('${my.getMyInternationalLeague()}: ${expectativa.expInternacional.toString()}',style: EstiloTextoBranco.text16),
                              ],
                            ),
                            ],
                        ),
                      ),




                      //TABELA
                      ano > anoInicial ? Container(
                        color: AppColors().greyTransparent,
                        width: Sized(context).width,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            const Text('Time passado',style: EstiloTextoBranco.text16),

                            for(int year=anoInicial;year<ano;year++)
                              yearRow(year,context),
                          ],
                        ),
                      ) : Container(),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          sequenceWidget('Maior vitória', coachBestResults.maxVictory, coachBestResults.maxVictoryClubID,coachBestResults.maxVictoryClubAdvID),
                          sequenceWidget('Maior derrota', coachBestResults.maxLoss, coachBestResults.maxLossClubID,coachBestResults.maxLossClubAdvID),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          sequenceWidget('Maior sequência sem perder', coachBestResults.maxSequenceNoLosses.toString(), coachBestResults.maxSequenceNoLossesClubID),
                          sequenceWidget('Maior sequência de vitórias',coachBestResults.maxSequenceVictory.toString(), coachBestResults.maxSequenceVictoryClubID),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget changeClub(BuildContext context){
  return Column(
    children: [
      Container(
        color: AppColors().greyTransparent,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: GestureDetector(
          onTap:(){
            if(!alreadyChangedClubThisSeason){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChangeClub()));
            }else{
              customToast('Você já mudou de clube essa temporada');
            }
          },
          child: const Text('Mudar de Clube',style: EstiloTextoBranco.text16),
        ),
      ),
    ],
  );
}
Widget trophyWidget(int i){
  late String name;
  late String image;
  late int qntd;

  if(i==0){
    name = 'Campeonatos Nacionais';
    image = getTrophyImage(My().campeonatoName);
    qntd = HistoricFunctions().myLeagueTitles();
  }
  if(i==1){
    name = 'Campeonatos Internacionais';
    image = getTrophyImage(My().getMyInternationalLeague());
    qntd = HistoricFunctions().myInternationalTitle();
  }
  return Column(
    children: [
      SizedBox(
          width: 100,
          child: Text(name,textAlign:TextAlign.center,style: EstiloTextoBranco.text14)
      ),
      Image.asset('assets/trophy/$image.png',height: 100,width: 100),
      Text(qntd.toString(),style: EstiloTextoBranco.text20),
    ],
  );
}

Widget pieChart(Map<String,double> dataMap){
  return                   SizedBox(
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
            width: 150,
            child: Text(myClubData.clubName,style: EstiloTextoBranco.text14)
        ),
        Text('${myClubData.leagueName}: \n${myClubData.internationalLeagueName}: ',style: EstiloTextoBranco.text12),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text('${myClubData.leaguePosition}º\n${myClubData.internationalLeaguePosition}',style: EstiloTextoBranco.text14),
        ),
      ],
    ),
  );
}
