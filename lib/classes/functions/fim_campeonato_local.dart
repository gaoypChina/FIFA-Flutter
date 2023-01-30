import 'dart:math';

import 'package:fifa/classes/international_league.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/values/league_names.dart';

class FimDoCampeonatoLocal{

  setAll032InternationalTeams(){

    customToast('Defining Classified Teams to International Leagues');

    InternationalLeague().resetAll();


    for(int i=0; i<leaguesListRealIndex.length; i++){
      int leagueID = leaguesListRealIndex[i];
      League leagueClass = League(index: leagueID);

      List clubIndexes = leagueClass.getClassification();

      setTeamsChampions(leagueClass, clubIndexes);
      setTeamsLibertadores(leagueClass, clubIndexes);
      setTeamsEuropaLeague(leagueClass, clubIndexes);
      setTeamsSulAmericana(leagueClass, clubIndexes);
    }

    randomize(LeagueOfficialNames().europaLeagueOficial);
    randomize(LeagueOfficialNames().copaSulAmericana);

    //Sortear grupo Champions
    sortGroupsChampions();

  }



  setTeamsChampions(League leagueClass, List clubIndexes){
    LeagueOfficialNames leagueName = LeagueOfficialNames();
    setGloballyClubs(leagueClass, leagueName.championsLeague, clubIndexes, leagueName.inglaterra1, 4);
    setGloballyClubs(leagueClass, leagueName.championsLeague, clubIndexes, leagueName.espanha1, 4);
    setGloballyClubs(leagueClass, leagueName.championsLeague, clubIndexes, leagueName.italia1, 4);
    setGloballyClubs(leagueClass, leagueName.championsLeague, clubIndexes, leagueName.alemanha1, 4);
    setGloballyClubs(leagueClass, leagueName.championsLeague, clubIndexes, leagueName.franca1, 4);
    setGloballyClubs(leagueClass, leagueName.championsLeague, clubIndexes, leagueName.portugal, 2);
    setGloballyClubs(leagueClass, leagueName.championsLeague, clubIndexes, leagueName.holanda, 2);
    setGloballyClubs(leagueClass, leagueName.championsLeague, clubIndexes, leagueName.turquiaGrecia, 2);
    setGloballyClubs(leagueClass, leagueName.championsLeague, clubIndexes, leagueName.ligaEuropa, 3);
    setGloballyClubs(leagueClass, leagueName.championsLeague, clubIndexes, leagueName.lesteEuropeu, 3);
  }
  sortGroupsChampions(){
    LeagueOfficialNames leagueName = LeagueOfficialNames();
    //Redistribute Cabeça de chaves
    //0-ING1 1-INGL2(1) 2-ESP1(4) 3-ESP2(5) 4-ITA1(8) 5-ITA2(9) 6-ALE1(12) 7-FRA1(16)
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 4, position2: 1);
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 28, position2: 2);
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 8, position2: 4);
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 12, position2: 5);
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 16, position2: 8);
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 20, position2: 9);
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 24, position2: 12);
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 24, position2: 16);

    //8-FRA4(15) 9-ESP4(7) 10-ALE4(15) 11-ITA3(10) 12-FRA3(18) 13-ING4(3) 14-ITA4(11) 15-ALE3(14)
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 5, position2: 7);
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 9, position2: 15);
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 13, position2: 10);
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 17, position2: 18);
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 21, position2: 3);
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 25, position2: 11);
    InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 29, position2: 14);


    //Organiza o resto aleatoriamente
    for(int group=0; group<8; group++){
      for(int i=2; i<4; i++){
        int random = Random().nextInt(32);
        if(random%4 ==2 || random%4==3){//só muda se for da posição 3 e 4
          InternationalLeague().sortClubs(internationalName: leagueName.championsLeague, position1: 4*group+i, position2: random);
          }
      }
    }

  }

  setTeamsLibertadores(League leagueClass, List clubIndexes){

    InternationalLeague().reset32Zeros(LeagueOfficialNames().libertadores);

    if(leagueClass.name == LeagueOfficialNames().brasil1){
      for(int i=0; i<8; i++){
        InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[i], i*4);
      }
    }
    if(leagueClass.name == LeagueOfficialNames().argentina){
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[0], 27);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[1], 31);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[2], 21);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[3], 17);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[4], 13);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[5], 9);
    }
    if(leagueClass.name == LeagueOfficialNames().mercosul){
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[0], 29);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[1], 25);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[2], 5);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[3], 1);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[4], 2);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[5], 6);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[6], 10);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[7], 14);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[8], 18);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[9], 22);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[10], 26);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[11], 30);
    }
    if(leagueClass.name == LeagueOfficialNames().colombia){
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[0], 3);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[1], 7);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[2], 11);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[3], 15);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[4], 19);
      InternationalLeague().setClub(LeagueOfficialNames().libertadores, clubIndexes[5], 23);
    }

  }


  //////////////////////////////////////////////////////////////////////////////
  // EUROPA LEAGUE E SULAMERICANA
  //////////////////////////////////////////////////////////////////////////////
  setGloballyClubs(League leagueClass, String intName, List clubIndexes, String leagueCompared, int nClubs){
    int nTeamsClassifiedInt = nTeamsClassified[leagueClass.name] ?? 0;
    if(intName == LeagueOfficialNames().championsLeague || intName == LeagueOfficialNames().libertadores){
      nTeamsClassifiedInt = 0;
    }
    if(leagueClass.name == leagueCompared){
      for(int i=0; i<nClubs; i++){
        int clubID = clubIndexes[i+nTeamsClassifiedInt];
        InternationalLeague().addClub(intName, clubID);
      }
    }
  }
  setTeamsEuropaLeague(League leagueClass, List clubIndexes){
    LeagueOfficialNames leagueName = LeagueOfficialNames();
    setGloballyClubs(leagueClass, leagueName.europaLeagueOficial, clubIndexes, leagueName.inglaterra1, 3);
    setGloballyClubs(leagueClass, leagueName.europaLeagueOficial, clubIndexes, leagueName.espanha1, 3);
    setGloballyClubs(leagueClass, leagueName.europaLeagueOficial, clubIndexes, leagueName.italia1, 3);
    setGloballyClubs(leagueClass, leagueName.europaLeagueOficial, clubIndexes, leagueName.alemanha1, 3);
    setGloballyClubs(leagueClass, leagueName.europaLeagueOficial, clubIndexes, leagueName.franca1, 3);
    setGloballyClubs(leagueClass, leagueName.europaLeagueOficial, clubIndexes, leagueName.portugal, 2);
    setGloballyClubs(leagueClass, leagueName.europaLeagueOficial, clubIndexes, leagueName.holanda, 2);
    setGloballyClubs(leagueClass, leagueName.europaLeagueOficial, clubIndexes, leagueName.turquiaGrecia, 3);
    setGloballyClubs(leagueClass, leagueName.europaLeagueOficial, clubIndexes, leagueName.ligaEuropa, 5);
    setGloballyClubs(leagueClass, leagueName.europaLeagueOficial, clubIndexes, leagueName.lesteEuropeu, 5);

  }

  setTeamsSulAmericana(League leagueClass, List clubIndexes){
    LeagueOfficialNames leagueName = LeagueOfficialNames();
    setGloballyClubs(leagueClass, leagueName.copaSulAmericana, clubIndexes, leagueName.brasil1, 6);
    setGloballyClubs(leagueClass, leagueName.copaSulAmericana, clubIndexes, leagueName.argentina, 6);
    setGloballyClubs(leagueClass, leagueName.copaSulAmericana, clubIndexes, leagueName.mercosul, 6);
    setGloballyClubs(leagueClass, leagueName.copaSulAmericana, clubIndexes, leagueName.colombia, 6);
    setGloballyClubs(leagueClass, leagueName.copaSulAmericana, clubIndexes, leagueName.mexico, 4);
    setGloballyClubs(leagueClass, leagueName.copaSulAmericana, clubIndexes, leagueName.estadosUnidos, 4);

  }

  randomize(String internationalName){
    //Organiza o resto aleatoriamente
    for(int group=0; group<8; group++){
      for(int i=0; i<4; i++){
        int random = Random().nextInt(32);
        InternationalLeague().sortClubs(internationalName: internationalName, position1: 4*group+i, position2: random);
      }
    }
  }

}

