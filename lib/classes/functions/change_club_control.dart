import 'dart:math';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/cup_classification.dart';
import 'package:fifa/classes/functions/dificuldade.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/values/clubs_all_names_list.dart';

import '../../global_variables.dart';
import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/functions/func_number_clubs_total.dart';

funcChangeClub(String newClubName, int newLeagueID){

  int clubID = clubsAllNameList.indexOf(newClubName);
  globalMyClubID = clubID;
  Club newClubClass = Club(index: clubID);
  globalMyJogadores = newClubClass.escalacao; //global MyJogadores tem que ser declarado antes de usar qualquer getOverall();
  double overall = newClubClass.getOverall();
  globalMyMoney = funcCalculateMoney(overall: overall);
  if(globalInitialMoney>0){
    globalMyMoney = globalInitialMoney;
  }
  My myClass = My();
  globalMyExpectativa = myClass.newExpectativa();
  //Zera retrospecto de jogos
  globalHistoricCoachResults['actualSequenceVictory'] = 0;
  globalHistoricCoachResults['actualSequenceNoLosses'] = 0;

  //TIMES DAS COPAS
  CupClassification().setClubs();

}

funcCalculateMoney({required double overall}){
  return ((overall-68)*(overall-68)/5)*0.7*DificuldadeClass().getDificuldadeMultiplicationValue();
}

class OptionsClubs{

  List<Club> teams = [];
  Club myClub = Club(index: My().clubID);

  OptionsClubs(){
    for(int i=0; i<6 ;i++){
      teams.add(chooseClub());
    }
  }

  Club chooseClub(){
    //Checa se o clube tem alguma liga
    int clubID = -1;
    Club club = Club(index: 1);
    bool clubHasLeague = false;
    while(!clubHasLeague){
      try{
        clubID = Random().nextInt(funcNumberClubsTotal());
        club = Club(index: clubID);
        club.getChaveLeague();
        if(!teams.any((element) => element.index == clubID)
            && club.getOverall()<myClub.getOverall()+3
             && club.getOverall()>myClub.getOverall()-4){
          clubHasLeague = true;
        }
      }catch(e){
        clubHasLeague = false;
      }
    }
    return club;
  }

}

class ClubClassification{
  late int clubID;
  late String clubName;
  late int posicaoTabela;
  late int chaveClub;
  late int leagueID;

  ClubClassification({required Club club}){
    chaveClub = club.getChaveLeague();
    leagueID = club.leagueID;
    posicaoTabela = Classification(leagueIndex: leagueID).getClubPosition(club.index);
    clubName = club.name;
  }
}