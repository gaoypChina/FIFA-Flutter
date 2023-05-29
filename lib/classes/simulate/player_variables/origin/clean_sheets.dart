import 'package:fifa/global_variables.dart';

import '../../../player_stats_keys.dart';

class CleanSheets{

  saveNational(int playerID, int goalsTaken){
    if(goalsTaken==0){
      globalLeaguePlayers[PlayerStatsKeys().keyPlayerCleanSheets]![playerID]++;
      globalJogadoresCarrerCleanSheets[playerID]++;
    }else{
      globalLeaguePlayers[PlayerStatsKeys().keyPlayerGolsSofridos]![playerID]++;
      globalJogadoresCarrerGolsSofridos[playerID]++;
    }
  }

  saveInternational(int playerID, int goalsTaken){
    if(goalsTaken==0){
      globalInternationalPlayers[PlayerStatsKeys().keyPlayerCleanSheets]![playerID]++;
      globalJogadoresCarrerCleanSheets[playerID]++;
    }else{
      globalInternationalPlayers[PlayerStatsKeys().keyPlayerGolsSofridos]![playerID]++;
      globalJogadoresCarrerGolsSofridos[playerID]++;
    }
  }

  saveCup(int playerID, int goalsTaken){
    if(goalsTaken==0){
      globalCupPlayers[PlayerStatsKeys().keyPlayerCleanSheets]![playerID]++;
      globalJogadoresCarrerCleanSheets[playerID]++;
    }else{
      globalCupPlayers[PlayerStatsKeys().keyPlayerGolsSofridos]![playerID]++;
      globalJogadoresCarrerGolsSofridos[playerID]++;
    }
  }

}