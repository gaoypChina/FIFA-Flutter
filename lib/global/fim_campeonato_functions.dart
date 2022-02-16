import 'dart:math';

import 'package:fifa/classes/league.dart';
import 'package:fifa/global/global_variables.dart';
import 'package:fifa/global/globalfunctions.dart';

class FimDoCampeonato{

  redistribuirTimes(){
    for(int i=0; i<leaguesListRealIndex.length; i++){
      int leagueID = leaguesListRealIndex[i];
      League leagueClass = League(index: leagueID);

      setTeamsChampions(leagueClass);
      setTeamsLibertadores(leagueClass);
      //setTeamsRebaixamento(leagueClass);
    }

    //ESTOU CLASSIFICADO

  }

  setTeamsChampions(League leagueClass){
    List clubIndexes = leagueClass.getClassification();
    if(leagueClass.name == 'Premier League'){
      for(int i=0; i<4; i++){
        globalInternational32ClubsID[0].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == 'La Liga'){
      for(int i=0; i<4; i++){
        globalInternational32ClubsID[0].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == 'Serie A TIM'){
      for(int i=0; i<4; i++){
        globalInternational32ClubsID[0].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == 'Bundesliga'){
      for(int i=0; i<4; i++){
        globalInternational32ClubsID[0].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == 'Ligue 1'){
      for(int i=0; i<4; i++){
        globalInternational32ClubsID[0].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == 'Liga Europeia'){
      for(int i=0; i<6; i++){
        globalInternational32ClubsID[0].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == 'Leste Europeu'){
      for(int i=0; i<6; i++){
        globalInternational32ClubsID[0].add(clubIndexes[i]);
      }
    }

    //Redistribute Cabeça de chaves
    //0-ING1 1-INGL2(1) 2-ESP1(4) 3-ESP2(5) 4-ITA1(8) 5-ITA2(9) 6-ALE1(12) 7-FRA1(16)
    GlobalFunctions().changeVariables(globalInternational32ClubsID[4], globalInternational32ClubsID[1]);
    GlobalFunctions().changeVariables(globalInternational32ClubsID[8], globalInternational32ClubsID[4]);
    GlobalFunctions().changeVariables(globalInternational32ClubsID[12], globalInternational32ClubsID[5]);
    GlobalFunctions().changeVariables(globalInternational32ClubsID[16], globalInternational32ClubsID[8]);
    GlobalFunctions().changeVariables(globalInternational32ClubsID[20], globalInternational32ClubsID[9]);
    GlobalFunctions().changeVariables(globalInternational32ClubsID[24], globalInternational32ClubsID[12]);
    GlobalFunctions().changeVariables(globalInternational32ClubsID[28], globalInternational32ClubsID[16]);

    //8-FRA4(15) 9-ESP4(7) 10-ALE4(15) 11-ITA3(10) 12-FRA3(18) 13-ING4(3) 14-ITA4(11) 15-ALE3(14)
    GlobalFunctions().changeVariables(globalInternational32ClubsID[1], globalInternational32ClubsID[1]);
    GlobalFunctions().changeVariables(globalInternational32ClubsID[5], globalInternational32ClubsID[7]);
    GlobalFunctions().changeVariables(globalInternational32ClubsID[9], globalInternational32ClubsID[15]);
    GlobalFunctions().changeVariables(globalInternational32ClubsID[13], globalInternational32ClubsID[10]);
    GlobalFunctions().changeVariables(globalInternational32ClubsID[17], globalInternational32ClubsID[18]);
    GlobalFunctions().changeVariables(globalInternational32ClubsID[21], globalInternational32ClubsID[3]);
    GlobalFunctions().changeVariables(globalInternational32ClubsID[25], globalInternational32ClubsID[11]);
    GlobalFunctions().changeVariables(globalInternational32ClubsID[29], globalInternational32ClubsID[14]);
    //Organiza o resto aleatoriamente
    for(int group=0; group<8; group++){
      for(int i=2; i<4; i++){
        int random = Random().nextInt(32);
        if(random%4 ==2 || random%4==3){//só muda se for da posição 3 e 4
          GlobalFunctions().changeVariables(globalInternational32ClubsID[4*group+i], globalInternational32ClubsID[random]);
        }
      }
    }

  }

  setTeamsLibertadores(League leagueClass){
    List clubIndexes = leagueClass.getClassification();
    if(leagueClass.name == 'Brasileirão'){
      for(int i=0; i<6; i++){
        globalInternational32ClubsID[1].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == 'Campeonato Argentino'){
      for(int i=0; i<6; i++){
        globalInternational32ClubsID[1].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == 'Sul-Americano'){
      for(int i=0; i<12; i++){
        globalInternational32ClubsID[1].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == 'Liga Colombia MX'){
      for(int i=0; i<8; i++){
        globalInternational32ClubsID[1].add(clubIndexes[i]);
      }
    }

    //Redistribute Cabeça de chaves
    //Ex:
    // 0-0 4-1 8-2 12-3... 1-8 5-9 9-10... 3-16 7-17 11-18... 4-24 8-25 12-26
    int linear =0;
    for(int i=0; i<4; i++){
      for(int group=0; group<8; group++){
          GlobalFunctions().changeVariables(globalInternational32ClubsID[4*group+i], globalInternational32ClubsID[linear]);
          linear++;
      }
    }

  }

  setTeamsRebaixamento(League leagueClass){
    List clubIndexes = leagueClass.getClassification();
    String aux = '';
    if(leagueClass.name == 'Premier League'){
      List clubIndexes2 = League(index: 2).getClassification();
      for(int i=clubsMapPremier.length-3; i<clubsMapPremier.length; i++){
        aux = clubsMapPremier[clubIndexes[i]];clubsMapPremier[clubIndexes[i]] = clubsMapChampionship[clubIndexes2[i-13]];clubsMapChampionship[clubIndexes2[i-13]]= aux;
      }
    }
    if(leagueClass.name == 'La Liga'){}
    if(leagueClass.name == 'Serie A TIM'){}
    if(leagueClass.name == 'Bundesliga'){}
    if(leagueClass.name == 'Brasileirão'){}
    if(leagueClass.name == 'Brasileirão - Série B'){}

  }
}

