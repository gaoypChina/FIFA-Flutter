import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/classes/data_graphics.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/pages/historic/historic_best_players.dart';
import 'package:fifa/theme/background_color/background_classification.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/historic_champions/historic_champions.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/bottom_sheet/bottom_sheet_league_classification.dart';
import 'package:fifa/widgets/bottom_sheet/bottom_sheet_titles.dart';
import 'package:fifa/widgets/stars.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ClubProfileNotPlayable extends StatefulWidget {
  final String clubName;
  const ClubProfileNotPlayable({Key? key,required this.clubName}) : super(key: key);

  @override
  State<ClubProfileNotPlayable> createState() => _ClubProfileNotPlayableState();
}

class _ClubProfileNotPlayableState extends State<ClubProfileNotPlayable> with TickerProviderStateMixin {

  late TooltipBehavior _tooltipBehavior;
  late TabController _tabController;

  DataGraphics dataGraphics = DataGraphics();
  ClubDetails clubdetails = ClubDetails();
  late String clubCountry;
  late String clubState;
  ///////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {

    _tabController = TabController(vsync: this, length: 3);

    clubState = clubdetails.getState(widget.clubName);

    try {
      clubCountry = clubdetails.getCountry(widget.clubName);

    dataGraphics.getDataNotPlayabale(widget.clubName, clubCountry, clubState);
    }catch(e){
      //O CLUBE NÃO TEM INFORMAÇÕES NO CLUB DETAILS, Portanto não tem o que mostrar nessa página
      Navigator.pop(context);
    }

    super.initState();
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    _tooltipBehavior = TooltipBehavior(enable: true);
    bool isPlayableClub = false;
    if(clubsAllNameList.contains(widget.clubName)){
      isPlayableClub = true;
    }
  return DefaultTabController(
    length: 3,
    child: Scaffold(
        body: Stack(
          children: [
            Images().getWallpaper(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //BACK BUTTON
                Container(
                  color: clubdetails.getColors(widget.clubName).primaryColor.withOpacity(0.7),
                  child: Row(
                    children: [
                      backButtonText(context, widget.clubName),
                      const Spacer(),
                      isPlayableClub ? Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: IconButton(onPressed: (){
                             Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: clubsAllNameList.indexOf(widget.clubName))));
                        }, icon: const Icon(Icons.outbond_rounded,color: Colors.white,size: 32,)),
                      ) : Container(),
                    ],
                  ),
                ),

                //HEADER
                Container(
                  padding: const EdgeInsets.only(left: 8.0,top: 8),
                  color: clubdetails.getColors(widget.clubName).primaryColor.withOpacity(0.3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Images().getEscudoWidget(widget.clubName,80,80),
                          starsWidgetFromOverall(clubdetails.getOverall(widget.clubName)),
                        ],
                      ),
                      Images().getUniformWidget(widget.clubName,100,100),
                      SizedBox(
                        width: Sized(context).width*0.34,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                funcFlagsList(clubdetails.getCountry(widget.clubName), 35, 50),
                                clubState.isNotEmpty ? funcFlagsList(clubdetails.getState(widget.clubName), 35, 50) : Container(),
                              ],
                            ),
                            Text(clubdetails.getFoundationYear(widget.clubName).toString(),style: EstiloTextoBranco.text16),
                            Row(
                              children: [
                                Expanded(child: Text(clubdetails.getStadium(widget.clubName),maxLines: 2, overflow: TextOverflow.ellipsis,style: EstiloTextoBranco.text14)),
                              ],
                            ),
                            Text(clubdetails.getStadiumCapacityPointFormat(widget.clubName),style: EstiloTextoBranco.text16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  height: 30,
                  color: clubdetails.getColors(widget.clubName).primaryColor.withOpacity(0.3),
                  child: TabBar(
                    controller: _tabController,
                    unselectedLabelColor: Colors.white54,
                    labelColor: clubdetails.getColors(widget.clubName).secondColor,
                    indicatorColor: clubdetails.getColors(widget.clubName).secondColor,
                    tabs: const [
                      Tab(text: "Gráfico"),
                      Tab(text: "Histórico"),
                      Tab(text: "Jogadores Históricos"),
                    ],
                  ),
                ),

                Expanded(
                  child: TabBarView(
                      controller: _tabController,
                      children: [
                        graphicsTab(),
                        historicTab(),
                        HistoricBestPlayersPage(clubName: widget.clubName, dataGraphics: dataGraphics,),
                      ],
                    ),
                ),

              ],
            ),
          ],
        ),
      ),
  );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget graphicsTab(){
    return Column(
      children: [
        dataGraphics.data.isNotEmpty ? graphics(dataGraphics) : Container(),

        trophy(dataGraphics),

        totalTrophyWidget(widget.clubName, dataGraphics),

        predictions(dataGraphics.data),

      ],
    );
  }
  Widget historicTab(){
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
          children: [
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    clubdetails.getState(widget.clubName).isNotEmpty
                        ? heatMapPositions('Estadual',dataGraphics.dataEstadual)
                        : Container(),
                    heatMapPositions('Nacional',dataGraphics.data),
                    heatMapPositions('Internacional',dataGraphics.dataInternational),
                  ],
                ),
              ),
            ),

            peryear(),

          ],
        ),
    );
  }

  Widget graphics(DataGraphics dataGraphics) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 260,
        width: dataGraphics.dataInternational.length * 35 + 50,
        color: AppColors().greyTransparent,
        child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          //https://pub.dev/documentation/syncfusion_flutter_charts/latest/charts/SfCartesianChart-class.html?utm_source=pubdev&utm_medium=listing&utm_campaign=flutter-charts-pubdev
          // Initialize category axis
          primaryXAxis: CategoryAxis(
            labelStyle: EstiloTextoBranco.text12,
          ),
          series: <ChartSeries>[
            // Initialize line series
            //CAMPEONATO NACIONAL
            LineSeries<ClassificationData, String>(
              onPointLongPress: (ChartPointDetails tapDetails) {
                int year = ano - tapDetails.pointIndex! - 1;
                //GET LEAGUE NAME
                Map leagueNationality = getLeagueNationalityMap();
                late String leagueName;
                leagueNationality.forEach((key, value) {
                if(value==clubCountry){
                  leagueName = key;
                  List classificationNames = mapChampions(leagueName)[year];
                  bottomSheetShowLeagueClassification(context, classificationNames);
                }});
              },
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

            // Initialize line series
            //CHAMPIONS LEAGUE
            LineSeries<ClassificationData, String>(
              onPointLongPress: (ChartPointDetails tapDetails) {
                int year = ano - tapDetails.pointIndex! - 1;
                List classificationNames = mapChampions(dataGraphics.internationalLeagueName)[year];
                bottomSheetShowLeagueClassification(context, classificationNames);
              },
              color: Colors.green,
              xAxisName: Translation(context).text.years,
              yAxisName: Translation(context).text.position,
              name: widget.clubName,
              dataSource: dataGraphics.dataInternational,
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

          ],
        ),
      ),
    );
  }

  Widget trophy(DataGraphics dataGraphics){
    return Container(
      color: AppColors().greyTransparent,
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(vertical:4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          dataGraphics.dataEstadual.isNotEmpty ? trophyColumn("Estadual", dataGraphics.dataEstadual, dataGraphics.nTitulosEstadual) : Container(),
          trophyColumn(dataGraphics.cupName, dataGraphics.dataCups, dataGraphics.nTitulosCups),
          trophyColumn(dataGraphics.leagueName, dataGraphics.data, dataGraphics.nTitulos),
          trophyColumn(dataGraphics.internationalLeagueName, dataGraphics.dataInternational, dataGraphics.nTitulosInternational),
          trophyColumn(LeagueOfficialNames().mundial, dataGraphics.dataMundial, dataGraphics.nTitulosMundial),
        ],
      ),
    );
  }

  Widget trophyColumn(String leagueName, List<ClassificationData> classificationData, int titles){
    return GestureDetector(
      onTap:(){
        bottomSheetShowTitles(context, leagueName, classificationData);
      },
      child: SizedBox(
        width: 70,
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(leagueName.toString(), style: EstiloTextoBranco.text12),
            Images().getTrophy(leagueName,60,60),
            Text(titles.toString(), style: EstiloTextoBranco.text20),
          ],
        ),
      ),
    );
  }

  Widget totalTrophyWidget(String clubName, DataGraphics dataGraphics) {
    return Container(
      width: Sized(context).width,
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          //G-2
          Column(
            children: [
              const Text('G-2', style: EstiloTextoBranco.text14),
              Text(Translation(context).text.years,
                  style: EstiloTextoBranco.text14),
              const SizedBox(height: 6),
              Text(dataGraphics.g2Years.toString(),
                  style: EstiloTextoBranco.text20),
            ],
          ),

          //G-4
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

          //G-10
          Column(
            children: [
              const Text('G-10', style: EstiloTextoBranco.text14),
              Text(Translation(context).text.years,
                  style: EstiloTextoBranco.text14),
              const SizedBox(height: 6),
              Text(dataGraphics.g10Years.toString(),
                  style: EstiloTextoBranco.text20),
            ],
          ),

          //1ªDIVISÃO
          Column(
            children: [
              const Text('1ªDivisão', style: EstiloTextoBranco.text14),
              Text(Translation(context).text.years,
                  style: EstiloTextoBranco.text14),
              const SizedBox(height: 6),
              Text(dataGraphics.n1ndivision.toString(),
                  style: EstiloTextoBranco.text20),
            ],
          ),

          //2ªDIVISÃO
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

        ],
      ),
    );
  }

  Widget heatMapPositions(String name, List<ClassificationData> dataClassificationList){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name+': ',style: EstiloTextoBranco.negrito16,),
        for(int i = 1950; i<anoInicial;i+=10)
          Row(
            children: [
              Text(i.toString(),style: EstiloTextoBranco.text14,),
              rowChampions(i,dataClassificationList),
              Text((i+9).toString(),style: EstiloTextoBranco.text14,),
            ],
          ),
      ],
    );
  }

  Widget rowChampions(int year,List<ClassificationData> dataClassificationList){
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for(int i=0;i<10;i++)
            classificationContainer(year+i,dataClassificationList)
        ],
      ),
    );
  }


  Widget peryear(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 6),
        const Text('Desempenho por ano',style: EstiloTextoBranco.negrito16,),
        const SizedBox(height: 6),
        const Text('   ANO   EST         COPA         NAC           INT',style: EstiloTextoBranco.text16,),
        SizedBox(
          height: 210,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: (anoInicial - 1950).floor(),
            itemBuilder: (BuildContext context, int index) {
              double year = anoInicial - index - 1;
              return peryearRow(year);
            },
          ),
        ),
      ],
    );
  }

  Widget peryearRow(double year){

    String estadual = filter(year,10,dataGraphics.dataEstadual,false);
    String copa = filter(year,10,dataGraphics.dataCups,true);
    String national = filter(year,-1,dataGraphics.data,false);
    String international = filter(year,33,dataGraphics.dataInternational,true);

    return SizedBox(
      height: 30,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(year.floor().toString(),style: EstiloTextoBranco.text14,),
          const SizedBox(width: 10),
          positionColor(estadual,40),
          const SizedBox(width: 10),
          positionColor(copa,80),
          const SizedBox(width: 10),
          GestureDetector(onTap:(){
            //GET LEAGUE NAME
            Map leagueNationality = getLeagueNationalityMap();
            late String leagueName;
            leagueNationality.forEach((key, value) {
              if(value==clubCountry){
                leagueName = key;
                List classificationNames = mapChampions(leagueName)[year];
                bottomSheetShowLeagueClassification(context, classificationNames);
              }
            });
          },child: positionColor(national,40)),
          const SizedBox(width: 10),
          positionColor(international,80),

        ],
      ),
    );
  }
  Widget positionColor(positionStr, double size){
    if(positionStr =="1º" || positionStr == "Campeão"){
      return Container(width:size,color:Colors.yellow,child: Center(child: Text(positionStr,style: EstiloTextoPreto.text14,)));
    }
    if(positionStr == "2º" || positionStr == "Vice"){
      return Container(width:size,color:Colors.blue,child: Center(child: Text(positionStr,style: EstiloTextoBranco.text14,)));
    }
    if(positionStr == "3º" || positionStr  == "4º" ){
      return Container(width:size,color:Colors.blue[100],child: Center(child: Text(positionStr,style: EstiloTextoPreto.text14,)));
    }
    return SizedBox(width:size,child: Center(child: Text(positionStr,style: EstiloTextoBranco.text14,)));
  }

  filter(double year, int positionEliminate,List<ClassificationData> data,bool isMataMata){
    String positionStr = '-';
    try{
      int positionInt = data.where((element) => element.year == year).first.position;
      positionStr = positionInt.toString();
      if(positionStr==positionEliminate.toString()){
        positionStr='-';
      }else{
        positionStr += 'º';
        if(isMataMata){
          if(positionInt==1){
            positionStr = "Campeão";
          }
          if(positionInt==2){
            positionStr = "Vice";
          }
          if(positionInt==3 || positionInt==4){
            positionStr = "Semi";
          }
          if(positionInt>=5 && positionInt<=8){
            positionStr = "Quartas";
          }
          if(positionInt>=9 && positionInt<=16){
            positionStr = "Oitavas";
          }
          if(positionInt>=17 && positionInt<=32){
            positionStr = "Grupo";
          }
        }
      }
    }catch(e){
      //print();
    }
    return positionStr;
  }

  Widget predictions(List<ClassificationData> classificationData){
    List<int> firstTenPositions = [];
    for (int i = 0; i < classificationData.length && i < 10; i++) {
      firstTenPositions.add(classificationData[i].position);
    }
    return Container(
      width: Sized(context).width-8,
      color: AppColors().greyTransparent,
      child: Column(
        children: [
          const Text("Predição", style: EstiloTextoBranco.negrito16),
          const SizedBox(height: 8),
          Text((ano).toString()+" "+predictionValue(firstTenPositions).toString()+"º", style: EstiloTextoBranco.negrito16),
        ],
      ),
    );
  }

  predictionValue(List values){
    int value = 0;
    dynamic soma = 0;
    for (int i = 0; i < values.length; i++) {
      soma += values[i] * (values.length-i);
    }
    //DA Ainda mais peso pros anos recentes
    soma += values[0]*15;
    soma += values[1]*5;
    soma += values[2]*2;
    value = soma ~/ values.length;
    value = value ~/ 9;
    return value;
  }


}
