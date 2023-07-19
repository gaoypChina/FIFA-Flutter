import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/mata_mata/knockout_international.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/background_image/backimage_international_league.dart';
import 'package:fifa/widgets/match_row.dart';
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
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.all(4),
                          child: SingleChildScrollView(
                              child:
                              Column(
                                children: [
                                  for(int phaseStage = 6; phaseStage >=0; phaseStage--)
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

      //Quando já está no matamata
      //Nao mostra quando
      //Depois oitavas
      if((semana >= semanaOitavas.first && phaseStage<2) ||
          (semana > semanaOitavas.last && phaseStage<4) ||
          (semana >= semanaQuartas.first && phaseStage<4) ||
          (semana > semanaQuartas.last && phaseStage<6) ||
          (semana >= semanaSemi.first && phaseStage<6) ||
          (semana > semanaSemi.last && phaseStage<8)
      ){
        //show row
      }else{
        return Container();
      }
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Column(
          children: [
            for (int i = 0; i <= phaseRows; i++)
              Column(
                children: [
                  if (i == 0)
                    groupTitle(phaseRows)
                  else
                    matchRowWidget(
                        KnockoutInternational().getConfronto(
                            leagueInternational,
                            KnockoutInternational().getPhaseKeyName(weekShow),
                            phaseIdaVolta,
                            i),
                        My())
                ],
              ),
          ],
        ),
      );
  }

  Row groupTitle(int phaseRows){

    String stageName = Name().oitavas;
    if(phaseRows==4){stageName=Name().quartas;}
    if(phaseRows==2){stageName=Name().semifinal;}
    if(phaseRows==1){stageName=Name().finale;}

    return Row(
      children: [
        Text(stageName,style: EstiloTextoBranco.negrito16),
      ],
    );
  }

}