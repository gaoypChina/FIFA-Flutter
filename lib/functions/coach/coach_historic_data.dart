import 'package:fifa/classes/historic/total_victories.dart';

class CoachHistoricData{
  int victory=2;
  int draw=1;
  int loss=0;
  double pointsPercentage=0;

  CoachHistoricData(){
    TotalVictories totalVictories = TotalVictories();
    totalVictories.getTotalResults();
    victory = totalVictories.totalVictory;
    draw = totalVictories.totalDraw;
    loss = totalVictories.totalLoss;

    pointsPercentage = (victory*3+draw) / ((victory+draw+loss)*3)*100;
  }

  Map<String,double> dataPieChartMap(){
    return {
      "Vitórias": victory.toDouble(),
      "Empates": draw.toDouble(),
      "Derrotas": loss.toDouble(),
    };
  }

}
