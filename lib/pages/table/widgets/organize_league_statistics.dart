import 'package:fifa/classes/dict_keys/player_stats_keys.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/functions/order_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';

List organizarVariavelLeague(League league, int goalOrYellowOrRed) {
  //Oraganiza em ordem lista de artilheiros, cartoes amarelos ou cartoes amarelos
  //Mostra no Widget de League Results

  List clubsInLeagueIDs = league.getClassification();
  List copyVariableList = [];
  List players = [];

  if(goalOrYellowOrRed==4){
    for(int index=0; index < globalJogadoresName.length; index++){
      int playerClubID = globalJogadoresClubIndex[index];
      if(clubsInLeagueIDs.contains(playerClubID)) {
          double points = Jogador(index: index).gradeLeague;
          copyVariableList.add(points);
          players.add(index);
      }
    }
    //lista EM ORDEM
    players = Order().listDecrescente(listA: copyVariableList, listB: players, length: players.length)[1];
    return players;
  }else{
    List global = [];
    if(goalOrYellowOrRed==0){global = globalLeaguePlayers[PlayerStatsKeys().keyPlayerGoals]!;}
    if(goalOrYellowOrRed==1){global = globalJogadoresYellowCard;}
    if(goalOrYellowOrRed==2){global = globalJogadoresRedCard;}
    if(goalOrYellowOrRed==3){global = globalLeaguePlayers[PlayerStatsKeys().keyPlayerAssists]!;}
    if(goalOrYellowOrRed==5){global = globalLeaguePlayers[PlayerStatsKeys().keyPlayerCleanSheets]!;}
    if(goalOrYellowOrRed==6){global = globalLeaguePlayers[PlayerStatsKeys().keyPlayerGolsSofridos]!;}

    List copyVariableList = [];
    List leaguePlayers = [];

    for(int index=0; index<globalJogadoresClubIndex.length; index++){
      if(clubsInLeagueIDs.contains(globalJogadoresClubIndex[index])){
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
}