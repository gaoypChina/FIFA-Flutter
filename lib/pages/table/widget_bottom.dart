import 'package:fifa/pages/table/table_international.dart';
import 'package:fifa/pages/table/table_mata_mata.dart';
import 'package:fifa/pages/table/table_matchs.dart';
import 'package:fifa/theme/colors.dart';

import 'package:flutter/material.dart';

Widget customWidgetBottomBar (BuildContext context,String leagueInternational,Function(String leagueInternational) functionSetState){
  return                     //BOTTOM BAR
    Container(
      color: AppColors().grey1,
      child: Row(
        children: [
          const SizedBox(width: 8),
          GestureDetector(
              onTap: (){
                functionSetState('Champions');
              },
              child: Image.asset('assets/icons/championsleague.png',width: 60,height: 60)
          ),
          const SizedBox(width: 8),
          GestureDetector(
              onTap: (){
                functionSetState('Libertadores');
              },
              child: Image.asset('assets/icons/libertadores.png',width: 60,height: 60)
          ),
          GestureDetector(
              onTap: (){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TableInternational(leagueInternational: leagueInternational)));
              },
              child: const Icon(Icons.circle,color:Colors.blue,size:50)
          ),
          GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TableMatchs(leagueInternational: leagueInternational)));
              },
              child: const Icon(Icons.circle,color:Colors.green,size:50)
          ),
          GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TableMataMata(leagueInternational: leagueInternational)));
              },
              child: const Icon(Icons.circle,color:Colors.red,size:50)
          ),
        ],
      ),
    );
}