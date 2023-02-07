import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/semana.dart';
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
  late String clubName2;
  late int clubID2;
  int gol1 = 0;
  int gol2 = 0;
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

    clubID = club.index;
    //FASE DE GRUPOS
    //Check every group if myTeam Is Playing
    if(Semana(weekLocal).isJogoGruposInternacional){
      int rodadaNumber = semanasGruposInternacionais.indexOf(weekLocal);
      for(int groupNumber=0; groupNumber<8; groupNumber++){
        for(int nConfronto=0; nConfronto<2; nConfronto++) {

          MatchResultInternational matchResultInternational = MatchResultInternational(
              rodadaNumber: rodadaNumber,
              groupNumber: groupNumber,
              nConfronto: nConfronto,
              competitionName: competitionName);

          isAlreadyPlayed = matchResultInternational.isAlreadyPlayed;
          //SE SOU O TIME 1
          if(matchResultInternational.clubID1 == clubID){
            ifMyTeamIsLocal(matchResultInternational);
          }
          //SE SOU O TIME 2
          if(matchResultInternational.clubID2 == clubID){
            ifMyTeamIsVisitor(matchResultInternational);
          }
        }
      }
    }

    //RESULTADO MATA-MATAS
    else if(Semana(weekLocal).isJogoMataMataInternacional){
      int idaVolta = 1;
      if(Semana(weekLocal).isJogoIdaMataMata){
        idaVolta = 0;
      }
      for(int matchRow=0; matchRow<8; matchRow++){
        try{
          MataMata mataMata = MataMata();
          mataMata.getData(competitionName, Semana(weekLocal).semanaStr, matchRow, idaVolta);
          isAlreadyPlayed = mataMata.isAlreadyPlayed;
          if(mataMata.clubID1 == clubID){
            visitante = false;
            clubID2 = mataMata.clubID2;
            clubName2 = Club(index: clubID2).name;
            if(isAlreadyPlayed){
              gol1 = mataMata.goal1;
              gol2 = mataMata.goal2;
            }
            hasAdversary = true;
          }
          if(mataMata.clubID2 == clubID){
            visitante = true;
            clubID2 = mataMata.clubID1;
            clubName2 = Club(index: clubID2).name;
            if(isAlreadyPlayed){
              gol1 = mataMata.goal2;
              gol2 = mataMata.goal1;
            }
            hasAdversary = true;
          }

          if(isAlreadyPlayed){
            placar = gol1.toString() + ' x '+ gol2.toString();
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
      if(placar.isEmpty){
        backgroundColor = Colors.black87;
        victoryDrawLoss310 = -1;
      }else{
        backgroundColor = colorResultBackground(gol1,gol2);
        victoryDrawLoss310 = getVictoryDrawLoss310(gol1, gol2);
      }
    }

  }

  ifMyTeamIsLocal(MatchResultInternational matchResultInternational){
    visitante = false;
    clubID2 = matchResultInternational.clubID2;
    clubName2 = Club(index: clubID2).name;
    gol1 = matchResultInternational.goals1;
    gol2 = matchResultInternational.goals2;
    hasAdversary = true;
    if(isAlreadyPlayed){
      placar = gol1.toString() + ' x '+ gol2.toString();
    }else{
      placar = '';
    }
  }
  ifMyTeamIsVisitor(MatchResultInternational matchResultInternational){
    visitante = true;
    clubID2 = matchResultInternational.clubID1;
    clubName2 = Club(index: clubID2).name;
    gol1 = matchResultInternational.goals2;
    gol2 = matchResultInternational.goals1;
    hasAdversary = true;
    if(isAlreadyPlayed){
      placar = gol1.toString() + ' x '+ gol2.toString();
    }else{
      placar = '';
    }
  }


}