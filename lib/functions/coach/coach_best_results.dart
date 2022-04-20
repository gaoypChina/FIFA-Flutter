import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/try_catch.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/my_match_result.dart';
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
  updateSequence(MyLastMatchResult myLastMatchResult){

    updateMaxVictory(myLastMatchResult);
    updateMaxLoss(myLastMatchResult);
    updateMaxSequenceVictory(myLastMatchResult);
    updateMaxSequenceNoLosses(myLastMatchResult);
    updateVariables();
  }

  updateMaxVictory(MyLastMatchResult result){
    int maxGolMarcado = int.parse(globalHistoricCoachResults['maxVictory'].toString().substring(0,1));
    int maxGolSofrido = int.parse(globalHistoricCoachResults['maxVictory'].toString().substring(2));
    int meuMaxPlacar =  maxGolMarcado - maxGolSofrido;
    if(result.goalMy - result.goalAdv > meuMaxPlacar
        || (result.goalMy - result.goalAdv == meuMaxPlacar && result.goalMy > maxGolMarcado)){
      My my = My();
      globalHistoricCoachResults['maxVictory'] = '${result.goalMy}x${result.goalAdv}';
      globalHistoricCoachResults['maxVictoryClubID'] = my.clubID;
      globalHistoricCoachResults['maxVictoryClubAdvID'] = Club(index: result.clubIDadv).index;
    }
  }
  updateMaxLoss(MyLastMatchResult result){
    int maxGolMarcado = int.parse(globalHistoricCoachResults['maxLoss'].toString().substring(0,1));
    int maxGolSofrido = int.parse(globalHistoricCoachResults['maxLoss'].toString().substring(2));
    int meuMaxPlacar =  maxGolSofrido - maxGolMarcado;
    if(result.goalAdv - result.goalMy > meuMaxPlacar
        || (result.goalAdv - result.goalMy == meuMaxPlacar && result.goalAdv > maxGolSofrido)){
      My my = My();
      globalHistoricCoachResults['maxLoss'] = '${result.goalMy}x${result.goalAdv}';
      globalHistoricCoachResults['maxLossClubID'] = my.clubID;
      globalHistoricCoachResults['maxLossClubAdvID'] = Club(index: result.clubIDadv).index;
    }
  }
  updateMaxSequenceVictory(MyLastMatchResult result){
    if(result.victoryDrawLoss310 == 3){
      globalHistoricCoachResults['actualSequenceVictory']++;
      updateVariables();
      if(actualSequenceVictory>maxSequenceVictory){
        My my = My();
        globalHistoricCoachResults['maxSequenceVictory']++;
        globalHistoricCoachResults['maxSequenceVictoryClubID'] = my.clubID;
      }
    }else{
      globalHistoricCoachResults['actualSequenceVictory'] = 0;
    }
  }

  updateMaxSequenceNoLosses(MyLastMatchResult result){
    if(result.victoryDrawLoss310 >= 1){
      globalHistoricCoachResults['actualSequenceNoLosses']++;
      updateVariables();
      if(actualSequenceNoLosses>maxSequenceNoLosses) {
        My my = My();
        globalHistoricCoachResults['maxSequenceNoLosses']++;
        globalHistoricCoachResults['maxSequenceNoLossesClubID'] = my.clubID;
      }
    }else{
      globalHistoricCoachResults['actualSequenceNoLosses'] = 0;
    }
  }



}