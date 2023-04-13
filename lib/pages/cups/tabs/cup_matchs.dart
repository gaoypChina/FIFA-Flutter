import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget cupPhaseWidget(){
  My my = My();
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Name().finale,style: EstiloTextoBranco.negrito16),
          cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1),my),
          Text(Name().semifinal,style: EstiloTextoBranco.negrito16),
          cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1),my),
          cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1),my),
          Text(Name().quartas,style: EstiloTextoBranco.negrito16),
          cupMatchRow(Confronto(clubName1: 'Botafogo', clubName2: 'Grêmio', goal1: 2, goal2: 1),my),
          cupMatchRow(Confronto(clubName1: 'Porto', clubName2: 'Benfica', goal1: 2, goal2: 1),my),
          cupMatchRow(Confronto(clubName1: 'Racing', clubName2: 'Juventus', goal1: 2, goal2: 1),my),
          cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Napoli', goal1: 2, goal2: 1),my),
          Text(Name().oitavas,style: EstiloTextoBranco.negrito16),
          cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Grêmio', goal1: 2, goal2: 1),my),
          cupMatchRow(Confronto(clubName1: 'Benfica', clubName2: 'Inter', goal1: 2, goal2: 1),my),
          cupMatchRow(Confronto(clubName1: 'Porto', clubName2: 'Chelsea', goal1: 2, goal2: 1),my),
          cupMatchRow(Confronto(clubName1: 'Arsenal', clubName2: 'Fiorentina', goal1: 2, goal2: 1),my),
          cupMatchRow(Confronto(clubName1: 'Santos', clubName2: 'Juventude', goal1: 2, goal2: 1),my),
          cupMatchRow(Confronto(clubName1: 'Real Betis', clubName2: 'Milan', goal1: 2, goal2: 1),my),
          cupMatchRow(Confronto(clubName1: 'Juventus', clubName2: 'Sporting', goal1: 2, goal2: 1),my),
          cupMatchRow(Confronto(clubName1: 'Sampdoria', clubName2: 'Napoli', goal1: 2, goal2: 1),my),
        ],
      ),
    ),
  );
}
Widget cupMatchRow(Confronto confronto, My my){

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
              Images().getUniformWidget(teamNameA,imageSize,imageSize),
              Container(
                  color: teamNameA == my.clubName ? Colors.green : Colors.transparent,
                  child: Text(teamNameA,textAlign:TextAlign.end,style: EstiloTextoBranco.text14)),
              Images().getEscudoWidget(teamNameA,imageSize,imageSize),
            ],
          ),
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
              Container(
                color: teamNameB == my.clubName ? Colors.green : Colors.transparent,
                child: Text(teamNameB,style: EstiloTextoBranco.text14),
              ),
              Images().getUniformWidget(teamNameB,imageSize,imageSize),
            ],
          ),

        ],
      ),


    ],
  );
}