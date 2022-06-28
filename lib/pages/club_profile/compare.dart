import 'dart:async';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/page_controller/club_profile/data_graphics.dart';
import 'package:fifa/popup/popup_select_club_compare.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/league_trophy_image.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../theme/colors.dart';

class Compare extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final Club club;
  const Compare({Key? key,required this.club}) : super(key: key);
  @override
  _CompareState createState() => _CompareState();
}

class _CompareState extends State<Compare> {

  late TooltipBehavior _tooltipBehavior;
  DataGraphics dataGraphics = DataGraphics();
  DataGraphics dataGraphicsCompare = DataGraphics();
  My my = My();
  late Club club2;

  ///////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    club2 = widget.club;
    dataGraphics.getData(club2);
    dataGraphicsCompare.getData(Club(index: my.clubID));
    super.initState();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    _tooltipBehavior = TooltipBehavior( enable: true);

    Club club = Club(index: my.clubID);

    return Scaffold(

        body:  Stack(
            children: [

              Images().getWallpaper(),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    const SizedBox(height: 40),
                    header(),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [

                            graphics(dataGraphics,dataGraphicsCompare),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                totalTrophyWidget(club,dataGraphicsCompare),
                                totalTrophyWidget(club2,dataGraphics),
                              ],
                            ),
                            graphics2(dataGraphics,dataGraphicsCompare),

                            histogramNational(dataGraphics,dataGraphicsCompare),
                            histogramInternational(dataGraphics,dataGraphicsCompare),

                          ],
                        ),
                      ),
                    ),

                      ],
                    ),

                  ],
                )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget header(){
    My my = My();
    Club club = Club(index: my.clubID);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        backButton(context),

        Column(
          children: [
            Row(
              children: [
                Container(
                  height: 10,width: 10,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),
                Text(club.name,style: EstiloTextoBranco.text20),
              ],
            ),
            Row(
              children: [

                Image.asset(Images().getEscudo(club.name),height: 50,width: 50),

                Column(
                  children: [
                    Text(club.getOverall().toStringAsFixed(1),style: EstiloTextoBranco.text20),
                    funcFlagsList(club.nationality, 15, 25),
                    changeClub(),
                  ],
                ),

              ],
            ),
          ],
        ),


        Column(
          children: [
            Row(
              children: [
                Container(
                  height: 10,width: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                Text(club2.name,style: EstiloTextoBranco.text20),
              ],
            ),
            Row(
              children: [

                Column(
                  children: [
                    Text(club2.getOverall().toStringAsFixed(1),style: EstiloTextoBranco.text20),
                    funcFlagsList(club2.nationality, 15, 25),
                    changeClub(),
                  ],
                ),

                Image.asset(Images().getEscudo(club2.name),height: 50,width: 50),

              ],
            ),
          ],
        ),

      ],
    );
  }

  Widget changeClub(){
    return GestureDetector(
      onTap: (){
        PopupSelectClub popupConfig = PopupSelectClub();
        popUpSelectClub(originalContext: context, popupConfig: popupConfig);
        Timer.periodic(const Duration(milliseconds: 100), (timer) {
          if (popupConfig.popupClosed) {
            club2=popupConfig.newClub;
            dataGraphics = DataGraphics();
            dataGraphics.getData(popupConfig.newClub);
            setState((){});
            timer.cancel();
          }
        });
      },
      child: Container(
        color: AppColors().greyTransparent,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4),
        child: const Text('Selecionar',style: EstiloTextoBranco.text16),
      ),
    );
  }

  Widget graphics(DataGraphics dataGraphics,DataGraphics dataGraphicsCompare){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 300,
        width:  dataGraphics.data.length > dataGraphicsCompare.data.length
            ? dataGraphics.data.length*23+50
            : dataGraphicsCompare.data.length*23+50 ,
        color: AppColors().greyTransparent,
        child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          //https://pub.dev/documentation/syncfusion_flutter_charts/latest/charts/SfCartesianChart-class.html?utm_source=pubdev&utm_medium=listing&utm_campaign=flutter-charts-pubdev
          // Initialize category axis
          primaryXAxis: CategoryAxis(labelStyle: EstiloTextoBranco.text12),
          primaryYAxis: NumericAxis(labelStyle: EstiloTextoBranco.text12),
          series: <ChartSeries>[
            // Initialize line series
            LineSeries<ClassificationData, String>(
              xAxisName: Translation(context).text.years,
              yAxisName: Translation(context).text.position,
              name: My().clubName,
              dataSource: dataGraphicsCompare.data,
              enableTooltip: true,
              xValueMapper: (ClassificationData data, _) =>
              //Para mostrar apertura e clausura
              data.year.toString().substring(5) == '5'
                  ? data.year.toString()     //ano.5 -> ano.5
                  : data.year.toInt().toString(), //ano.0 -> ano
              yValueMapper: (ClassificationData data, _) => data.position,
              //dataLabelSettings:const DataLabelSettings(isVisible : true,color: Colors.white),
              markerSettings: const MarkerSettings(
                  isVisible: true,
                  height: 4,
                  width: 4,
                  borderWidth: 3,
                  borderColor: Colors.white
              ),
            ),

            // Initialize line series
            LineSeries<ClassificationData, String>(
              xAxisName: Translation(context).text.years,
              yAxisName: Translation(context).text.position,
              name: club2.name,
              dataSource: dataGraphics.data,
              enableTooltip: true,
              xValueMapper: (ClassificationData data, _) =>
              //Para mostrar apertura e clausura
              data.year.toString().substring(5) == '5'
                  ? data.year.toString()     //ano.5 -> ano.5
                  : data.year.toInt().toString(), //ano.0 -> ano
              yValueMapper: (ClassificationData data, _) => data.position,
              dataLabelSettings:const DataLabelSettings(isVisible : true,color: Colors.white),
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
      ),
    );
  }

  Widget totalTrophyWidget(Club club, DataGraphics dataGraphics){
    return Container(
      width: Sized(context).width*0.4,
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          //Pontos
          Text(Translation(context).text.points,style: EstiloTextoBranco.text16),
          Text(dataGraphics.points.toStringAsFixed(0),style: EstiloTextoBranco.text20),

          //TITULOS
          Column(
            children: [
              Text(Translation(context).text.titles,style: EstiloTextoBranco.text16),
              Image.asset('assets/trophy/${getTrophyImage(club.leagueName)}.png',height: 100,width: 100),
              Text(dataGraphics.nTitulos.toString(),style: EstiloTextoBranco.text20),
            ],
          ),

          Column(
            children: [
              const SizedBox(height: 10),
              Text(Translation(context).text.average,style: EstiloTextoBranco.text16),
              Text(Translation(context).text.last10Years,style: EstiloTextoBranco.text16),
              Text(dataGraphics.averagePosition.toString()+'º',style: EstiloTextoBranco.text20),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              const Text('G-4',style: EstiloTextoBranco.text16),
              Text(dataGraphics.g4Years.toString(),style: EstiloTextoBranco.text20),
            ],
          ),

          Column(
            children: [
              const SizedBox(height: 10),
              Text(Translation(context).text.division2,style: EstiloTextoBranco.text16),
              Text(dataGraphics.n2ndivision.toString(),style: EstiloTextoBranco.text20),
            ],
          ),

        ],
      ),
    );
  }


  Widget graphics2(DataGraphics dataGraphics,DataGraphics dataGraphicsCompare){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 300,
        width: dataGraphics.data.length > dataGraphicsCompare.data.length
              ? dataGraphics.data.length*23+50
              : dataGraphicsCompare.data.length*23+50 ,
        color: AppColors().greyTransparent,
        child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          //https://pub.dev/documentation/syncfusion_flutter_charts/latest/charts/SfCartesianChart-class.html?utm_source=pubdev&utm_medium=listing&utm_campaign=flutter-charts-pubdev
          // Initialize category axis
          primaryXAxis: CategoryAxis(labelStyle: EstiloTextoBranco.text12),
          primaryYAxis: NumericAxis(labelStyle: EstiloTextoBranco.text12),
          series: <ChartSeries>[
            // Initialize line series
            LineSeries<ClassificationData, String>(
              color: Colors.blue,
              xAxisName: Translation(context).text.years,
              yAxisName: Translation(context).text.position,
              name: My().clubName,
              dataSource: dataGraphicsCompare.dataInternational,
              enableTooltip: true,
              xValueMapper: (ClassificationData data, _) => data.year.toInt().toString(), //ano.0 -> ano
              yValueMapper: (ClassificationData data, _) => data.position,
              //dataLabelSettings:const DataLabelSettings(isVisible : true,color: Colors.white),
              markerSettings: const MarkerSettings(
                  isVisible: true,
                  height: 4,
                  width: 4,
                  borderWidth: 3,
                  borderColor: Colors.white
              ),
            ),

            // Initialize line series
            LineSeries<ClassificationData, String>(
              color: Colors.red,
              xAxisName: Translation(context).text.years,
              yAxisName: Translation(context).text.position,
              name: club2.name,
              dataSource: dataGraphics.dataInternational,
              enableTooltip: true,
              xValueMapper: (ClassificationData data, _) => data.year.toInt().toString(), //ano.0 -> ano
              yValueMapper: (ClassificationData data, _) => data.position,
              dataLabelSettings:const DataLabelSettings(isVisible : true,color: Colors.white),
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
      ),
    );
  }

  Widget histogramNational(DataGraphics dataGraphics,DataGraphics dataGraphicsCompare){
    return SizedBox(
      height: 200,
      child: SfCartesianChart(
          title: ChartTitle(text: 'Histograma Nacional',textStyle: EstiloTextoBranco.text14),
          primaryXAxis: NumericAxis(labelStyle: EstiloTextoBranco.text12),
          primaryYAxis: NumericAxis(labelStyle: EstiloTextoBranco.text12),
          series: <ChartSeries>[
            histogramSeries(dataGraphics.data, Colors.transparent),
            histogramSeries(dataGraphics.data, Colors.red),
            histogramSeries(dataGraphicsCompare.data, Colors.blue),
          ]
      ),
    );
  }

  Widget histogramInternational(DataGraphics dataGraphics,DataGraphics dataGraphicsCompare){
    List<ClassificationData> dataSource1 = List.from(dataGraphics.dataInternational);
    dataSource1.removeWhere((element) => element.position>=32);

    List<ClassificationData> dataSource2 = List.from(dataGraphicsCompare.dataInternational);
    dataSource2.removeWhere((element) => element.position>=32);
    if(dataSource1.isNotEmpty || dataSource2.isNotEmpty) {
      return SizedBox(
        height: 200,
        child: SfCartesianChart(
            title: ChartTitle(text: 'Histograma Internacional',
                textStyle: EstiloTextoBranco.text14),
            primaryXAxis: NumericAxis(labelStyle: EstiloTextoBranco.text12),
            primaryYAxis: NumericAxis(labelStyle: EstiloTextoBranco.text12),
            series: <ChartSeries>[
              dataSource1.isNotEmpty
                  ? histogramSeries(dataSource1, Colors.transparent)
                  : histogramSeries(dataSource2, Colors.transparent),
              dataSource1.isNotEmpty
                  ? histogramSeries(dataSource1, Colors.red)
                  : histogramSeries(dataSource2, Colors.transparent),
              dataSource2.isNotEmpty
                  ? histogramSeries(dataSource2, Colors.blue)
                  : histogramSeries(dataSource1, Colors.transparent),
            ]
        ),
      );
    }else{
      return Container();
    }
  }

  HistogramSeries histogramSeries(List<ClassificationData> dataSource, Color color){
    return HistogramSeries<ClassificationData, double>(
        color: color,
        dataSource: dataSource,
        binInterval: 2,
        yValueMapper: (ClassificationData data, _) => data.position);
  }
}