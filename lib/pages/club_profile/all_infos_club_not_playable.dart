import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/classes/data_graphics.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/pages/historic/historic_players.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
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
  late String clubState;
  ///////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    late String clubCountry;

    clubState = ClubDetails().getState(widget.clubName);

    try {
      clubCountry = ClubDetails().getCountry(widget.clubName);

    dataGraphics.getDataNotPlayabale(widget.clubName, clubCountry, clubState);
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
    bool isPlayableClub = false;
    if(clubsAllNameList.contains(widget.clubName)){
      isPlayableClub = true;
    }
  return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
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

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Images().getEscudoWidget(widget.clubName,90,90),
                    Images().getUniformWidget(widget.clubName,100,100),
                    Column(
                      children: [
                        Row(
                          children: [
                            funcFlagsList(ClubDetails().getCountry(widget.clubName), 35, 50),
                            clubState.isNotEmpty ? funcFlagsList(ClubDetails().getState(widget.clubName), 35, 50) : Container(),
                          ],
                        ),
                        Text(ClubDetails().getFoundationYear(widget.clubName).toString(),style: EstiloTextoBranco.text16),
                        Text(ClubDetails().getStadium(widget.clubName),overflow:TextOverflow.ellipsis,style: EstiloTextoBranco.text14),
                        Text(ClubDetails().getStadiumCapacityPointFormat(widget.clubName),style: EstiloTextoBranco.text16),
                      ],
                    ),
                  ],
                ),
              ),


              Row(
                children: [
                  Container(
                    color: AppColors().greyTransparent,
                    child: TextButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => HistoricPlayersPage(clubName: widget.clubName)));
                    }, child: const Text('Jogadores Históricos',style:EstiloTextoBranco.text16)),
                  ),
                ],
              ),


              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      totalTrophyWidget(widget.clubName, dataGraphics),

                      positionYears(widget.clubName, dataGraphics,1),
                      positionYears(widget.clubName, dataGraphics,2),

                      Column(
                        children: [
                          dataGraphics.data.isNotEmpty ? graphics(dataGraphics) : Container(),
                        ],
                      ),
                      ClubDetails().getState(widget.clubName).isNotEmpty
                          ? heatMapPositions('Estadual',dataGraphics.dataEstadual)
                          : Container(),
                      heatMapPositions('Nacional',dataGraphics.data),
                      heatMapPositions('Internacional',dataGraphics.dataInternational),

                      peryear(),
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
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

  Widget graphics(DataGraphics dataGraphics) {

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 280,
        width: dataGraphics.dataInternational.length * 23 + 50,
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

            // Initialize line series
            LineSeries<ClassificationData, String>(
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

  Widget totalTrophyWidget(String clubName, DataGraphics dataGraphics) {
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
              Text(Translation(context).text.titles,
                  style: EstiloTextoBranco.negrito16),
              const Text('',style: EstiloTextoBranco.text14),
              const SizedBox(height: 6),
              Text(dataGraphics.nTitulos.toString(),
                  style: EstiloTextoBranco.negrito22),
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

  Widget positionYears(String clubName, DataGraphics dataGraphics, int position) {
    List championYear = [];

    for(ClassificationData data in dataGraphics.data)
      {
        if(data.position==position){
          championYear.add(data.year.toStringAsFixed(0));
        }
      }
    if(championYear.isNotEmpty){
      return Container(
        width: Sized(context).width,
        color: AppColors().greyTransparent,
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            position == 1
                ? const Text('Campeão:',style: EstiloTextoBranco.negrito16)
                : Text(position.toString()+'º',style: EstiloTextoBranco.negrito16) ,
            Text(championYear.toString(),style: EstiloTextoBranco.text14),
          ],
        ),
      );
    }else{
      return Container();
    }

  }

  Widget heatMapPositions(String name, List<ClassificationData> dataClassificationList){
    return Column(
      children: [
        Text(name+': ',style: EstiloTextoBranco.text16,),
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
            rowChampionsPosition(year+i,dataClassificationList)
        ],
      ),
    );
  }
  Widget rowChampionsPosition(int year,List<ClassificationData> dataClassificationList){
    try{
      var data = dataClassificationList.where((element) => element.year == year.toDouble());
      ClassificationData classificationData = data.first;
      if(classificationData.position == 1){
        return Container(width:30,color:Colors.amber,child: Text(classificationData.position.toString(),textAlign: TextAlign.center,style: EstiloTextoPreto.text14));
      }
      if(classificationData.position <= 2){
        return Container(width:30,color:Colors.lightBlueAccent,child: Text(classificationData.position.toString(),textAlign: TextAlign.center,style: EstiloTextoPreto.text14));
      }
      if(classificationData.position <= 4){
        return Container(width:30,color:Colors.black38,child: Text(classificationData.position.toString(),textAlign: TextAlign.center,style: EstiloTextoBranco.text14));
      }
      if(classificationData.position <= 8){
        return Container(width:30,color:Colors.black12,child: Text(classificationData.position.toString(),textAlign: TextAlign.center,style: EstiloTextoBranco.text14));
      }
      return SizedBox(width:30,child: Text(classificationData.position.toString(),textAlign: TextAlign.center,style: EstiloTextoBranco.text14));
    }catch(e){
      return Container(width:30,);
    }
  }


  Widget peryear(){
    return Column(
      children: [
        const Text('Desempenho por ano',style: EstiloTextoBranco.text16,),
        const Text('ANO  EST  COPA   NAC    INT',style: EstiloTextoBranco.text16,),
        for(double i = 1950; i<anoInicial;i++)
          peryearRow(i)
      ],
    );
  }

  Widget peryearRow(double year){

    String estadual = filter(year,10,dataGraphics.dataEstadual,false);
    String copa = filter(year,10,dataGraphics.dataCups,false);
    String national = filter(year,-1,dataGraphics.data,false);
    String international = filter(year,32,dataGraphics.dataInternational,true);

    return SizedBox(
      height: 30,
      child: Row(
        children: [
          const SizedBox(width: 10),
          Text(year.floor().toString(),style: EstiloTextoBranco.text14,),
          const SizedBox(width: 10),
          positionColor(estadual,40),
          const SizedBox(width: 10),
          positionColor(copa,40),
          const SizedBox(width: 10),
          positionColor(national,40),
          const SizedBox(width: 10),
          positionColor(international,80),

        ],
      ),
    );
  }
  Widget positionColor(positionStr, double size){
    if(positionStr =="1º" || positionStr == "Campeão"){
      return Container(width:size,color:Colors.yellow,child: Text(positionStr,style: EstiloTextoPreto.text14,));
    }
    if(positionStr == "2º" || positionStr == "Vice"){
      return Container(width:size,color:Colors.blue,child: Text(positionStr,style: EstiloTextoBranco.text14,));
    }
    if(positionStr == "3º" || positionStr  == "4º" ){
      return Container(width:size,color:Colors.blue[100],child: Text(positionStr,style: EstiloTextoPreto.text14,));
    }
    return SizedBox(width:size,child: Text(positionStr,style: EstiloTextoBranco.text14,));
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
}
