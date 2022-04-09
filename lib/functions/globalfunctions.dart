import 'package:fifa/classes/league.dart';
import 'package:fifa/functions/order_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

class GlobalFunctions{

  getInternationalLeagueNumber(String internationalLeague){
    if(internationalLeague == LeagueOfficialNames().championsLeague){
      return 0;
    }
    if(internationalLeague == LeagueOfficialNames().libertadores){
      return 1;
    }
    if(internationalLeague == LeagueOfficialNames().resto){
      return 2;
    }
    return -1;
  }

  List organizarVariavelLeague(int leagueID, int goalOrYellowOrRed) {
    //Oraganiza em ordem lista de artilheiros, cartoes amarelos ou cartoes amarelos

    List global = [];
    if(goalOrYellowOrRed==0){global = globalJogadoresTotalGoals;}
    if(goalOrYellowOrRed==1){global = globalJogadoresYellowCard;}
    if(goalOrYellowOrRed==2){global = globalJogadoresRedCard;}

    List copyVariableList = [];
    List leaguePlayers = [];

    List clubsInLeague = League(index: leagueID).getClassification();
    for(int index=0; index<globalJogadoresClubIndex.length; index++){
      if(clubsInLeague.contains(globalJogadoresClubIndex[index])){
        try {// Na 1ªrodada pode dar pau, pq a lista nao foi criada
          if (global[index] >= 0) {
            copyVariableList.add(global[index]);
            leaguePlayers.add(index);
          }
        }catch(e){
          print('Erro GlobalFunctions().organizarVariavelLeague: '+e.toString());
        }
      }
    }
    //ARTILHEIROS/lista EM ORDEM
    leaguePlayers = Order().listDecrescente(listA: copyVariableList, listB: leaguePlayers, length: leaguePlayers.length)[1];

    return leaguePlayers;
  }

}
