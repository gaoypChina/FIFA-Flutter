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
    setGloballyClubs(leagueClass, leagueName.championsLeague, clubIndexes, leagueName.turquia, 2);
    setGloballyClubs(leagueClass, leagueName.championsLeague, clubIndexes, leagueName.ligaEuropa, 3);
    setGloballyClubs(leagueClass, leagueName.championsLeague, clubIndexes, leagueName.lesteEuropeu, 3);
  }

  sortGroupsChampions(){
    LeagueOfficialNames leagueName = LeagueOfficialNames();
    InternationalLeague intLeague = InternationalLeague();
    //Redistribute Cabeça de chaves
    //0-ING1 1-INGL2(1) 2-ESP1(4) 3-ESP2(5) 4-ITA1(8) 5-ITA2(9) 6-ALE1(12) 7-FRA1(16)
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 4, position2: 1);
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 28, position2: 2);
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 8, position2: 4);
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 12, position2: 5);
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 16, position2: 8);
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 20, position2: 9);
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 24, position2: 12);
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 24, position2: 16);

    //8-FRA4(15) 9-ESP4(7) 10-ALE4(15) 11-ITA3(10) 12-FRA3(18) 13-ING4(3) 14-ITA4(11) 15-ALE3(14)
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 5, position2: 7);
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 9, position2: 15);
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 13, position2: 10);
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 17, position2: 18);
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 21, position2: 3);
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 25, position2: 11);
    intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 29, position2: 14);


    //Organiza o resto aleatoriamente
    for(int group=0; group<8; group++){
      for(int i=2; i<4; i++){
        int random = Random().nextInt(32);
        if(random%4 ==2 || random%4==3){//só muda se for da posição 3 e 4
          intLeague.sortClubs(internationalName: leagueName.championsLeague, position1: 4*group+i, position2: random);
          }
      }
    }

  }

  setTeamsLibertadores(League leagueClass, List clubIndexes){

    LeagueOfficialNames l = LeagueOfficialNames();
    InternationalLeague intLeague = InternationalLeague();

    if(leagueClass.name == l.brasil1){
      for(int i=0; i<8; i++){
        intLeague.setClub(l.libertadores, clubIndexes[i], i*4);
      }
    }
    else if(leagueClass.name == l.argentina){
      intLeague.setClub(l.libertadores, clubIndexes[0], 27);
      intLeague.setClub(l.libertadores, clubIndexes[1], 31);
      intLeague.setClub(l.libertadores, clubIndexes[2], 21);
      intLeague.setClub(l.libertadores, clubIndexes[3], 17);
      intLeague.setClub(l.libertadores, clubIndexes[4], 13);
      intLeague.setClub(l.libertadores, clubIndexes[5], 9);
    }
    else if(leagueClass.name == l.mercosul){
      intLeague.setClub(l.libertadores, clubIndexes[0], 29);
      intLeague.setClub(l.libertadores, clubIndexes[1], 25);
      intLeague.setClub(l.libertadores, clubIndexes[2], 5);
      intLeague.setClub(l.libertadores, clubIndexes[3], 1);
      intLeague.setClub(l.libertadores, clubIndexes[4], 2);
      intLeague.setClub(l.libertadores, clubIndexes[5], 6);
      intLeague.setClub(l.libertadores, clubIndexes[6], 10);
      intLeague.setClub(l.libertadores, clubIndexes[7], 14);
      intLeague.setClub(l.libertadores, clubIndexes[8], 18);
      intLeague.setClub(l.libertadores, clubIndexes[9], 22);
      intLeague.setClub(l.libertadores, clubIndexes[10], 26);
      intLeague.setClub(l.libertadores, clubIndexes[11], 30);
    }
    else if(leagueClass.name == l.colombia){
      intLeague.setClub(l.libertadores, clubIndexes[0], 3);
      intLeague.setClub(l.libertadores, clubIndexes[1], 7);
      intLeague.setClub(l.libertadores, clubIndexes[2], 11);
      intLeague.setClub(l.libertadores, clubIndexes[3], 15);
      intLeague.setClub(l.libertadores, clubIndexes[4], 19);
      intLeague.setClub(l.libertadores, clubIndexes[5], 23);
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
    setGloballyClubs(leagueClass, leagueName.europaLeagueOficial, clubIndexes, leagueName.turquia, 3);
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

