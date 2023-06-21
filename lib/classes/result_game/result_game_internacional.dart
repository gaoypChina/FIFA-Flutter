import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/mata_mata/mata_mata_class.dart';
import 'package:fifa/classes/table_matchs_control.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/background_color/background_score.dart';
import 'package:fifa/theme/colors.dart';
import 'package:flutter/material.dart';

class ResultGameInternacional{

  late String competitionName;
  late int weekLocal;
  bool visitante = false;
  late int clubID;
  late Club club;
  late String clubName1;
  late String clubName2;
  late int clubID2;
  int goal1 = 0;
  int goal2 = 0;
  int victoryDrawLoss310 = 0;
  String placar = '';
  Color backgroundColor = AppColors().greyTransparent;
  bool hasAdversary = false;
  bool isAlreadyPlayed = false;

  printar(){
    print("WEEK: $weekLocal hasAdversary: $hasAdversary isAlreadyPlayed: $isAlreadyPlayed");
    if(hasAdversary) {
      print("TIME1: ${club.name} TIME2: $clubName2");
    }
  }

  ResultGameInternacional({required this.weekLocal, required this.club, required this.competitionName}){

    Semana weekClass = Semana(weekLocal);
    clubName1 = club.name;
    clubID = club.index;
    //FASE DE GRUPOS
    //Check every group if myTeam Is Playing
    if(weekClass.isJogoGruposInternacional){
      int rodadaNumber = semanasGruposInternacionais.indexOf(weekLocal);
      for(int groupNumber=0; groupNumber<8; groupNumber++){
        for(int nConfronto=0; nConfronto<2; nConfronto++) {

          MatchResultInternational matchResultInternational = MatchResultInternational(
              rodadaNumber: rodadaNumber,
              groupNumber: groupNumber,
              nConfronto: nConfronto,
              competitionName: competitionName
          );

          isAlreadyPlayed = matchResultInternational.confronto.hasGoals;
          //SE SOU O TIME 1
          if(matchResultInternational.confronto.clubID1 == clubID){
            ifMyTeamIsLocal(matchResultInternational);
          }
          //SE SOU O TIME 2
          if(matchResultInternational.confronto.clubID2 == clubID){
            ifMyTeamIsVisitor(matchResultInternational);
          }
        }
      }
    }

    //RESULTADO MATA-MATAS
    else if(weekClass.isJogoMataMataInternacional){
      int idaVolta = 1;
      if(weekClass.isJogoIdaMataMata){
        idaVolta = 0;
      }

      int nmatchs = 8;
      if(weekClass.isJogoOitavasInternacional){nmatchs = 8;}
      else if(weekClass.isJogoQuartasInternacional){nmatchs = 4;}
      else if(weekClass.isJogoSemifinalInternacional){nmatchs = 2;}
      else if(weekClass.isJogoFinalInternacional){nmatchs = 1;}

      for(int matchRow=0; matchRow<nmatchs; matchRow++){
        try{
          MataMata mataMata = MataMata();
          Confronto confronto = mataMata.getData(competitionName, weekClass.semanaStr, matchRow, idaVolta);
          isAlreadyPlayed = confronto.hasGoals;
          if(confronto.clubID1 == clubID){
            visitante = false;
            clubID2 = confronto.clubID2;
            clubName2 = Club(index: clubID2).name;
            if(isAlreadyPlayed){
              goal1 = confronto.goal1;
              goal2 = confronto.goal2;
            }
            hasAdversary = true;
          }
          if(confronto.clubID2 == clubID){
            visitante = true;
            clubID2 = confronto.clubID1;
            clubName2 = Club(index: clubID2).name;
            if(isAlreadyPlayed){
              goal1 = confronto.goal2;
              goal2 = confronto.goal1;
            }
            hasAdversary = true;
          }

          if(isAlreadyPlayed){
            placar = goal1.toString() + ' x '+ goal2.toString();
          }else{
            placar = '';
          }

        }catch(e){
          isAlreadyPlayed = false;
          //print('row nao existe');
        }
      }
    }

    if(weekLocal < semana){
      backgroundColor = Colors.black87;
    }

    if(isAlreadyPlayed) {
      if(placar.isEmpty || !hasAdversary){
        backgroundColor = Colors.black87;
        victoryDrawLoss310 = -1;
      }else{
        backgroundColor = colorResultBackground(goal1,goal2);
        victoryDrawLoss310 = getVictoryDrawLoss310(goal1, goal2);
      }
    }

  }

  ifMyTeamIsLocal(MatchResultInternational matchResultInternational){
    visitante = false;
    clubID2 = matchResultInternational.confronto.clubID2;
    clubName2 = Club(index: clubID2).name;
    hasAdversary = true;
    if(matchResultInternational.confronto.hasGoals){
      goal1 = matchResultInternational.confronto.goal1;
      goal2 = matchResultInternational.confronto.goal2;
      placar = goal1.toString() + ' x '+ goal2.toString();
    }else{
      placar = '';
    }
  }
  ifMyTeamIsVisitor(MatchResultInternational matchResultInternational){
    visitante = true;
    clubID2 = matchResultInternational.confronto.clubID1;
    clubName2 = Club(index: clubID2).name;

    if(matchResultInternational.confronto.hasGoals){
      goal1 = matchResultInternational.confronto.goal2;
      goal2 = matchResultInternational.confronto.goal1;
      placar = goal1.toString() + ' x '+ goal2.toString();
    }else{
      placar = '';
    }

  }


}