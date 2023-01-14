import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget cupPhaseWidget(){
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Name().oitavas,style: EstiloTextoBranco.text16),
        cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1)),
        cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1)),
        cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1)),
        cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1)),
        cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1)),
        cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1)),
        cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1)),
        Text(Name().quartas,style: EstiloTextoBranco.text16),
        cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1)),
        cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1)),
        cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1)),
        Text(Name().semifinal,style: EstiloTextoBranco.text16),
        cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1)),
        cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1)),
        Text(Name().finale,style: EstiloTextoBranco.text16),
        cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1)),
      ],
    ),
  );
}
Widget cupMatchRow(Confronto confronto){

  String teamNameA = confronto.clubName1;
  String teamNameB = confronto.clubName2;
  int golsA = confronto.goal1;
  int golsB = confronto.goal2;
  double imageSize = 30;

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [

      //TIME A
      Column(
        children: [
          Row(
            children: [
              Images().getEscudoWidget(teamNameA,imageSize,imageSize),
              Images().getUniformWidget(teamNameA,imageSize,imageSize)
            ],
          ),
          Container(
              margin: const EdgeInsets.only(top: 8),
              color: teamNameA == My().clubName ? Colors.green : Colors.transparent,
              child: Text(teamNameA,textAlign:TextAlign.end,style: EstiloTextoBranco.text14)),
        ],
      ),


      golsA >= 0
          ? Text(' '+ golsA.toString()+'x'+golsB.toString()+' ',style: EstiloTextoBranco.text22)
          : const Text('X',textAlign:TextAlign.center,style: EstiloTextoBranco.text22),

      //TIME B
      Column(
        children: [
          Row(
            children: [
              Images().getEscudoWidget(teamNameB,imageSize,imageSize),
              Images().getUniformWidget(teamNameB,imageSize,imageSize),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            color: teamNameB == My().clubName ? Colors.green : Colors.transparent,
            child: Text(teamNameB,style: EstiloTextoBranco.text14),
          ),
        ],
      ),


    ],
  );
}