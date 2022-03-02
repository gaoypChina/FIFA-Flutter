import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/values/club_names.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';

import '../values/league_clubs.dart';

class My{

  String clubName = '';
  late String picture;
  late int clubID;
  late int campeonatoID;
  late String campeonatoName;
  int posicaoChave = 1;
  int scoreGame = 15;
  late double money;
  late String esquemaTatico;
  late List jogadores;
  late String playingInternational;
  late String internationalLeagueName;
  late int internationalLeagueIndex;

  My(){
    clubName = globalMyClubName;
    clubID = clubsAllNameList.indexOf(clubName);
    campeonatoName = getLeagueName();
    campeonatoID = getLeagueID();
    posicaoChave = globalMyPosicaoChave;
    picture = FIFAImages().imageLogo(clubName);
    esquemaTatico = globalMyEsquemaTatico;
    money = globalMyMoney;
    jogadores = globalMyJogadores;
    playingInternational = getPlayingInternational();
    League league = League(index: campeonatoID);
    internationalLeagueName = league.internationalLeagueName;
    internationalLeagueIndex = league.internationalLeagueIndex;
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
  int getExpectativa(){
    int expect = 0;
    List clubsMyLeague = League(index: campeonatoID).allClubsName;
    List ovr = [];
    for (var element in clubsMyLeague) {
      int clubIndex = clubsAllNameList.indexOf(element);
      ovr.add(Club(index: clubIndex).getOverall());
    }
    // ordena decrescentemente o ovr dos times da liga
    ovr.sort((b, a) => a.compareTo(b));
    // Ex: eu 73 [80 78 74 73 72 71] -> meu time expectiva = 5 -> 73 > 72+1
    for(int i=0; i< ovr.length;i++) {
      if (Club(index: clubID).getOverall() > ovr[i] - 1 && expect == 0) {
        expect = i+1;
      }
    }
    return expect;
  }
  String getPlayingInternational(){
    String val = '';
    if(globalInternational32ClubsID[0].contains(clubID)){val = LeagueOfficialNames().championsLeague;}
    if(globalInternational32ClubsID[1].contains(clubID)){val = LeagueOfficialNames().libertadores;}
    return val;
  }
  int getMyClubInternationalPosition032(){
    late int position;
    if(globalInternational32ClubsID[0].contains(clubID)){position = globalInternational32ClubsID[0].indexOf(clubID);}
    else if(globalInternational32ClubsID[1].contains(clubID)){position = globalInternational32ClubsID[1].indexOf(clubID);}

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