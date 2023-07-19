import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/mata_mata/mata_mata_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/table_international/table_brackets.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/match_row.dart';
import 'package:flutter/material.dart';

  Widget notPlayShowInternationalMataMata(BuildContext context, String internationalLeagueName){

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        interBrackets(context, internationalLeagueName),
      ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget phaseTableMataMataWidget(String internationalLeagueName, int weekToShow,int phaseStage) {
  int phaseRows = 9;
  int weekShow = 0;
  if(phaseStage==0 || phaseStage==1){phaseRows=8;weekShow = semanaOitavas.first;} //OITAVAS
  else if(phaseStage==2 || phaseStage==3){phaseRows=4;weekShow = semanaQuartas.first;} //QUARTAS
  else if(phaseStage==4 || phaseStage==5){phaseRows=2;weekShow = semanaSemi.first;} //SEMI
  else if(phaseStage==6){phaseRows=1;weekShow = semanaFinal.first;} //FINAL

  int phaseIdaVolta = 0;
  if(phaseStage == 1 || phaseStage==3 || phaseStage==5 ){
    phaseIdaVolta = 1;
  }

  //Quando não está no matamata
  if(weekToShow < semanaOitavas.first){
    return Container();
  }
  //Quando já está no matamata
  if(weekToShow < semanaQuartas.first && phaseStage>=2){
    return Container();
  }
  if(weekToShow < semanaSemi.first && phaseStage>=4){
    return Container();
  }
  if(weekToShow < semanaFinal.first && phaseStage==6){
    return Container();
  }
  MataMata data = MataMata();

  return Container(
    margin: const EdgeInsets.all(8),
    child: Column(
      children: [
        for (int i = -1; i < phaseRows; i++)
          Column(
            children: [
              if (i == -1)
                groupTitleMataMata(phaseRows)
              else
                matchRowWidget(
                  data.getData(internationalLeagueName, data.getSemanaPhase(weekShow), i+1, phaseIdaVolta),
                  My(),
                ),

            ],
          )
      ],
    ),
  );
}

Widget groupTitleMataMata(int phaseRows){
  String stageName = Name().oitavas;
  if(phaseRows==4){stageName=Name().quartas;}
  if(phaseRows==2){stageName=Name().semifinal;}
  if(phaseRows==1){stageName=Name().finale;}
  return Row(
    children: [
      Text(stageName, style: EstiloTextoBranco.negrito16),
    ],
  );
}

