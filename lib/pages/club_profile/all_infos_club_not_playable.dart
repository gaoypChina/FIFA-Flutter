import 'package:fifa/classes/image_class.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/page_controller/club_profile/data_graphics.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ClubProfileNotPlayable extends StatefulWidget {
  final String clubName;
  const ClubProfileNotPlayable({Key? key,required this.clubName}) : super(key: key);

  @override
  State<ClubProfileNotPlayable> createState() => _ClubProfileNotPlayableState();
}

class _ClubProfileNotPlayableState extends State<ClubProfileNotPlayable> {

  late TooltipBehavior _tooltipBehavior;

  DataGraphics dataGraphics = DataGraphics();
  ///////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    late String leagueName;
    late String clubCountry;
    try {
      clubCountry = ClubDetails().getCountry(widget.clubName);

    Map leagueNationality = getLeagueNationalityMap();
    leagueNationality.forEach((key, value) {
      if(value==clubCountry){
        leagueName = key;
      }
    });
    dataGraphics.getDataNotPlayabale(widget.clubName,leagueName,LeagueOfficialNames().championsLeague);
    }catch(e){
      //O CLUBE NÃO TEM INFORMAÇÕES NO CLUB DETAILS, Portanto não tem o que mostrar nessa página
      Navigator.pop(context);
    }
    super.initState();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    _tooltipBehavior = TooltipBehavior(enable: true);

  return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              backButtonText(context, widget.clubName),

              Row(
                children: [

                  Images().getEscudoWidget(widget.clubName,100,100),
                  Images().getUniformWidget(widget.clubName,150,150),
                ],
              ),
              Row(
                children: [
                  Text(ClubDetails().getStadium(widget.clubName),style: EstiloTextoBranco.text16),
                  Text(ClubDetails().getStadiumCapacityPointFormat(widget.clubName),style: EstiloTextoBranco.text16),
                ],
              ),
              Row(
                children: [
                  const Text('Rivais:',style: EstiloTextoBranco.text16),
                  Text(ClubDetails().getRivals(widget.clubName).toString(),style: EstiloTextoBranco.text16),
                ],
              ),
              Text(ClubDetails().getFoundationYear(widget.clubName).toString(),style: EstiloTextoBranco.text16),
              funcFlagsList(ClubDetails().getCountry(widget.clubName), 30, 50),

              dataGraphics.data.isNotEmpty ? graphics(dataGraphics) : Container(),

            ],
          ),
        ],
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

  Widget graphics(DataGraphics dataGraphics) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 300,
        width: dataGraphics.data.length * 23 + 50,
        color: AppColors().greyTransparent,
        child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          //https://pub.dev/documentation/syncfusion_flutter_charts/latest/charts/SfCartesianChart-class.html?utm_source=pubdev&utm_medium=listing&utm_campaign=flutter-charts-pubdev
          // Initialize category axis
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            // Initialize line series
            LineSeries<ClassificationData, String>(
              xAxisName: Translation(context).text.years,
              yAxisName: Translation(context).text.position,
              name: widget.clubName,
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

          ],
        ),
      ),
    );
  }
}
