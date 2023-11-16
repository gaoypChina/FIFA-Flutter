import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/classes/data_graphics.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/pages/historic/historic_best_players.dart';
import 'package:fifa/pages/historic/leagues_historic.dart';
import 'package:fifa/pages/historic/real_classification.dart';
import 'package:fifa/pages/historic/real_classification/get_classification.dart';
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
import 'package:fifa/widgets/trophy.dart';
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

    getDataGraphics();

    super.initState();
  }
  getDataGraphics() async{
    clubState = clubdetails.getState(widget.clubName);

    try {
      clubCountry = clubdetails.getCountry(widget.clubName);

      await dataGraphics.getDataNotPlayabale(widget.clubName, clubdetails);
      setState((){});
    }catch(e){
      //THE CLUB HAS NO INFORMATION IN THE CLUB DETAILS
      // Therefore there is nothing to show on this page
      Navigator.pop(context);
    }
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
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: GestureDetector(
                          onTap:(){
                            Map map = getLeagueNationalityMap();
                            String chosenLeagueName = map.keys.firstWhere((k) => map[k] == clubCountry, orElse: () => null);
                            Navigator.push(context,MaterialPageRoute(builder: (context) => HistoricLeague(chosenLeagueName: chosenLeagueName)));
                          },
                          child: const Icon(Icons.history,color:Colors.white,size: 32),
                        ),
                      ),
                      const SizedBox(width: 8),
                      isPlayableClub ? Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: IconButton(onPressed: (){
                             Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: clubsAllNameList.indexOf(widget.clubName))));
                        }, icon: const Icon(Icons.outbond_outlined,color: Colors.white,size: 32,)),
                      ) : Container(),
                    ],
                  ),
                ),

                //HEADER
                header(),

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

  Widget header(){
    return Container(
      padding: const EdgeInsets.only(left: 8.0,top: 8),
      color: clubdetails.getColors(widget.clubName).primaryColor.withOpacity(0.3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Images().getEscudoWidget(widget.clubName,75,75),
              starsWidgetFromOverall(clubdetails.getOverall(widget.clubName),20),
            ],
          ),
          Images().getUniformWidget(widget.clubName,100,100),
          SizedBox(
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

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget graphicsTab(){
    String leagueName = RealClassification().getLeagueFromCountryName(clubCountry);
    try{
      //Resolve o problemas das 2divisoes
      leagueName = Club(index: clubsAllNameList.indexOf(widget.clubName)).leagueName;
      //Resolve os times em ligas internacionais
      if(leagueName==LeagueOfficialNames().asia
          || leagueName==LeagueOfficialNames().africa
          || leagueName==LeagueOfficialNames().resto
          || leagueName==LeagueOfficialNames().europaLeagueOficial
          || leagueName==LeagueOfficialNames().holanda
          || leagueName==LeagueOfficialNames().turquia
          || leagueName==LeagueOfficialNames().mercosul
          || leagueName==LeagueOfficialNames().merconorte
          || leagueName==LeagueOfficialNames().outros
          || leagueName==LeagueOfficialNames().outros2){
        leagueName = RealClassification().getLeagueFromCountryName(clubCountry);
      }
    }catch(e){
      leagueName = RealClassification().getLeagueFromCountryName(clubCountry);
    }

    return SingleChildScrollView(
      child: Column(
        children: [

          dataGraphics.data.isNotEmpty ? graphics(dataGraphics) : Container(),

          trophy(dataGraphics),

          totalTrophyWidget(widget.clubName, dataGraphics),

          predictions(dataGraphics.data),

          Container(
              color: AppColors().greyTransparent,
              margin: const EdgeInsets.only(top:8, left: 4, right: 4),
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Classificação Atual",style: EstiloTextoBranco.negrito18),
                  SizedBox(height:400, child: RealTableWidget(chosenLeagueName: leagueName)),
                ],
              ),
          ),

        ],
      ),
    );
  }

  Widget historicTab(){
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 4, right:4),
      child: Column(
          children: [
            Container(
              height: 315,
              color: AppColors().greyTransparent,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    clubdetails.getState(widget.clubName).isNotEmpty
                        ? heatMapPositions('Estadual',dataGraphics.dataEstadual)
                        : Container(),
                    heatMapPositions('Nacional',dataGraphics.data),
                    heatMapPositions('Internacional',dataGraphics.dataInternational),
                    heatMapPositions('Copa',dataGraphics.dataCups),
                  ],
                ),
              ),
            ),

            byYear(),

          ],
        ),
    );
  }

  Widget graphics(DataGraphics dataGraphics) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 260,
        width:  dataGraphics.dataInternational.length > dataGraphics.data.length
            ? dataGraphics.dataInternational.length * 35 + 50
            : dataGraphics.data.length * 35 + 50,
        color: AppColors().greyTransparent,
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
            //CAMPEONATO NACIONAL
            LineSeries<ClassificationData, String>(
              onPointLongPress: (ChartPointDetails tapDetails) async {
                int year = ano - tapDetails.pointIndex! - 1;

                // GET LEAGUE NAME
                Map leagueNationality = getLeagueNationalityMap();
                late String leagueName;

                for (var entry in leagueNationality.entries) {
                  if (entry.value == clubCountry) {
                    leagueName = entry.key;
                    Map mapClassifications = await mapChampions(leagueName);
                    List classificationNames = mapClassifications[year];
                    bottomSheetShowLeagueClassification(context, classificationNames, leagueName);
                    break; // Exit the loop once you've found the league name
                  }
                }
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
              dataLabelSettings: const DataLabelSettings(isVisible: true, color: Colors.white),
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
              onPointLongPress: (ChartPointDetails tapDetails) async{
                int year = ano - tapDetails.pointIndex! - 1;
                Map map = await mapChampions(dataGraphics.internationalLeagueName);
                List classificationNames = map[year];
                bottomSheetShowLeagueClassification(context, classificationNames, dataGraphics.internationalLeagueName);
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
      padding: const EdgeInsets.all(8),
      width: Sized(context).width,
      margin: const EdgeInsets.symmetric(vertical:8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Trophies", style: EstiloTextoBranco.negrito16),
          const SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
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
          ),
        ],
      ),
    );
  }

  Widget trophyColumn(String leagueName, List<ClassificationData> classificationData, int titles){
    return GestureDetector(
      onTap:(){
        bottomSheetShowTitles(context, leagueName, classificationData);
      },
      child: TrophyWidget(name: leagueName, qntd: titles, scale: 0.8)
    );
  }

  Widget totalTrophyWidget(String clubName, DataGraphics dataGraphics) {
    return Container(
      width: Sized(context).width,
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Years", style: EstiloTextoBranco.negrito16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              //G-2
              Column(
                children: [
                  const Text('G-2', style: EstiloTextoBranco.text14),
                  const SizedBox(height: 6),
                  Text(dataGraphics.g2Years.toString(),
                      style: EstiloTextoBranco.text20),
                ],
              ),

              //G-4
              Column(
                children: [
                  const Text('G-4', style: EstiloTextoBranco.text14),
                  const SizedBox(height: 6),
                  Text(dataGraphics.g4Years.toString(),
                      style: EstiloTextoBranco.text20),
                ],
              ),

              //G-10
              Column(
                children: [
                  const Text('G-10', style: EstiloTextoBranco.text14),
                  const SizedBox(height: 6),
                  Text(dataGraphics.g10Years.toString(),
                      style: EstiloTextoBranco.text20),
                ],
              ),

              //1ªDIVISÃO
              Column(
                children: [
                  const Text('1ªDivisão', style: EstiloTextoBranco.text14),
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
        ],
      ),
    );
  }

  Widget heatMapPositions(String name, List<ClassificationData> dataClassificationList){
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,style: EstiloTextoBranco.negrito16,),
          for(int i = 1950; i<anoInicial;i+=10)
            Row(
              children: [
                SizedBox(width:30, child: Text(i.toString(),style: EstiloTextoBranco.text14,)),
                rowChampions(i,dataClassificationList),
                SizedBox(width:30, child: Text((i+9).toString(),style: EstiloTextoBranco.text14,)),
              ],
            ),
        ],
      ),
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


  Widget byYear(){
    return Container(
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const Text('Desempenho por ano',style: EstiloTextoBranco.negrito16,),
          const SizedBox(height: 8),
          const Text('   ANO     EST          COPA         NAC            INT',style: EstiloTextoBranco.text16,),
          SizedBox(
            height: Sized(context).height-616,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: (anoInicial - 1950).floor(),
                itemBuilder: (BuildContext context, int index) {
                  double year = anoInicial - index - 1;
                  return peryearRow(year);
                },
            ),
          ),
        ],
      ),
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
          SizedBox(width:30, child: Text(year.floor().toString(),style: EstiloTextoBranco.text14,)),
          const SizedBox(width: 10),
          positionColor(estadual,40),
          const SizedBox(width: 10),
          positionColor(copa,80),
          const SizedBox(width: 10),
          GestureDetector(
              onTap:() {
            //GET LEAGUE NAME
            Map leagueNationality = getLeagueNationalityMap();
            late String leagueName;
            leagueNationality.forEach((key, value) async{
              if(value==clubCountry){
                leagueName = key;
                Map map = await mapChampions(leagueName);
                List classificationNames = map[year];
                bottomSheetShowLeagueClassification(context, classificationNames, leagueName);
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
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
    //more weight for recent years
    soma += values[0] * 15;
    soma += values[1] * 5;
    soma += values[2] * 2;
    value = soma ~/ values.length;
    value = value ~/ 9;
    return value;
  }


}
