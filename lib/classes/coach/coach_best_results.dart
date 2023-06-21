import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/functions/try_catch.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';

class CoachBestResults{

  String maxVictory = '';
  late int maxVictoryClubID;
  late int maxVictoryClubAdvID;
  String maxLoss = '';
  late int maxLossClubID;
  late int maxLossClubAdvID;
  String maxVictoryTeamAgainst = '';
  String maxLossTeamAgainst = '';
  int maxSequenceNoLosses = 0;
  int actualSequenceNoLosses = 0;
  late int maxSequenceNoLossesClubID;
  int maxSequenceVictory = 0;
  int actualSequenceVictory = 0;
  late int maxSequenceVictoryClubID;

  CoachBestResults(){
    createField();
    updateVariables();
  }

  createField(){
    My my = My();
    tryCatchCreateMap(globalHistoricCoachResults, 'maxVictory','0x0');
    tryCatchCreateMap(globalHistoricCoachResults, 'maxVictoryClubID',my.clubID);
    tryCatchCreateMap(globalHistoricCoachResults, 'maxVictoryClubAdvID',my.clubID);
    tryCatchCreateMap(globalHistoricCoachResults, 'maxLoss','0x0');
    tryCatchCreateMap(globalHistoricCoachResults, 'maxLossClubID',my.clubID);
    tryCatchCreateMap(globalHistoricCoachResults, 'maxLossClubAdvID',my.clubID);
    tryCatchCreateMap(globalHistoricCoachResults, 'maxSequenceNoLosses',0);
    tryCatchCreateMap(globalHistoricCoachResults, 'actualSequenceNoLosses',0);
    tryCatchCreateMap(globalHistoricCoachResults, 'maxSequenceNoLossesClubID',my.clubID);
    tryCatchCreateMap(globalHistoricCoachResults, 'maxSequenceVictory',0);
    tryCatchCreateMap(globalHistoricCoachResults, 'actualSequenceVictory',0);
    tryCatchCreateMap(globalHistoricCoachResults, 'maxSequenceVictoryClubID',my.clubID);
  }
  updateVariables(){
    maxVictory = globalHistoricCoachResults['maxVictory'];
    maxVictoryClubID = globalHistoricCoachResults['maxVictoryClubID'];
    maxVictoryClubAdvID = globalHistoricCoachResults['maxVictoryClubAdvID'];
    maxLoss = globalHistoricCoachResults['maxLoss'];
    maxLossClubID = globalHistoricCoachResults['maxLossClubID'];
    maxLossClubAdvID = globalHistoricCoachResults['maxLossClubAdvID'];

    maxSequenceNoLosses = globalHistoricCoachResults['maxSequenceNoLosses'];
    actualSequenceNoLosses = globalHistoricCoachResults['actualSequenceNoLosses'];
    maxSequenceNoLossesClubID = globalHistoricCoachResults['maxSequenceNoLossesClubID'];

    maxSequenceVictory = globalHistoricCoachResults['maxSequenceVictory'];
    actualSequenceVictory = globalHistoricCoachResults['actualSequenceVictory'];
    maxSequenceVictoryClubID = globalHistoricCoachResults['maxSequenceVictoryClubID'];
  }

  ////////////////////////////////////////////////
  //ACTIONS
  updateSequence(Confronto myLastMatchResult){

    if(myLastMatchResult.clubName2 == My().clubName){
      myLastMatchResult.invertTeams();
    }
    updateMaxVictory(myLastMatchResult);
    updateMaxLoss(myLastMatchResult);
    updateMaxSequenceVictory(myLastMatchResult);
    updateMaxSequenceNoLosses(myLastMatchResult);
    updateVariables();
  }

  updateMaxVictory(Confronto confronto){
    int maxGolMarcado = int.parse(globalHistoricCoachResults['maxVictory'].toString().substring(0,1));
    int maxGolSofrido = int.parse(globalHistoricCoachResults['maxVictory'].toString().substring(2));
    int meuMaxPlacar =  maxGolMarcado - maxGolSofrido;
    if(confronto.goal1 - confronto.goal2 > meuMaxPlacar
        || (confronto.goal2 - confronto.goal1 > 0
              && confronto.goal1 - confronto.goal2 == meuMaxPlacar
              && confronto.goal1 > maxGolMarcado)
    ){
      saveCoachResultsVictory(confronto);
    }
  }
  updateMaxLoss(Confronto confronto){
    int maxGolMarcado = int.parse(globalHistoricCoachResults['maxLoss'].toString().substring(0,1));
    int maxGolSofrido = int.parse(globalHistoricCoachResults['maxLoss'].toString().substring(2));
    int meuMaxPlacar =  maxGolSofrido - maxGolMarcado;
    if(confronto.goal2 - confronto.goal1 > meuMaxPlacar
        || (confronto.goal2 - confronto.goal1 > 0
              && confronto.goal2 - confronto.goal1 == meuMaxPlacar
              && confronto.goal2 > maxGolSofrido)
    ){
      saveCoachResultsLoss(confronto);
    }
  }
  saveCoachResultsVictory(Confronto confronto){
    globalHistoricCoachResults['maxVictory'] = '${confronto.goal1}x${confronto.goal2}';
    globalHistoricCoachResults['maxVictoryClubID'] = confronto.clubID1;
    globalHistoricCoachResults['maxVictoryClubAdvID'] = confronto.clubID2;
  }
  saveCoachResultsLoss(Confronto confronto){
    globalHistoricCoachResults['maxLoss'] = '${confronto.goal1}x${confronto.goal2}';
    globalHistoricCoachResults['maxLossClubID'] = confronto.clubID1;
    globalHistoricCoachResults['maxLossClubAdvID'] = confronto.clubID2;
  }
  updateMaxSequenceVictory(Confronto confronto){
    if(confronto.result == confronto.victory){
      globalHistoricCoachResults['actualSequenceVictory']++;
      updateVariables();
      if(actualSequenceVictory > maxSequenceVictory){
        globalHistoricCoachResults['maxSequenceVictory']++;
        globalHistoricCoachResults['maxSequenceVictoryClubID'] = confronto.clubID1;
      }
    }else{
      globalHistoricCoachResults['actualSequenceVictory'] = 0;
    }
  }

  updateMaxSequenceNoLosses(Confronto confronto){
    if(confronto.result == confronto.victory || confronto.result == confronto.draw){
      globalHistoricCoachResults['actualSequenceNoLosses']++;
      updateVariables();
      if(actualSequenceNoLosses > maxSequenceNoLosses) {
        globalHistoricCoachResults['maxSequenceNoLosses']++;
        globalHistoricCoachResults['maxSequenceNoLossesClubID'] = confronto.clubID1;
      }
    }else{
      globalHistoricCoachResults['actualSequenceNoLosses'] = 0;
    }
  }



}