import 'package:fifa/functions/mata_mata/mata_mata_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/table/widget_bottom.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

class TableMataMata extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final String leagueInternational;
  const TableMataMata({Key? key, required this.leagueInternational}) : super(key: key);
  @override
  _TableMataMataState createState() => _TableMataMataState();
}

class _TableMataMataState extends State<TableMataMata> {

  String leagueInternational = '';

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    leagueInternational = widget.leagueInternational;
    super.initState();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(

      body:  Stack(
          children: [

      leagueInternational == LeagueOfficialNames().championsLeague
      ? Image.asset('assets/icons/fundochampions.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill)
            : Image.asset('assets/icons/fundolibertadores.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

            Column(
                children: [
                  const SizedBox(height: 30),

                  Expanded(
                    child: Center(
                      child: Container(
                          color: AppColors().greyTransparent,
                          height: _height*0.9,
                          width: _width*0.9,
                          child: SingleChildScrollView(
                              child:
                              Column(
                                children: [
                                  for(int phaseStage = 0; phaseStage < 7; phaseStage++)
                                    phaseTableWidget(phaseStage)
                                ],
                              ),
                          )
                      ),
                    ),
                  ),


                  customWidgetBottomBar(
                      context,
                      WidgetBottomInternational().matamata,
                      leagueInternational,
                          (value){
                        setState(() {});
                        leagueInternational=value;
                      }
                  ),

                ]),

          ]),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget phaseTableWidget(int phaseStage) {
      int phaseRows = 9;
      int weekShow = 0;
      if(phaseStage==0 || phaseStage==1){phaseRows=8;weekShow = semanaOitavas.first;} //OITAVAS
      if(phaseStage==2 || phaseStage==3){phaseRows=4;weekShow = semanaQuartas.first;} //QUARTAS
      if(phaseStage==4 || phaseStage==5){phaseRows=2;weekShow = semanaSemi.first;} //SEMI
      if(phaseStage==6){phaseRows=1;weekShow = semanaFinal.first;} //FINAL

      //Quando não está no matamata
      if(semana < semanaOitavas.first){
        return Container();
      }
      //Quando já está no matamata
      if(semana < semanaQuartas.first && phaseStage>=2){
        return Container();
      }
      if(semana < semanaSemi.first && phaseStage>=4){
        return Container();
      }
      if(semana < semanaFinal.first && phaseStage==6){
        return Container();
      }
      return Column(
        children: [
          for (int i = -1; i < phaseRows; i++)
          Table(
            columnWidths: const{0: FractionColumnWidth(.35),4: FractionColumnWidth(.35)},
            children: [
              if (i == -1)
                groupTitle(phaseRows)
              else
                groupRow(i, phaseStage, weekShow)
            ],
          )
        ],
      );
  }

  TableRow groupTitle(int phaseRows){
    String stageName = 'Oitavas';
    if(phaseRows==4){stageName='Quartas';}
    if(phaseRows==2){stageName='Semi';}
    if(phaseRows==1){stageName='Final';}
    return TableRow(
      children: [
        Text(stageName,style: EstiloTextoBranco.text16),
        Container(),
        Container(),
        Container(),
        Container(),
      ],
    );
  }
  TableRow groupRow(int matchRow, int phaseStage, int weekShow){
    MataMata data = MataMata();
    data.getData(leagueInternational, data.getSemanaPhase(weekShow),matchRow, phaseStage);

    String teamNameA = data.clubName1;
    String teamNameB = data.clubName2;
    int golsA = data.goal1;
    int golsB = data.goal2;

    return  TableRow(
      children: [
        Text(teamNameA,textAlign:TextAlign.end,style: EstiloTextoBranco.text14),
        //Escudo
        Image.asset('assets/clubs/${FIFAImages().imageLogo(teamNameA)}.png',height: 20,width: 20),

        golsA >= 0
            ? Text(' '+ golsA.toString()+'x'+golsB.toString()+' ',style: EstiloTextoBranco.text14)
            : const Text('X',textAlign:TextAlign.center,style: EstiloTextoBranco.text14),
        //Escudo
        Image.asset('assets/clubs/${FIFAImages().imageLogo(teamNameB)}.png',height: 20,width: 20),

        Text(teamNameB,style: EstiloTextoBranco.text14),
      ],
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////


}