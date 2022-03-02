import 'dart:math';

import 'package:fifa/classes/league.dart';
import 'package:fifa/functions/international_league.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

class FimDoCampeonatoLocal{

  int indexChampions = funcGetInternationalLeagueIndex(internationalLeagueName: LeagueOfficialNames().championsLeague);
  int indexLibertadores = funcGetInternationalLeagueIndex(internationalLeagueName: LeagueOfficialNames().libertadores);

  setAll032InternationalTeams(){
    globalInternational32ClubsID[indexChampions] = [];
    globalInternational32ClubsID[indexLibertadores] = List.filled(32, 0);
    for(int i=0; i<leaguesListRealIndex.length; i++){
      int leagueID = leaguesListRealIndex[i];
      League leagueClass = League(index: leagueID);

      setTeamsChampions(leagueClass);
      setTeamsLibertadores(leagueClass);
    }

    //Sortear grupo Champions
    sortGroupsChampions();

  }

  setTeamsChampions(League leagueClass){
    List clubIndexes = leagueClass.getClassification();
    if(leagueClass.name == LeagueOfficialNames().inglaterra1){
      for(int i=0; i<4; i++){
        globalInternational32ClubsID[indexChampions].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == LeagueOfficialNames().espanha1){
      for(int i=0; i<4; i++){
        globalInternational32ClubsID[indexChampions].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == LeagueOfficialNames().italia1){
      for(int i=0; i<4; i++){
        globalInternational32ClubsID[indexChampions].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == LeagueOfficialNames().alemanha1){
      for(int i=0; i<4; i++){
        globalInternational32ClubsID[indexChampions].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == LeagueOfficialNames().franca1){
      for(int i=0; i<4; i++){
        globalInternational32ClubsID[indexChampions].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == LeagueOfficialNames().ligaEuropa){
      for(int i=0; i<6; i++){
        globalInternational32ClubsID[indexChampions].add(clubIndexes[i]);
      }
    }
    if(leagueClass.name == LeagueOfficialNames().lesteEuropeu){
      for(int i=0; i<6; i++){
        globalInternational32ClubsID[indexChampions].add(clubIndexes[i]);
      }
    }


  }
  changeVariablesInListChampions({required int position1,required int position2,required List list}){
    int aux = list[indexChampions][position1]; list[indexChampions][position1]=list[indexChampions][position2]; list[indexChampions][position2]=aux;
    return list;
  }
  sortGroupsChampions(){
    //Redistribute Cabeça de chaves
    //0-ING1 1-INGL2(1) 2-ESP1(4) 3-ESP2(5) 4-ITA1(8) 5-ITA2(9) 6-ALE1(12) 7-FRA1(16)
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 4, position2: 1, list: globalInternational32ClubsID);
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 28, position2: 2, list: globalInternational32ClubsID);
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 8, position2: 4, list: globalInternational32ClubsID);
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 12, position2: 5, list: globalInternational32ClubsID);
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 16, position2: 8, list: globalInternational32ClubsID);
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 20, position2: 9, list: globalInternational32ClubsID);
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 24, position2: 12, list: globalInternational32ClubsID);
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 24, position2: 16, list: globalInternational32ClubsID);

    //8-FRA4(15) 9-ESP4(7) 10-ALE4(15) 11-ITA3(10) 12-FRA3(18) 13-ING4(3) 14-ITA4(11) 15-ALE3(14)
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 5, position2: 7, list: globalInternational32ClubsID);
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 9, position2: 15, list: globalInternational32ClubsID);
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 13, position2: 10, list: globalInternational32ClubsID);
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 17, position2: 18, list: globalInternational32ClubsID);
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 21, position2: 3, list: globalInternational32ClubsID);
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 25, position2: 11, list: globalInternational32ClubsID);
    globalInternational32ClubsID = changeVariablesInListChampions(position1: 29, position2: 14, list: globalInternational32ClubsID);

    //Organiza o resto aleatoriamente
    for(int group=0; group<8; group++){
      for(int i=2; i<4; i++){
        int random = Random().nextInt(32);
        if(random%4 ==2 || random%4==3){//só muda se for da posição 3 e 4
          globalInternational32ClubsID = changeVariablesInListChampions(position1: 4*group+i, position2: random, list: globalInternational32ClubsID);
        }
      }
    }
  }


  setTeamsLibertadores(League leagueClass){
    List clubIndexes = leagueClass.getClassification();

    if(leagueClass.name == LeagueOfficialNames().brasil1){
      for(int i=0; i<8; i++){
        globalInternational32ClubsID[indexLibertadores][i*4] = clubIndexes[i];
      }
    }
    if(leagueClass.name == LeagueOfficialNames().argentina){
      globalInternational32ClubsID[indexLibertadores][27] = clubIndexes[0];
      globalInternational32ClubsID[indexLibertadores][31] = clubIndexes[1];

      globalInternational32ClubsID[indexLibertadores][21] = clubIndexes[2];
      globalInternational32ClubsID[indexLibertadores][17] = clubIndexes[3];
      globalInternational32ClubsID[indexLibertadores][13] = clubIndexes[4];
      globalInternational32ClubsID[indexLibertadores][9] = clubIndexes[5];
    }
    if(leagueClass.name == LeagueOfficialNames().sulamericano){
      globalInternational32ClubsID[indexLibertadores][29] = clubIndexes[0];
      globalInternational32ClubsID[indexLibertadores][25] = clubIndexes[1];
      globalInternational32ClubsID[indexLibertadores][5] = clubIndexes[2];
      globalInternational32ClubsID[indexLibertadores][1] = clubIndexes[3];
      globalInternational32ClubsID[indexLibertadores][2] = clubIndexes[4];
      globalInternational32ClubsID[indexLibertadores][6] = clubIndexes[5];
      globalInternational32ClubsID[indexLibertadores][10] = clubIndexes[6];
      globalInternational32ClubsID[indexLibertadores][14] = clubIndexes[7];
      globalInternational32ClubsID[indexLibertadores][18] = clubIndexes[8];
      globalInternational32ClubsID[indexLibertadores][22] = clubIndexes[9];
      globalInternational32ClubsID[indexLibertadores][26] = clubIndexes[10];
      globalInternational32ClubsID[indexLibertadores][30] = clubIndexes[11];
    }
    if(leagueClass.name == LeagueOfficialNames().colombiaMexico){
      globalInternational32ClubsID[indexLibertadores][3] = clubIndexes[0];
    globalInternational32ClubsID[indexLibertadores][7] = clubIndexes[1];
    globalInternational32ClubsID[indexLibertadores][11] = clubIndexes[2];
    globalInternational32ClubsID[indexLibertadores][15] = clubIndexes[3];
    globalInternational32ClubsID[indexLibertadores][19] = clubIndexes[4];
    globalInternational32ClubsID[indexLibertadores][23] = clubIndexes[5];
    }


  }

}

