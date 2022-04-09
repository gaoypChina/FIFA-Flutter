import 'dart:math';

import '../../../../classes/club.dart';
import '../../../../global_variables.dart';

class Assists{

  //ASSISTS
  int setAssists(Club clubClass){
    //SETA ASSISTENCIA
    int quemfez = funcQuemfezAssistencia();
    if(quemfez>0) {
      int jogadorID = clubClass.escalacao[quemfez];
      return jogadorID;
    }
    return -1;
  }
  saveAssistsNational(int jogadorID){
    if(jogadorID>=0) {
      globalJogadoresLeagueAssists[jogadorID]++;
    }
  }
  saveAssistsInternational(int jogadorID){
    if(jogadorID>=0) {
      globalJogadoresInternationalAssists[jogadorID]++;
    }
  }


  funcQuemfezAssistencia(){
    int prob = Random().nextInt(100);
    if(Random().nextInt(100)<75) { //nem todos gols tem assitencia, 75% tem
      late int quemfez;
      if(prob>80){quemfez=8;}
      else if(prob>59){quemfez=7;}
      else if(prob>47){quemfez=9;}
      else if(prob>35){quemfez=10;}
      else if(prob>25){quemfez=6;}
      else if(prob>15){quemfez=5;}
      else if(prob>11){quemfez=4;}
      else if(prob>7){quemfez=3;}
      else if(prob>3){quemfez=2;}
      else if(prob>=0){quemfez=1;}

      return quemfez;
    }
    return -1;
  }

}