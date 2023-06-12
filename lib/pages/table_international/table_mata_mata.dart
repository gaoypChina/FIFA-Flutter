import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/mata_mata/knockout_international.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/background_color/match_x_testyle.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/background_image/backimage_international_league.dart';
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
    super.initState();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    leagueInternational = widget.leagueInternational;
    return Scaffold(

      body:  Stack(
          children: [

            backgroundInternationalLeague(leagueInternational),

            Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                          color: AppColors().greyTransparent,
                          height: Sized(context).height*0.9,
                          width: Sized(context).width*0.9,
                          child: SingleChildScrollView(
                              child:
                              Column(
                                children: [
                                  for(int phaseStage = 0; phaseStage < 7; phaseStage++)
                                    phaseTableWidget(phaseStage)
                                ],
                              ),
                          ),
                      ),
                    ),
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
      else if(phaseStage==2 || phaseStage==3){phaseRows=4;weekShow = semanaQuartas.first;} //QUARTAS
      else if(phaseStage==4 || phaseStage==5){phaseRows=2;weekShow = semanaSemi.first;} //SEMI
      else if(phaseStage==6){phaseRows=1;weekShow = semanaFinal.first;} //FINAL

      String phaseIdaVolta = ResultDict().keyIda;
      if(phaseStage == 1 || phaseStage==3 || phaseStage==5 ){
        phaseIdaVolta = ResultDict().keyVolta;
      }

      //Quando não está no matamata
      if(semana < semanaOitavas.first){
        return Container();
      }
      //Quando já está no matamata
      if(semana < semanaOitavas.first && phaseStage>=2){
        return Container();
      }
      if(semana < semanaQuartas.first && phaseStage>=4){
        return Container();
      }
      if(semana < semanaSemi.first && phaseStage==6){
        return Container();
      }
      return Column(
        children: [
          for (int i = 0; i <= phaseRows; i++)
            Table(
              columnWidths: const{0: FractionColumnWidth(.35),4: FractionColumnWidth(.35)},
              children: [
                if (i == 0)
                  groupTitle(phaseRows)
                else
                  groupRow(i, phaseIdaVolta, weekShow)
              ],
            ),
        ],
      );
  }

  TableRow groupTitle(int phaseRows){

    String stageName = Name().oitavas;
    if(phaseRows==4){stageName=Name().quartas;}
    if(phaseRows==2){stageName=Name().semifinal;}
    if(phaseRows==1){stageName=Name().finale;}

    return TableRow(
      children: [
        Text(stageName,style: EstiloTextoBranco.negrito16),
        Container(),
        Container(),
        Container(),
        Container(),
      ],
    );
  }

  TableRow groupRow(int matchRow, String phaseIdaVolta, int weekShow){

    String phaseName = KnockoutInternational().getPhaseKeyName(weekShow);
    Confronto confronto = KnockoutInternational().getConfronto(leagueInternational, phaseName, phaseIdaVolta, matchRow);

    //print(confronto.clubName1);
    //print('GOL: ${confronto.goal1} x ${confronto.goal2}');
    String teamNameA = confronto.clubName1;
    String teamNameB = confronto.clubName2;
    late int golsA;
    late int golsB;
    TextStyle style1 = EstiloTextoBranco.text14;
    TextStyle style2 = EstiloTextoBranco.text14;
    if (confronto.hasGoals){
      golsA = confronto.goal1;
      golsB = confronto.goal2;
      style1 = matchStyle1(golsA, golsB, 14);
      style2 = matchStyle2(golsA, golsB, 14);
    }
    My my = My();

    return  TableRow(
      children: [
        Container(
          color: teamNameA == my.clubName ? Colors.green : Colors.transparent,
            child: Text(teamNameA,textAlign:TextAlign.end,style: style1)),
        //Escudo
        Images().getEscudoWidget(teamNameA,20,20),

        confronto.hasGoals
            ? Row(
          children: [
            Text(" " + golsA.toString(),style: style1),
            const Text('x',style: EstiloTextoBranco.text16),
            Text(golsB.toString() + " ",style: style2),
          ],
        ) : const Text('X',textAlign:TextAlign.center,style: EstiloTextoBranco.text14),
        //Escudo
        Images().getEscudoWidget(teamNameB,20,20),

        Container(
          color: teamNameB == my.clubName ? Colors.green : Colors.transparent,
            child: Text(teamNameB,style: style2),
        ),
      ],
    );
  }


}