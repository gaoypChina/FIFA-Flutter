import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/functions/order_list.dart';
import 'package:fifa/classes/player_stats_keys.dart';
import 'package:fifa/global_variables.dart';

List organizarVariavelLeague(League league, int goalOrYellowOrRed) {
  //Oraganiza em ordem lista de artilheiros, cartoes amarelos ou cartoes amarelos
  //Mostra no Widget de League Results

  List global = [];
  if(goalOrYellowOrRed==0){global = globalLeaguePlayers[PlayerStatsKeys().keyPlayerGoals]!;}
  if(goalOrYellowOrRed==1){global = globalJogadoresYellowCard;}
  if(goalOrYellowOrRed==2){global = globalJogadoresRedCard;}
  if(goalOrYellowOrRed==3){global = globalLeaguePlayers[PlayerStatsKeys().keyPlayerAssists]!;}
  if(goalOrYellowOrRed==4){global = globalJogadoresGrades;}
  if(goalOrYellowOrRed==5){global = globalLeaguePlayers[PlayerStatsKeys().keyPlayerCleanSheets]!;}

  List copyVariableList = [];
  List leaguePlayers = [];

  List clubsInLeague = league.getClassification();
  for(int index=0; index<globalJogadoresClubIndex.length; index++){
    if(clubsInLeague.contains(globalJogadoresClubIndex[index])){
      try {// Na 1ªrodada pode dar pau, pq a lista nao foi criada
        if (global[index] >= 0) {
          copyVariableList.add(global[index]);
          leaguePlayers.add(index);
        }
      }catch(e){
        print('Error GlobalFunctions().organizarVariavelLeague: '+e.toString());
      }
    }
  }
  //ARTILHEIROS/lista EM ORDEM
  leaguePlayers = Order().listDecrescente(listA: copyVariableList, listB: leaguePlayers, length: leaguePlayers.length)[1];
  return leaguePlayers;
}