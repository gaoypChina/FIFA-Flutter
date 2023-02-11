import 'package:fifa/classes/simulate/my_match/counter.dart';
import 'package:fifa/classes/simulate/my_match/my_match_simulation.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';

Widget tacticsWidget(BuildContext context,MyMatchSimulation myMatchSimulation,PosturaDoTimeClass posturaDoTime){
  return Column(
    children: [
      Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.white, //cor da borda do checkbox
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
                onTap:(){
                  posturaDoTime.setValue(posturaDoTime.defesa);
                },
                child: Opacity(
                    opacity:posturaDoTime.value == posturaDoTime.defesa ? 1: 0.5,
                    child: Image.asset('assets/icons/defensive.png',height: 35))),
            GestureDetector(
                onTap:(){
                  posturaDoTime.setValue(posturaDoTime.normal);
                },
                child: Opacity(
                    opacity:posturaDoTime.value == posturaDoTime.normal ? 1: 0.5,
                    child: Image.asset('assets/icons/moderate.png',height: 35))),
            GestureDetector(
                onTap:(){
                  posturaDoTime.setValue(posturaDoTime.ataque);
                },
                child: Opacity(
                    opacity:posturaDoTime.value == posturaDoTime.ataque ? 1: 0.5,
                    child: Image.asset('assets/icons/very offensive.png',height: 35))),
            globalSeeProbabilities ? Column(
              children: [
                Text(Translation(context).text.scoreProbability,style: EstiloTextoBranco.text16),
                Text('${myMatchSimulation.probGM.toString()}%',style: EstiloTextoBranco.text16),
              ],
            ) : Container(),
            globalSeeProbabilities ? Column(
              children: [
                Text(Translation(context).text.takeProbability,style: EstiloTextoBranco.text16),
                Text('${myMatchSimulation.probGS.toString()}%',style: EstiloTextoBranco.text16),
              ],
            ) : Container(),
          ],
        ),
      ),
    ],
  );
}