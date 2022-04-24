import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/historic.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/historic_champions.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/values/league_trophy_image.dart';
import 'package:fifa/widgets/button/button_return.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../classes/club.dart';

class ClubGraphics extends StatefulWidget {
  final Club club;
  const ClubGraphics({Key? key,required this.club}) : super(key: key);

  @override
  State<ClubGraphics> createState() => _ClubGraphicsState();
}

class _ClubGraphicsState extends State<ClubGraphics> {

  late TooltipBehavior _tooltipBehavior;

  @override
  Widget build(BuildContext context) {

    _tooltipBehavior = TooltipBehavior( enable: true);

    DataGraphics dataGraphics = DataGraphics();
    dataGraphics.getData(widget.club);

    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text('Desempenho',style: EstiloTextoBranco.text16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 300,
                    width: dataGraphics.data.length*20,
                    color: AppColors().greyTransparent,
                    child: SfCartesianChart(
                      tooltipBehavior: _tooltipBehavior,
                      //https://pub.dev/documentation/syncfusion_flutter_charts/latest/charts/SfCartesianChart-class.html?utm_source=pubdev&utm_medium=listing&utm_campaign=flutter-charts-pubdev
                      // Initialize category axis
                      primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          // Initialize line series
                          LineSeries<_ClassificationData, String>(
                              dataSource: dataGraphics.data,
                              enableTooltip: true,
                              xValueMapper: (_ClassificationData data, _) => data.year.toString(),
                              yValueMapper: (_ClassificationData data, _) => data.position,
                              dataLabelSettings:const DataLabelSettings(isVisible : true,color: Colors.white),
                            markerSettings: const MarkerSettings(
                                isVisible: true,
                                height: 4,
                                width: 4,
                                borderWidth: 3,
                                borderColor: Colors.white),
                          )
                        ],
                    ),
            ),
                ),

                totalTrophyWidget(widget.club,dataGraphics.nTitulos,dataGraphics.n2ndivision),

              ],
            ),
          ),

        ],
      ),
    );
  }

Widget totalTrophyWidget(Club club, int nTitulos, int n2ndivision){
  return Container(
    width: Sized(context).width,
    color: AppColors().greyTransparent,
    margin: const EdgeInsets.all(4),
    padding: const EdgeInsets.all(4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //TITULOS
        Column(
          children: [
            const Text('Títulos',style: EstiloTextoBranco.text16),
            Image.asset('assets/trophy/${getTrophyImage(club.leagueName)}.png',height: 100,width: 100),
            Text(nTitulos.toString(),style: EstiloTextoBranco.text16),
          ],
        ),

        Column(
          children: [
            const Text('2ªdivisão',style: EstiloTextoBranco.text16),
            Text(n2ndivision.toString(),style: EstiloTextoBranco.text16),
            const Text('anos',style: EstiloTextoBranco.text16),
          ],
        )

      ],
    ),
  );
}

}
class _ClassificationData {
  _ClassificationData(this.year, this.position);

  final int year;
  final int position;
}

class DataGraphics{

  int nTitulos = 0;
  int n2ndivision = 0;
  List<_ClassificationData> data=[];

  getData(Club club){
    //novas temporadas
    for(int year=anoInicial; year<ano; year++){
      try {
        List classification = HistoricFunctions().funcHistoricListAll(year, club.leagueName);
        int position = classification.indexOf(club.index) + 1;
        if(is2ndDivision( club.leagueName)){
          position += 20;
        }
        data.add(_ClassificationData(year, position));
        addTitlesCount(position);
        add2ndDivisionCount(position);
      }catch(e){
        data.add(_ClassificationData(year, 21));
        add2ndDivisionCount(21);
      }
    }
    //historico de campeoes
    Map results = mapChampions(league1stDivision(club.leagueName));
    for(int year in results.keys){
      if(results[year].contains(club.name)){
        int position = results[year].indexOf(club.name)+1;
        data.add(_ClassificationData(year, position));
        addTitlesCount(position);
        add2ndDivisionCount(position);
      }else{
        data.add(_ClassificationData(year, 21));
        add2ndDivisionCount(21);
      }
    }
  }

  addTitlesCount(int position){
    if(position == 1){
      nTitulos ++;
    }
  }
  add2ndDivisionCount(int position){
    if(position >= 21){
      n2ndivision ++;
    }
  }
}
/*

//GRAPH PARAMETERS
                    //Enable the trackball
                    trackball: const SparkChartTrackball(
                        activationMode: SparkChartActivationMode.tap),
                    //Enable marker
                    marker: const SparkChartMarker(
                        displayMode: SparkChartMarkerDisplayMode.all),
                    //Enable data label
                    labelDisplayMode: SparkChartLabelDisplayMode.all,
                    xValueMapper: (int index) => data[index].year,
                    yValueMapper: (int index) => data[index].position,
                    dataCount: data.length,
                    axisLineColor: Colors.white,
                    color: Colors.red,
                    labelStyle: EstiloTextoBranco.text16,
 */