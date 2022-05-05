import 'package:fifa/classes/historic/total_victories.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/cupertino.dart';

class CoachHistoricData{
  int victory = 2;
  int draw = 1;
  int loss = 0;
  double pointsPercentage = 0;

  CoachHistoricData(){
    TotalVictories totalVictories = TotalVictories();
    totalVictories.getTotalResults();
    victory = totalVictories.totalVictory;
    draw = totalVictories.totalDraw;
    loss = totalVictories.totalLoss;

    pointsPercentage = (victory*3+draw) / ((victory+draw+loss)*3)*100;
  }

  Map<String,double> dataPieChartMap(BuildContext context){
    return {
      Translation(context).text.victories: victory.toDouble(),
      Translation(context).text.draws: draw.toDouble(),
      Translation(context).text.losses: loss.toDouble(),
    };
  }

}
