import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/global/global_variables.dart';
import 'package:fifa/global/globalfunctions.dart';
import 'package:fifa/global/images.dart';

class My{

  String clubName = '';
  late String picture;
  late int clubID;
  late int campeonatoID;
  int posicaoChave = 1;
  int scoreGame = 15;
  late double money;
  late String esquemaTatico;
  late int expectativa;
  late List jogadores;
  late String playingInternational;

  My(){
    clubName = globalMyClubName;
    clubID = getClubID();
    campeonatoID = globalMyLeagueID;
    posicaoChave = globalMyPosicaoChave;
    picture = FIFAImages().imageLogo(clubName);
    esquemaTatico = globalMyEsquemaTatico;
    money = globalMyMoney;
    expectativa = getExpectativa();
    jogadores = globalMyJogadores;
    playingInternational = getPlayingInternational();
  }

  int getClubID(){
    //ou pode ser também globalMyClubID
    return clubsName.indexOf(clubName);
  }
  int getExpectativa(){
    int expect = 0;
    List clubsMyLeague = League(index: campeonatoID).allClubsName;
    List ovr = [];
    for (var element in clubsMyLeague) {
      int clubIndex = GlobalFunctions().getClubIndexFromName(element);
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
    if(globalInternational32ClubsID[0].contains(clubID)){val = 'Champions';}
    if(globalInternational32ClubsID[1].contains(clubID)){val = 'Libertadores';}
    return val;
  }
  int getMyClubInternationalPosition032(){
    late int position;
    if(globalInternational32ClubsID[0].contains(clubID)){position = globalInternational32ClubsID.indexOf(clubID);}
    if(globalInternational32ClubsID[1].contains(clubID)){position = globalInternational32ClubsID.indexOf(clubID);}
    return position;
  }
  int getMyClubInternationalGroup(){
    late int group = getMyClubInternationalPosition032() % 8;
    return group;
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