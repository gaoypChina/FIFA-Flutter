import 'package:fifa/classes/semana.dart';
import 'package:fifa/global_variables.dart';

import '../../../classes/club.dart';

class UpdatePlayerVariableMatch{

  update(Club clubClass){
    if(Semana(semana).isJogoCampeonatoNacional){
      updatePlayerMatchNational(clubClass);
    }
    if(Semana(semana).isJogoCampeonatoInternacional) {
      updatePlayerMatchInternational(clubClass);
    }
  }


  updatePlayerMatchNational(Club clubClass){
    List titularPlayers = setMatchPlus1(clubClass);
    for (int playerID in titularPlayers){
      globalJogadoresLeagueMatchs[playerID]++;
      globalJogadoresCarrerMatchs[playerID]++;
    }
  }
  updatePlayerMatchInternational(Club clubClass){
    List titularPlayers = setMatchPlus1(clubClass);
    for (int playerID in titularPlayers){
      globalJogadoresInternationalMatchs[playerID]++;
      globalJogadoresCarrerMatchs[playerID]++;
    }
  }

  //List of titular player who played
  List setMatchPlus1(Club clubClass){
    List playersID = [];
    for(int i=0; i<11; i++) {
      if(clubClass.index==globalMyClubID){
        playersID.add(globalMyJogadores[i]);
      }else{
        playersID.add(clubClass.escalacao[i]);
      }
    }
    return playersID;
  }

}
