import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/international_league.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/functions/international_league_manipulation.dart';
import 'package:fifa/classes/playing_international.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_names.dart';

import '../values/league_clubs.dart';
class My{

  String clubName = '';
  late int clubID;
  late int leagueID;
  late String campeonatoName;
  late int posicaoChave;
  late int scoreGame;
  late double money;
  late String esquemaTatico;
  late List jogadores;
  late String internationalLeagueName;
  late String playingInternational;

  My(){
    clubID = globalMyClubID;
    clubName = clubsAllNameList[globalMyClubID];
    campeonatoName = getLeagueName();
    leagueID = getLeagueID();
    posicaoChave = getChaveLeague();
    esquemaTatico = globalMyEsquemaTatico;
    money = globalMyMoney;
    jogadores = globalMyJogadores;
    internationalLeagueName = InternationalLeagueManipulation().funcGetInternationalLeagueName(indexLeague: leagueID);
    playingInternational = getPlayingInternational();
    scoreGame = globalCoachPoints;
  }

  getMyInternationalLeague(){
    League league = League(index: leagueID);
    if(playingInternational.isNotEmpty){
      return playingInternational;
    }
    return league.internationalLeagueName;
  }

  String getLeagueName(){
    //SEARCH IN ALL LEAGUES
    for (var nameLeague in leagueNames) {
      if (clubNameMap.keys.contains(nameLeague)) {
        Map map = clubNameMap[nameLeague];
        if (map.containsValue(clubName)) {
          return nameLeague;
        }
      }
    }
    return clubName;
  }
  int getLeagueID() {
    //SEARCH IN ALL LEAGUES
    late int index = leaguesIndexFromName[getLeagueName()];
    return index;
  }

  int getChaveLeague(){
    //Search name by index;
    Map mapLeague = clubNameMap[campeonatoName];
    int position016 = -1;
    mapLeague.forEach((key, value) {
        if (value == clubName) {
          position016 = key;
        }
    });
    return position016;
  }

  int getLastYearExpectativa(){
    return globalMyExpectativa;
  }
  int newExpectativa(){
    int expect = 0;
    List clubsMyLeague = League(index: leagueID).allClubsName;
    late Club club;
    List ovr = [];
    for (var nameClub in clubsMyLeague) {
      int clubIndex = clubsAllNameList.indexOf(nameClub);
      club = Club(index: clubIndex);
      ovr.add(club.getOverall());
    }
    // ordena decrescentemente o ovr dos times da liga
    ovr.sort((b, a) => a.compareTo(b));
    // Ex: eu 73 [80 78 74 73 72 71] -> meu time expectiva = 5 -> 73 > 72+1
    Club myClub = Club(index: clubID);
    for(int i=0; i< ovr.length;i++) {
      if (myClub.getOverall() > ovr[i] + 0.4 && expect == 0) {
        expect = i;//[0] -> 1ºlugar, [1]-> 2ºlugar
        return expect;
      }
    }
    //Se tem time pior
    expect = ovr.length;
    return expect;
  }
  String getPlayingInternational(){
    return getPlayingInternationalName(clubID, internationalLeagueName);
  }
  int getMyClubInternationalPosition032(){
    int position = InternationalLeague().searchClub(internationalLeagueName, clubID);
    return position;
  }
  int getMyClubInternationalGroup(){
    int position032 = getMyClubInternationalPosition032();
    position032 =  position032 - (position032 % 4); // 29->28 ; 7->4
    return (position032/4).round(); //28/4 = grupo 7
  }
  int getMyClubInternationalGroupPosition(){
    late int position = getMyClubInternationalPosition032() % 4;
    return position;
  }
  /////////////////////////////////////////////////////////////
  //
  /////////////////////////////////////////////////////////////
  getClubValue(){
    double clubValue = 0.0;
    List jogadores = Club(index: clubID).jogadores;
    for (int index in jogadores){
      clubValue += Jogador(index: index).price;
    }
    return clubValue;
  }

}