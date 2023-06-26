import 'package:fifa/classes/chaves.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/result_game/result_match.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/background_color/background_score.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:flutter/material.dart';

class ResultGameNacional extends ResultMatch{

  ResultGameNacional({required int rodadaLocal, required club}){

    this.club = club;
    competitionName = club.leagueName;
    weekLocal = semanasJogosNacionais[rodadaLocal-1];
    List list = Chaves().chaveIndexAdvCampeonato(weekLocal,club.leagueID, club.getChaveLeague());//index 0-16
    int chaveClub2 = list[0];
    visitante = list[1];
    League league = League(index: club.leagueID);
    clubName1 = club.name;
    clubID = club.index;
    clubName2 = league.getClubName(chaveClub2);
    clubID2 = clubsAllNameList.indexOf(clubName2);

    if(weekLocal < semana){
      backgroundColor = Colors.black87;
    }

    //SÓ MOSTRA PARA RODADAS QUE JÁ ACONTECERAM
    if((weekLocal<semana && weekLocal <= semanasJogosNacionais[league.nClubs-2])){
      //rodadaLocal começa em 1 por isso subtrai 1

      int chaveClub1 = Chaves().chaveIndexAdvCampeonato(weekLocal, club.leagueID, chaveClub2)[0];
      try {
        List results = globalHistoricLeagueGoalsAll[rodadaLocal][club.leagueID];
        goal1 = results[chaveClub1];
        goal2 = results[chaveClub2];
        placar = goal1.toString() + ' x '+ goal2.toString();
        if(placar.isEmpty){
          backgroundColor = Colors.black12;
          victoryDrawLoss310 = -1;
        }else{
          backgroundColor = colorResultBackground(goal1,goal2);
          victoryDrawLoss310 = getVictoryDrawLoss310(goal1, goal2);
        }
        isAlreadyPlayed = true;
      }catch(e){
        isAlreadyPlayed = false;
        //print("Rodada $rodadaLocal não foi simulada");
      }


    }else{
      isAlreadyPlayed = false;
    }

    if(league.nClubs<=rodadaLocal){
      hasAdversary = false;
    }


  }


  }
