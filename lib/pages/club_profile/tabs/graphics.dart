import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/data_graphics.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/historic_positions_this_year.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/menu/widgets/menu_classification.dart';
import 'package:fifa/pages/table/table_nacional.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/bottom_sheet/bottom_sheet_titles.dart';
import 'package:fifa/widgets/trophy.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../classes/club.dart';

class ClubGraphics extends StatefulWidget {
  final Club club;
  const ClubGraphics({Key? key,required this.club}) : super(key: key);

  @override
  State<ClubGraphics> createState() => _ClubGraphicsState();
}

class _ClubGraphicsState extends State<ClubGraphics> {

  late TooltipBehavior _tooltipBehavior;
  late TooltipBehavior _tooltipBehavior2;
  late TooltipBehavior _tooltipBehavior3;

  DataGraphics dataGraphics = DataGraphics();

  ///////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    dataGraphics.getData(widget.club);
    super.initState();
  }

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    _tooltipBehavior = TooltipBehavior(enable: true);
    _tooltipBehavior2 = TooltipBehavior(enable: true);
    _tooltipBehavior3 = TooltipBehavior(enable: true);

    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Padding(
            padding: const EdgeInsets.only(top:6.0, left: 6, right: 6),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  currentPosition(widget.club, dataGraphics),

                  InkWell(
                    onTap: (){
                      navigatorPush(context, TableNacional(chosenLeagueIndex: widget.club.leagueID));
                    },
                    child: Container(
                        color: AppColors().greyTransparent,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: classification3(widget.club.index, widget.club.leagueID)),
                  ),

                  graphics(dataGraphics),

                  positionThisYear(),


                  totalTrophyWidget(widget.club, dataGraphics),

                  histogram(dataGraphics.data, _tooltipBehavior2, "Nacional"),
                  histogram(dataGraphics.dataInternational, _tooltipBehavior3, "Internacional"),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget histogram(List<ClassificationData> dataGraphics,
      TooltipBehavior _tooltipbehave, String title) {

    List<ClassificationData> dataGraphicsHist = List.from(dataGraphics);
    dataGraphicsHist.removeWhere((element) => element.position >= 32);

    if (dataGraphicsHist.isNotEmpty) {
      return Container(
        height: 200,
        margin: const EdgeInsets.symmetric(vertical: 4),
        color: AppColors().greyTransparent,
        child: SfCartesianChart(
            tooltipBehavior: _tooltipbehave,
            title: ChartTitle(text: 'Histograma ' + title, alignment: ChartAlignment.near,
                textStyle: EstiloTextoBranco.negrito14),
            primaryXAxis: NumericAxis(labelStyle: EstiloTextoBranco.text12),
            primaryYAxis: NumericAxis(labelStyle: EstiloTextoBranco.text12),
            series: <ChartSeries>[
              histogramSeries(dataGraphicsHist, widget.club.colors.primaryColor)
            ]
        ),
      );
    } else {
      return Container();
    }
  }


  HistogramSeries histogramSeries(List<ClassificationData> dataSource, Color color) {
    return HistogramSeries<ClassificationData, double>(
        color: color,
        dataSource: dataSource,
        binInterval: 2,
        yValueMapper: (ClassificationData data, _) => data.position);
  }

  Widget graphics(DataGraphics dataGraphics) {

    return Container(
      color: AppColors().greyTransparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 260,
              width: dataGraphics.dataInternational.length > dataGraphics.data.length
                  ? dataGraphics.dataInternational.length * 35 + 50
                  : dataGraphics.data.length * 35 + 50,
              child: SfCartesianChart(
                title: ChartTitle(text: 'Historic', alignment: ChartAlignment.near,
                    textStyle: EstiloTextoBranco.negrito14),
                tooltipBehavior: _tooltipBehavior,
                //https://pub.dev/documentation/syncfusion_flutter_charts/latest/charts/SfCartesianChart-class.html?utm_source=pubdev&utm_medium=listing&utm_campaign=flutter-charts-pubdev
                // Initialize category axis
                primaryXAxis: CategoryAxis(
                  labelStyle: EstiloTextoBranco.text12,
                ),
                series: <ChartSeries>[
                  // Initialize line series
                  LineSeries<ClassificationData, String>(
                    xAxisName: Translation(context).text.years,
                    yAxisName: Translation(context).text.position,
                    name: widget.club.name,
                    dataSource: dataGraphics.data,
                    enableTooltip: true,
                    xValueMapper: (ClassificationData data, _) =>
                    //Para mostrar apertura e clausura
                    data.year.toString().substring(5) == '5'
                        ? data.year.toString() //ano.5 -> ano.5
                        : data.year.toInt().toString(),
                    //ano.0 -> ano
                    yValueMapper: (ClassificationData data, _) => data.position,
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

                  LineSeries<ClassificationData, String>(
                    color: Colors.red,
                    xAxisName: Translation(context).text.years,
                    yAxisName: Translation(context).text.position,
                    name: widget.club.name,
                    dataSource: dataGraphics.dataInternational,
                    enableTooltip: true,
                    xValueMapper: (ClassificationData data, _) => data.year.toInt().toString(),
                    //ano.0 -> ano
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
          ),
        ],
      ),
    );
  }


  Widget totalTrophyWidget(Club club, DataGraphics dataGraphics) {
    return Container(
      width: Sized(context).width,
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          Column(
            children: [
              Text(Translation(context).text.average,
                  style: EstiloTextoBranco.text14),
              Text(Translation(context).text.last10Years,
                  style: EstiloTextoBranco.text14),
              const SizedBox(height: 6),
              Text(dataGraphics.averagePosition10years.toString() + 'º',
                  style: EstiloTextoBranco.text20),
            ],
          ),
          Column(
            children: [
              const Text('G-4', style: EstiloTextoBranco.text14),
              Text(Translation(context).text.years,
                  style: EstiloTextoBranco.text14),
              const SizedBox(height: 6),
              Text(dataGraphics.g4Years.toString(),
                  style: EstiloTextoBranco.text20),
            ],
          ),

          //1 divisao
          Column(
            children: [
              const Text('1ª Divisão',
                  style: EstiloTextoBranco.text14),
              Text(Translation(context).text.years,
                  style: EstiloTextoBranco.text14),
              const SizedBox(height: 6),
              Text(dataGraphics.n1ndivision.toString(),
                  style: EstiloTextoBranco.text20),
            ],
          ),

          //2 divisao
          Column(
            children: [
              Text(Translation(context).text.division2,
                  style: EstiloTextoBranco.text14),
              Text(Translation(context).text.years,
                  style: EstiloTextoBranco.text14),
              const SizedBox(height: 6),
              Text(dataGraphics.n2ndivision.toString(),
                  style: EstiloTextoBranco.text20),
            ],
          ),

        ],
      ),
    );
  }

  Widget currentPosition(Club club, DataGraphics dataGraphics) {
    return Container(
      width: Sized(context).width,
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          //POSIÇÃO ATUAL
          Column(
            children: [
              Text(Translation(context).text.position,
                  style: EstiloTextoBranco.text16),
              Stack(
                children: [
                  Opacity(opacity: 0.3,
                      child: Image.asset(
                          FIFAImages().campeonatoLogo(club.leagueName),
                          height: 50, width: 50)),
                  Container(
                      width: 50, height: 50,
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(dataGraphics.currentPosition.toString() + 'º',
                          textAlign: TextAlign.center,
                          style: EstiloTextoBranco.negrito22)),
                ],
              ),
            ],
          ),

          //TITULOS NACIONAIS
          GestureDetector(
            onTap: () {
              bottomSheetShowTitles(
                  context, club.leagueName, dataGraphics.data);
            },
            child: TrophyWidget(name: club.leagueName, qntd: dataGraphics.nTitulos, scale: 0.8),
          ),

          //TITULOS INTERNACIONAIS
          GestureDetector(
            onTap: () {
              bottomSheetShowTitles(context, club.internationalLeagueName,
                  dataGraphics.dataInternational);
            },
            child: TrophyWidget(name: club.internationalLeagueName, qntd: dataGraphics.nTitulosInternational, scale: 0.8),
          ),

          //TITULOS MUNDIAIS
          GestureDetector(
            onTap: () {
              bottomSheetShowTitles(context, LeagueOfficialNames().mundial,
                  dataGraphics.dataMundial);
            },
            child: TrophyWidget(name: LeagueOfficialNames().mundial, qntd: dataGraphics.nTitulosMundial, scale: 0.8),
          ),


        ],
      ),
    );
  }


  Widget positionThisYear() {
    List<int> positions = HistoricPositionsThisYear().getGlobal(
        widget.club.name);

    List<GraphPointInt> lista = [];
    for (int week = 0; week < positions.length; week++) {
      if (testInitRodada == 1) {
        lista.add(GraphPointInt(week, positions[week]));
      }
    }

    return lista.isNotEmpty ? Container(
      width: Sized(context).width,
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SfCartesianChart(
            title: ChartTitle(text: 'Histórico de posição ' + ano.toString(), alignment: ChartAlignment.near,
                textStyle: EstiloTextoBranco.negrito14),
            //https://pub.dev/documentation/syncfusion_flutter_charts/latest/charts/SfCartesianChart-class.html?utm_source=pubdev&utm_medium=listing&utm_campaign=flutter-charts-pubdev
            // Initialize category axis
            primaryXAxis: CategoryAxis(
              labelStyle: EstiloTextoBranco.text12,
            ),
            primaryYAxis: CategoryAxis(
              labelStyle: EstiloTextoBranco.text12,
            ),
            series: <ChartSeries>[
              // Initialize line series
              LineSeries<GraphPointInt, String>(
                xAxisName: Translation(context).text.years,
                yAxisName: Translation(context).text.position,
                name: widget.club.name,
                dataSource: lista,
                enableTooltip: true,
                xValueMapper: (GraphPointInt data, _) =>
                (data.x + 1).toString() + 'ª',
                yValueMapper: (GraphPointInt data, _) => data.y,
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  color: Colors.white,
                ),
              ),

            ],
          ),
        ],
      ),
    ) : Container();
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
}