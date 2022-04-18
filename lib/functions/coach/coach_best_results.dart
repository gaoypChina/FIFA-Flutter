import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/try_catch.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/page_controller/calendar_control.dart';

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
  updateSequence(){
    My my = My();
    ResultGameNacional result = ResultGameNacional(rodadaLocal: rodada-1, clubID: my.clubID);
    updateMaxVictory(result);
    updateMaxLoss(result);
    updateMaxSequenceVictory(result);
    updateMaxSequenceNoLosses(result);
    updateVariables();
  }

  updateMaxVictory(ResultGameNacional result){
    int maxGolMarcado = int.parse(globalHistoricCoachResults['maxVictory'].toString().substring(0,1));
    int maxGolSofrido = int.parse(globalHistoricCoachResults['maxVictory'].toString().substring(2));
    int meuMaxPlacar =  maxGolMarcado - maxGolSofrido;
    if(result.gol1 - result.gol2 > meuMaxPlacar
        || (result.gol1 - result.gol2 == meuMaxPlacar && result.gol1 > maxGolMarcado)){
      My my = My();
      globalHistoricCoachResults['maxVictory'] = '${result.gol1}x${result.gol2}';
      globalHistoricCoachResults['maxVictoryClubID'] = my.clubID;
      globalHistoricCoachResults['maxVictoryClubAdvID'] = Club(index: result.clubID2).index;
    }
  }
  updateMaxLoss(ResultGameNacional result){
    int maxGolMarcado = int.parse(globalHistoricCoachResults['maxLoss'].toString().substring(0,1));
    int maxGolSofrido = int.parse(globalHistoricCoachResults['maxLoss'].toString().substring(2));
    int meuMaxPlacar =  maxGolSofrido - maxGolMarcado;
    if(result.gol2 - result.gol1 > meuMaxPlacar
        || (result.gol2 - result.gol1 == meuMaxPlacar && result.gol2 > maxGolSofrido)){
      My my = My();
      globalHistoricCoachResults['maxLoss'] = '${result.gol1}x${result.gol2}';
      globalHistoricCoachResults['maxLossClubID'] = my.clubID;
      globalHistoricCoachResults['maxLossClubAdvID'] = Club(index: result.clubID2).index;
    }
  }
  updateMaxSequenceVictory(ResultGameNacional result){
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

  updateMaxSequenceNoLosses(ResultGameNacional result){
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