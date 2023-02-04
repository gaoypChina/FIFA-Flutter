import 'package:fifa/classes/league.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/table/statistics_league.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:flutter/material.dart';

Widget test(BuildContext context){
  return
    //TEST FUNCTIONS BUTTON
    testInitRodada == 1 ? Container(
      alignment: Alignment.topCenter,
      child: GestureDetector(
          onTap:(){
            customToast('TESTE DE FUNÇÃO');
            Navigator.push(context,MaterialPageRoute(builder: (context) => StatisticsLeague(league: League(index: 1),)));
          },
          child: const Icon(Icons.terminal_sharp,color:Colors.white,size: 50)
      ),
    ) : Container();
}