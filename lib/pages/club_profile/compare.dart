import 'dart:async';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/page_controller/club_profile/data_graphics.dart';
import 'package:fifa/popup/popup_select_club_compare.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
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
  late Club club;

  ///////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    club = Club(index: my.clubID);
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

    return Scaffold(

        body:  Stack(
            children: [

              Images().getWallpaper(),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    backButtonText(context, Translation(context).text.compare),
                    header(),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: rowNumbers(
                        Translation(context).text.pointsTotal,
                        dataGraphicsCompare.pointsTotal.toStringAsFixed(0),
                        dataGraphics.pointsTotal.toStringAsFixed(0),
                        EstiloTextoBranco.negrito22
                      ),
                    ),

                    const Divider(color: Colors.white),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [

                            nationalTitle(),
                            nationalComparation(),
                            graphics(dataGraphics,dataGraphicsCompare),
                            histogramNational(dataGraphics,dataGraphicsCompare),

                            const Divider(color: Colors.white),
                            internationalTitle(),
                            internationalComparation(),
                            graphics2(dataGraphics,dataGraphicsCompare),
                            histogramInternational(dataGraphics,dataGraphicsCompare),


                            const Divider(color: Colors.white),
                            mundialTitle(),
                            mundialComparation(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

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
                Text(club.name,style: EstiloTextoBranco.text16),
              ],
            ),

            Row(
              children: [

                Image.asset(Images().getEscudo(club.name),height: 50,width: 50),

                Column(
                  children: [
                    Text(club.getOverall().toStringAsFixed(1),style: EstiloTextoBranco.text20),
                    funcFlagsList(club.nationality, 15, 25),
                    changeClub(isClubLeft: true),
                  ],
                ),

              ],
            ),
          ],
        ),

        Column(
          children: [
            selectYearwidget(context, 2022),
            selectYearwidget(context, 1960),
          ],
        ),
        //TIME 2
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
                Text(club2.name,style: EstiloTextoBranco.text16),
              ],
            ),
            Row(
              children: [

                Column(
                  children: [
                    Text(club2.getOverall().toStringAsFixed(1),style: EstiloTextoBranco.text20),
                    funcFlagsList(club2.nationality, 15, 25),
                    changeClub(isClubLeft: false),
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

  Widget selectYearwidget(BuildContext context, int year){
    return GestureDetector(
      onTap: (){
        customToast(Translation(context).text.inDevelopment);
      },
      child: Container(
        color: AppColors().greyTransparent,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: year>=2022
            ? Text('Até: '+year.toString(),style: EstiloTextoBranco.text12)
            : Text('Desde: '+year.toString(),style: EstiloTextoBranco.text12),

      ),
    );
  }

  Widget changeClub({required bool isClubLeft}){
    return GestureDetector(
      onTap: (){
        PopupSelectClub popupConfig = PopupSelectClub();
        popUpSelectClub(originalContext: context, popupConfig: popupConfig);
        Timer.periodic(const Duration(milliseconds: 100), (timer) {
          if (popupConfig.popupClosed) {
            if(isClubLeft){
              club=popupConfig.newClub;
              dataGraphicsCompare = DataGraphics();
              dataGraphicsCompare.getData(popupConfig.newClub);
            }else{
              club2=popupConfig.newClub;
              dataGraphics = DataGraphics();
              dataGraphics.getData(popupConfig.newClub);
            }
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

  Widget nationalComparation(){
    return Container(
      width: Sized(context).width*0.9,
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          rowNumbers(Translation(context).text.points, dataGraphicsCompare.pointsNational.toStringAsFixed(0), dataGraphics.pointsNational.toStringAsFixed(0),EstiloTextoBranco.negrito22),
          //TITULOS
          Row(
            children: [
              Image.asset('assets/trophy/${getTrophyImage(club.leagueName)}.png',height: 100,width: 100),
              Text(dataGraphicsCompare.nTitulos.toString(),style: EstiloTextoBranco.text20),

              Expanded(child: Text(Translation(context).text.titles,textAlign:TextAlign.center,style: EstiloTextoBranco.text16)),

              Text(dataGraphics.nTitulos.toString(),style: EstiloTextoBranco.text20),
              Image.asset('assets/trophy/${getTrophyImage(club2.leagueName)}.png',height: 100,width: 100),
            ],
          ),

          rowNumbers(
            Translation(context).text.actualPosition,
            dataGraphicsCompare.currentPosition.toString()+'º',
            dataGraphics.currentPosition.toString()+'º',
          ),
          const SizedBox(height: 10),

          rowNumbers(
              Translation(context).text.average+' '+Translation(context).text.last5Years,
              dataGraphicsCompare.averagePosition5years.toString()+'º',
              dataGraphics.averagePosition5years.toString()+'º',
          ),

          rowNumbers(
              Translation(context).text.average+' '+Translation(context).text.last10Years,
              dataGraphicsCompare.averagePosition10years.toString()+'º',
              dataGraphics.averagePosition10years.toString()+'º',
          ),
          rowNumbers(
              Translation(context).text.average+' '+Translation(context).text.total,
              dataGraphicsCompare.averagePositionTotal.toString()+'º',
              dataGraphics.averagePositionTotal.toString()+'º',
          ),

          rowNumbers('G-4', dataGraphicsCompare.g4Years.toString(), dataGraphics.g4Years.toString()),
          rowNumbers('G-10', dataGraphicsCompare.g10Years.toString(), dataGraphics.g10Years.toString()),
          rowNumbers(Translation(context).text.division2, dataGraphicsCompare.n2ndivision.toString(), dataGraphics.n2ndivision.toString()),


        ],
      ),
    );
  }

  Widget internationalComparation(){
    return Container(
      width: Sized(context).width*0.9,
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          rowNumbers(Translation(context).text.points, dataGraphicsCompare.pointsInternational.toStringAsFixed(0), dataGraphics.pointsInternational.toStringAsFixed(0),EstiloTextoBranco.negrito22),
          //TITULOS
          Row(
            children: [
              Image.asset('assets/trophy/${getTrophyImage(club.internationalLeagueName)}.png',height: 100,width: 100),
              Text(dataGraphicsCompare.nTitulosInternational.toString(),style: EstiloTextoBranco.text20),

              Expanded(child: Text(Translation(context).text.titles,textAlign:TextAlign.center,style: EstiloTextoBranco.text16)),

              Text(dataGraphics.nTitulosInternational.toString(),style: EstiloTextoBranco.text20),
              Image.asset('assets/trophy/${getTrophyImage(club2.internationalLeagueName)}.png',height: 100,width: 100),
            ],
          ),

          rowNumbers(
            Translation(context).text.finals,
            dataGraphicsCompare.finalsInternational.toString(),
            dataGraphics.finalsInternational.toString(),
          ),

          rowNumbers(
            Translation(context).text.semis,
            dataGraphicsCompare.semifinalsInternational.toString(),
            dataGraphics.semifinalsInternational.toString(),
          ),
          rowNumbers(
            Translation(context).text.round8,
            dataGraphicsCompare.round8International.toString(),
            dataGraphics.round8International.toString(),
          ),
          rowNumbers(
            Translation(context).text.round16,
            dataGraphicsCompare.round16International.toString(),
            dataGraphics.round16International.toString(),
          ),
          rowNumbers(
            Translation(context).text.participations,
            dataGraphicsCompare.participationInternational.toString(),
            dataGraphics.participationInternational.toString(),
          ),


        ],
      ),
    );
  }

  Widget rowNumbers(String text, String info1, String info2,[TextStyle _style = EstiloTextoBranco.text20]){
    double _width = 80;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const SizedBox(height: 10),
          SizedBox(width:_width,child: Text(info1,textAlign:TextAlign.center,style: _style)),
          Expanded(child: Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.text16)),
          SizedBox(width:_width,child: Text(info2,textAlign:TextAlign.center,style: _style)),
        ],
      ),
    );
  }
  Widget nationalTitle(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(FIFAImages().campeonatoLogo(club.leagueName),height: 40,width: 40),
        Text(Translation(context).text.nationalLeague,style: EstiloTextoBranco.negrito22),
        Image.asset(FIFAImages().campeonatoLogo(club2.leagueName),height: 40,width: 40),
      ],
    );
  }
  Widget internationalTitle(){
    return Container(
      margin: const EdgeInsets.only(top:20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(FIFAImages().campeonatoInternacionalLogo(club.internationalLeagueName),height: 40,width: 40),
          Text(Translation(context).text.international,style: EstiloTextoBranco.negrito22),
          Image.asset(FIFAImages().campeonatoInternacionalLogo(club2.internationalLeagueName),height: 40,width: 40),
        ],
      ),
    );
  }
  Widget graphics2(DataGraphics dataGraphics,DataGraphics dataGraphicsCompare){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 300,
        width: dataGraphics.dataInternational.length > dataGraphicsCompare.dataInternational.length
              ? dataGraphics.dataInternational.length*23+50
              : dataGraphicsCompare.dataInternational.length*23+50 ,
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
              name: club.name,
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

  Widget mundialTitle(){
    return Container(
      margin: const EdgeInsets.only(top:20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/league_logos/mundial.png',height: 40,width: 40),
          Text(Translation(context).text.mundial,style: EstiloTextoBranco.negrito22),
          Image.asset('assets/league_logos/mundial.png',height: 40,width: 40),
        ],
      ),
    );
  }

  Widget mundialComparation(){
    return Container(
      width: Sized(context).width*0.9,
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          rowNumbers(Translation(context).text.points, dataGraphicsCompare.pointsmundial.toStringAsFixed(0), dataGraphics.pointsmundial.toStringAsFixed(0),EstiloTextoBranco.negrito22),
          //TITULOS
          Row(
            children: [
              Image.asset('assets/trophy/${getTrophyImage(LeagueOfficialNames().mundial)}.png',height: 100,width: 100),
              Text(dataGraphicsCompare.nTitulosMundial.toString(),style: EstiloTextoBranco.text20),

              Expanded(child: Text(Translation(context).text.titles,textAlign:TextAlign.center,style: EstiloTextoBranco.text16)),

              Text(dataGraphics.nTitulosMundial.toString(),style: EstiloTextoBranco.text20),
              Image.asset('assets/trophy/${getTrophyImage(LeagueOfficialNames().mundial)}.png',height: 100,width: 100),
            ],
          ),


          rowNumbers(
            Translation(context).text.finals,
            dataGraphicsCompare.finalsMundial.toString(),
            dataGraphics.finalsMundial.toString(),
          ),


        ],
      ),
    );
  }
}