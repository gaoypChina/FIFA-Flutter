import 'package:fifa/global_variables.dart';

import '../../../player_stats_keys.dart';

class CleanSheets{

  saveNational(int jogadorID, int goalsTaken){
    if(goalsTaken==0){
      globalJogadoresLeagueCleanSheets[jogadorID]++;
      globalJogadoresCarrerCleanSheets[jogadorID]++;
    }else{
      globalJogadoresLeagueGolsSofridos[jogadorID]++;
      globalJogadoresCarrerGolsSofridos[jogadorID]++;
    }
  }

  saveInternational(int jogadorID, int goalsTaken){
    if(goalsTaken==0){
      globalInternationalPlayers[PlayerStatsKeys().keyPlayerCleanSheets]![jogadorID]++;
      globalJogadoresCarrerCleanSheets[jogadorID]++;
    }else{
      globalInternationalPlayers[PlayerStatsKeys().keyPlayerGolsSofridos]![jogadorID]++;
      globalJogadoresCarrerGolsSofridos[jogadorID]++;
    }
  }

  saveCup(int jogadorID, int goalsTaken){
    if(goalsTaken==0){
      globalCupPlayers[PlayerStatsKeys().keyPlayerCleanSheets]![jogadorID]++;
      globalJogadoresCarrerCleanSheets[jogadorID]++;
    }else{
      globalCupPlayers[PlayerStatsKeys().keyPlayerGolsSofridos]![jogadorID]++;
      globalJogadoresCarrerGolsSofridos[jogadorID]++;
    }
  }

}