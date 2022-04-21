import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/historic_champions.dart';
import 'package:fifa/widgets/button/button_return.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class _ClassificationData {
  _ClassificationData(this.year, this.position);

  final int year;
  final int position;
}

class ClubGraphics extends StatefulWidget {
  const ClubGraphics({Key? key}) : super(key: key);

  @override
  State<ClubGraphics> createState() => _ClubGraphicsState();
}

class _ClubGraphicsState extends State<ClubGraphics> {

  Map results = mapChampions(My().getLeagueName());
  late TooltipBehavior _tooltipBehavior;
  List<_ClassificationData> data = [];

  @override
  Widget build(BuildContext context) {

    _tooltipBehavior = TooltipBehavior( enable: true);
    data=[];
    for(int year in results.keys){
      if(results[year].contains(My().clubName)){
        data.add(_ClassificationData(year, results[year].indexOf(My().clubName)+1));
      }else{
        data.add(_ClassificationData(year, 21));
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text('Desempenho',style: EstiloTextoBranco.text16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    height: 300,
                    width: data.length*20,
                    color: AppColors().greyTransparent,
                    child: SfCartesianChart(
                      tooltipBehavior: _tooltipBehavior,
                      //https://pub.dev/documentation/syncfusion_flutter_charts/latest/charts/SfCartesianChart-class.html?utm_source=pubdev&utm_medium=listing&utm_campaign=flutter-charts-pubdev
                      // Initialize category axis
                      primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          // Initialize line series
                          LineSeries<_ClassificationData, String>(
                              dataSource: data,
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

              ],
            ),
          ),

          //BOTAO DE VOLTAR
          returnButton(context),
        ],
      ),
    );
  }
}

/*

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