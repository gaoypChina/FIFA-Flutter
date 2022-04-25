import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/page_controller/club_profile/data_graphics.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/league_trophy_image.dart';
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
                graphics(dataGraphics),

                totalTrophyWidget(widget.club,dataGraphics),

              ],
            ),
          ),

        ],
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget graphics(DataGraphics dataGraphics){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 300,
        width: dataGraphics.data.length*20+50,
        color: AppColors().greyTransparent,
        child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          //https://pub.dev/documentation/syncfusion_flutter_charts/latest/charts/SfCartesianChart-class.html?utm_source=pubdev&utm_medium=listing&utm_campaign=flutter-charts-pubdev
          // Initialize category axis
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            // Initialize line series
            LineSeries<ClassificationData, String>(
              xAxisName: 'Anos',
              yAxisName: 'Posição',
              dataSource: dataGraphics.data,
              enableTooltip: true,
              xValueMapper: (ClassificationData data, _) => data.year.toString(),
              yValueMapper: (ClassificationData data, _) => data.position,
              dataLabelSettings:const DataLabelSettings(isVisible : true,color: Colors.white),
              markerSettings: const MarkerSettings(
                  isVisible: true,
                  height: 4,
                  width: 4,
                  borderWidth: 3,
                  borderColor: Colors.white
              ),
            )
          ],
        ),
      ),
    );
}

Widget totalTrophyWidget(Club club, DataGraphics dataGraphics){
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
            Text(dataGraphics.nTitulos.toString(),style: EstiloTextoBranco.text16),
          ],
        ),

        Column(
          children: [
            const Text('Média',style: EstiloTextoBranco.text16),
            Text(dataGraphics.averagePosition.toString()+'º',style: EstiloTextoBranco.text16),
            const Text('Últimos 10 anos',style: EstiloTextoBranco.text16),
          ],
        ),
        Column(
          children: [
            const Text('G-4',style: EstiloTextoBranco.text16),
            Text(dataGraphics.g4Years.toString(),style: EstiloTextoBranco.text16),
            const Text('anos',style: EstiloTextoBranco.text16),
          ],
        ),

        Column(
          children: [
            const Text('2ªdivisão',style: EstiloTextoBranco.text16),
            Text(dataGraphics.n2ndivision.toString(),style: EstiloTextoBranco.text16),
            const Text('anos',style: EstiloTextoBranco.text16),
          ],
        ),

      ],
    ),
  );
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