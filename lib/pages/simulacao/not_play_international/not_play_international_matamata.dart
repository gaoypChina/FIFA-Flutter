import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/mata_mata/mata_mata_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/match_x_testyle.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

  Widget notPlayShowInternationalMataMata(BuildContext context, String internationalLeagueName){

    return SingleChildScrollView(
      child: Column(
          children: [
                Column(
                children: [
                  for(int phaseStage = 0; phaseStage < 7; phaseStage++)
                    phaseTableMataMataWidget(internationalLeagueName,semana,phaseStage)
                ],
              ),
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
  return Column(
    children: [
      for (int i = -1; i < phaseRows; i++)
        Table(
          columnWidths: const{0: FractionColumnWidth(.35),4: FractionColumnWidth(.35)},
          children: [
            if (i == -1)
              groupTitleMataMata(phaseRows)
            else
              groupRowMataMata(i,internationalLeagueName, phaseIdaVolta, weekShow)
          ],
        )
    ],
  );
}

TableRow groupTitleMataMata(int phaseRows){
  String stageName = Name().oitavas;
  if(phaseRows==4){stageName=Name().quartas;}
  if(phaseRows==2){stageName=Name().semifinal;}
  if(phaseRows==1){stageName=Name().finale;}
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
TableRow groupRowMataMata(int matchRow,String internationalLeagueName, int phaseIdaVolta, int weekShow){
  MataMata data = MataMata();
  data.getData(internationalLeagueName, data.getSemanaPhase(weekShow),matchRow, phaseIdaVolta);

  //print(data.clubName1);
  //print('GOL: ${data.goal1} x ${data.goal2}');
  String teamNameA = data.clubName1;
  String teamNameB = data.clubName2;
  int golsA = data.goal1;
  int golsB = data.goal2;
  TextStyle style1 = matchStyle1(golsA, golsB, 14);
  TextStyle style2 = matchStyle2(golsA, golsB, 14);
  My my = My();

  return  TableRow(
    children: [
      Container(
          color: teamNameA == my.clubName ? Colors.green : Colors.transparent,
          child: Text(teamNameA,textAlign:TextAlign.end,style: style1)),
      //Escudo
      Images().getEscudoWidget(teamNameA,20,20),

      golsA >= 0
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
        color: teamNameB == My().clubName ? Colors.green : Colors.transparent,
        child: Text(teamNameB,style: style2),
      ),
    ],
  );

}
