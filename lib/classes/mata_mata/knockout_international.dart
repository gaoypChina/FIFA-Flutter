import 'dart:math';

import 'package:fifa/classes/mata_mata/knockout_stage.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

class KnockoutInternational extends KnockoutStage{

  @override
  Map  globalVariable = globalInternationalMataMata;

  @override
  Map<String,List<int>> mapDates = {
    KnockoutStage().keyFinal: [semanasMataMataInternacionais[6]],
    KnockoutStage().keySemifinal:[semanasMataMataInternacionais[4], semanasMataMataInternacionais[5]],
    KnockoutStage().keyQuartas: [semanasMataMataInternacionais[2], semanasMataMataInternacionais[3]],
    KnockoutStage().keyOitavas: [semanasMataMataInternacionais[0], semanasMataMataInternacionais[1]],
  };

  void nextPhaseClassified(){

    for (int i = 0; i < internationalLeagueNames.length; i++) {
      String competitionName = internationalLeagueNames[i];

      List<String> classifiedClubs = [];

      nextPhaseClassifiedCompetition(competitionName, classifiedClubs);
    }
  }
  List setPenalties(String team1, String team2){
    late String winnerName;
    int penalty1 = Random().nextInt(5);
    int penalty2 = Random().nextInt(5);
    while(penalty1==penalty2){
      penalty2 = Random().nextInt(5);
    }
    if(penalty1 > penalty2){
      winnerName = team1;
    }else{
      winnerName = team2;
    }
    return [winnerName, penalty1, penalty2];
  }

  void nextPhaseClassifiedCompetition(String competitionName, List<String> classifiedClubs){

    String winnerName = "";
    Map matchMapCurrentPhase = {};
    //IF PHASE INSIDE LEAGUE EXISTS
    try {

      String phaseName = getPhaseKeyName(semana);

      String nextPhaseName = getNextPhaseName(phaseName);

      String idaOrVoltaKey = getIdaOrVoltaKey(phaseName, semana);

      matchMapCurrentPhase = getPhaseResults(competitionName, phaseName, idaOrVoltaKey);

      if(idaOrVoltaKey == ResultDict().keyVolta){

        //Save classified teams
        for (int nMatch = 1; nMatch <= matchMapCurrentPhase.length; nMatch++) {

          Map matchMapIda = getPhaseMatchData(competitionName, phaseName, ResultDict().keyIda, nMatch);
          Map matchMapVolta = getPhaseMatchData(competitionName, phaseName, ResultDict().keyVolta, nMatch);

          String team1 = matchMapIda[ResultDict().keyTeamName1];
          String team2 = matchMapIda[ResultDict().keyTeamName2];

          int goal1 = matchMapIda[ResultDict().keyGol1] + matchMapVolta[ResultDict().keyGol2];
          int goal2 = matchMapIda[ResultDict().keyGol2] + matchMapVolta[ResultDict().keyGol1];

          if(goal1>goal2){
            winnerName = team1;
          }
          else if(goal1<goal2){
            winnerName = team2;
            //PENALTY
          }else if(goal1==goal2){

            List resultPenalties = setPenalties(team1, team2);
            winnerName = resultPenalties[0];
            int penalty1 = resultPenalties[1];
            int penalty2 = resultPenalties[2];
            //SAVE PENALTY - penaly order inverted, because é salvo no map da volta
            saveClassifiedAfterPenalties(competitionName, phaseName, nMatch, ResultDict().savePenaltis(matchMapVolta, penalty2, penalty1));

          }

          classifiedClubs.add(winnerName);
        }

          //SAVE CLASSIFIED CLUBS TO NEW PHASE
          Map nextPhaseInitialMap = KnockoutStage().saveIdaVoltaTeamNames(classifiedClubs);

          saveNextPhaseInitialMap(competitionName, nextPhaseName, nextPhaseInitialMap);
      }else{
        // In the final there is only 1 match
        if(phaseName == KnockoutStage().keyFinal) {
          Confronto confronto = getConfronto(competitionName, phaseName, idaOrVoltaKey, 1);
          // SE A FINAL FOR PARA OS PENALTIS
          if(confronto.goal1==confronto.goal2){
            Map matchMapIda = getPhaseMatchData(competitionName, phaseName, ResultDict().keyIda, 1);
            List resultPenalties = setPenalties(confronto.clubName1, confronto.clubName2);
            winnerName = resultPenalties[0];
            int penalty1 = resultPenalties[1];
            int penalty2 = resultPenalties[2];
            //SAVE PENALTY
            saveClassifiedAfterPenalties(competitionName, phaseName, 1, ResultDict().savePenaltis(matchMapIda, penalty1, penalty2));

            confronto = getConfronto(competitionName, phaseName, idaOrVoltaKey, 1);
          }
          //SAVE CHAMPION NAME
          saveChampionName(competitionName, confronto.winnerName);
        }
      }



    }catch(e){
      //Competition don't have this phase
    }
  }

  //////////////////////////////////////////////////////////////////////////////
  @override
  Map getPhaseResults(String competitionName, String phaseKeyName, String idaOrVoltaKey){
    return globalInternationalMataMata[competitionName]![phaseKeyName][idaOrVoltaKey];
  }

  @override
  Map getPhaseMatchData(String competitionName, String phaseKeyName, String idaOrVoltaKey, int matchNumber){
    return globalInternationalMataMata[competitionName]![phaseKeyName][idaOrVoltaKey][matchNumber];
  }


  Confronto getConfronto(String competitionName, String phaseKeyName, String idaOrVoltaKey, int matchNumber){

    Map results = getPhaseMatchData(competitionName, phaseKeyName, idaOrVoltaKey, matchNumber);

    Confronto confronto = getConfrontoFromMapMatch(results);

    return confronto;
  }

  //////////////////////////////////////////////////////////////////////////////
  @override
  void saveClassifiedAfterPenalties(String competitionName, String phaseName, int nMatch, Map matchMap){
    globalInternationalMataMata[competitionName]![phaseName][ResultDict().keyVolta][nMatch] = matchMap;
  }

  @override
  void saveChampionName(String competitionName, String clubChampion){
    globalInternationalMataMata[competitionName]![KnockoutStage().keyChampion] = clubChampion;
  }

  @override
  void saveNextPhaseInitialMap(String competitionName, String nextPhaseName, Map nextPhaseInitialMap){
    globalInternationalMataMata[competitionName]![nextPhaseName] = nextPhaseInitialMap;
  }
}