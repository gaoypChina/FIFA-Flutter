import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/order_list.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';

class TopScorers{
  Map allHistoricScorers = globalHistoricTopScorers;

  late int playerID;
  late int playerGoals;
  late String clubName;
  late String playerName;

  Map getDataYear(int year){
    return allHistoricScorers[year];
  }

  getInPosition(int year, int position){
    Map playersMap = getDataYear(year);
    List listVariables = playersMap[position];
    playerID = listVariables[0];
    playerGoals = listVariables[1];
    playerName = Jogador(index: playerID).name;
    clubName = Club(index: listVariables[2]).name;
  }

  orderAndSave(List best, List bestID){
    //ORGANIZA EM ORDEM DECRESCENTE AS LISTAS
    List result = Order().listDecrescente(listA: best, listB: bestID, length: best.length);
    Map mapResultBest = {};
    for(int i=0;i<result[0].length;i++){
      Jogador jogador = Jogador(index: result[1][i]);
      mapResultBest[i] = [result[1][i],result[0][i],jogador.clubID];// [posicao]={id,ovr,clubID}
    }
    //SALVA A VARIAVEL GLOBAL
    globalHistoricTopScorers[ano] = mapResultBest;
  }

}