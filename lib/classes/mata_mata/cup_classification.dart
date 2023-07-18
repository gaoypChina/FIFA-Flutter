import 'dart:math';

import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/dict_keys/player_stats_keys.dart';
import 'package:fifa/classes/mata_mata/knockout_stage.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_divisions.dart';
import 'package:fifa/values/league_names.dart';

class CupClassification extends KnockoutStage{

  String keyClassificados = "Classificados";
  String keyPrePhase = "Pre-fase";

  @override
  Map<String, Map<String, dynamic>>  globalVariable = globalCup;
  @override
  Map<String,List<int>> mapDates = {
    KnockoutStage().keyFinal: [semanasJogosCopas[12], semanasJogosCopas[13]],
    KnockoutStage().keySemifinal:[semanasJogosCopas[10], semanasJogosCopas[11]],
    KnockoutStage().keyQuartas: [semanasJogosCopas[8], semanasJogosCopas[9]],
    KnockoutStage().keyOitavas: [semanasJogosCopas[6], semanasJogosCopas[7]],
    KnockoutStage().key32round: [semanasJogosCopas[4], semanasJogosCopas[5]],
    KnockoutStage().key64round: [semanasJogosCopas[2], semanasJogosCopas[3]],
    KnockoutStage().key128round: [semanasJogosCopas[0], semanasJogosCopas[1]],
  };


  setClubs(){
    globalCup = {};
    for (String leagueName in getAvailableLeaguesNames()){
      Map<String, dynamic> mapa = definePrePhaseTeams(getDivisionClassification(leagueName), leagueName);
      globalCup = {...globalCup, ...mapa};
    }
  }

  getDivisionClassification(String leagueName){
    List<String> divisionLeagueNames = Divisions().leagueDivisionsStructure(leagueName);
    //MAPA COM O HISTÓRICO DE CLASSIFICAÇÃO DE CADA DIVISÃO
    List listAllClubsClassificationsInLeague = [];
    for( String division in divisionLeagueNames){
      int leagueID = leaguesIndexFromName[division];
      List classificationClubsIndexes = Classification(leagueIndex: leagueID).classificationClubsIndexes;
      listAllClubsClassificationsInLeague.add(classificationClubsIndexes);
    }
    //ARRAY TO LIST
    listAllClubsClassificationsInLeague =  listAllClubsClassificationsInLeague.expand((list) => list).toList();

    return listAllClubsClassificationsInLeague;
  }

  List _selectRange(List allTeamsLeague, List classified, int nInf, int nSup){
    if(allTeamsLeague.length > nInf && allTeamsLeague.length <= nSup){
      //EX LIGA 36 TIMES: 28 classificados, 8 jogam a pre fase. No final ficam 32.
      int diff = (allTeamsLeague.length - nInf)*2;
      classified = allTeamsLeague.sublist(0, allTeamsLeague.length - diff).toList();
    }
    return classified;
  }

  Confronto getConfronto(String competitionName, String phaseKeyName, String idaOrVoltaKey, int matchNumber){

    Map results = getPhaseMatchData(competitionName, phaseKeyName, idaOrVoltaKey, matchNumber);

    Confronto confronto = getConfrontoFromMapMatch(results);

    if(results.containsKey(ResultDict().keyGol1)){
      confronto.setGoals(goal1: results[ResultDict().keyGol1], goal2: results[ResultDict().keyGol2]);
    }
    if(results.containsKey(ResultDict().keyPenalty1)){
      confronto.setPenalties(penaltis1: results[ResultDict().keyPenalty1], penaltis2: results[ResultDict().keyPenalty2]);
    }

    return confronto;
  }

  Map<String, dynamic> definePrePhaseTeams(List allTeamsLeague, String leagueName){
    List classified = [];
    List prePhase = [];
    String keyPhase = "";
    allTeamsLeague.shuffle();

    classified = _selectRange(allTeamsLeague, classified, 4, 8);
    classified = _selectRange(allTeamsLeague, classified, 8, 16);
    classified = _selectRange(allTeamsLeague, classified, 16, 32);
    classified = _selectRange(allTeamsLeague, classified, 32, 64);
    classified = _selectRange(allTeamsLeague, classified, 64, 128);
    classified = _selectRange(allTeamsLeague, classified, 128, 256);

    prePhase = allTeamsLeague.where((team) => !classified.contains(team)).toList();

    if(allTeamsLeague.length==4){ keyPhase = KnockoutStage().keySemifinal;}
    else if(allTeamsLeague.length>4 && allTeamsLeague.length<=8){ keyPhase = KnockoutStage().keyQuartas;}
    else if(allTeamsLeague.length>8 && allTeamsLeague.length<=16){ keyPhase = KnockoutStage().keyOitavas;}
    else if(allTeamsLeague.length>16 && allTeamsLeague.length<=32){ keyPhase = KnockoutStage().key32round;}
    else if(allTeamsLeague.length>32 && allTeamsLeague.length<=64){ keyPhase = KnockoutStage().key64round;}
    else if(allTeamsLeague.length>64 && allTeamsLeague.length<=128){ keyPhase = KnockoutStage().key128round;}

    //Shuffle Clubs;
    classified.shuffle();
    prePhase.shuffle();
    //TO String

    List<String> prePhaseNames = [];
    for (int clubID in prePhase) {
      prePhaseNames.add(clubsAllNameList[clubID]);
    }
    List classifiedNames = [];
    for (int clubID in classified) {
      classifiedNames.add(clubsAllNameList[clubID]);
    }

    Map idaVoltaInitialMap = KnockoutStage().saveIdaVoltaTeamNames(prePhaseNames);

    Map<String, dynamic> mapa = {};
    mapa = {
      getCup(leagueName): {
                keyClassificados: classifiedNames,
                keyPrePhase: prePhaseNames,
                keyPhase: idaVoltaInitialMap,
    },
    };
    globalCupPlayers = {
      PlayerStatsKeys().keyPlayerMatchs: List.filled(globalMaxPlayersPermitted, 0),
      PlayerStatsKeys().keyPlayerGoals: List.filled(globalMaxPlayersPermitted, 0),
      PlayerStatsKeys().keyPlayerAssists: List.filled(globalMaxPlayersPermitted, 0),
      PlayerStatsKeys().keyPlayerCleanSheets: List.filled(globalMaxPlayersPermitted, 0),
      PlayerStatsKeys().keyPlayerGolsSofridos: List.filled(globalMaxPlayersPermitted, 0),
    };
    return mapa;
  }


  List<Club> getListClubsClassificados(String cupName){
    Map<String, dynamic>? cupData = globalCup[cupName];
    List clubsNames = cupData![keyClassificados];
    List<Club> clubs = [];
    for (String clubName in clubsNames) {
      clubs.add(Club(index: clubsAllNameList.indexOf(clubName)));
    }
    return clubs;
  }

  //////////////////////////////////////////////////////////////////////////////
  @override
  Map getPhaseResults(String competitionName, String phaseKeyName, String idaOrVoltaKey){
    return globalCup[competitionName]![phaseKeyName][idaOrVoltaKey];
  }

  @override
  Map getPhaseMatchData(String competitionName, String phaseKeyName, String idaOrVoltaKey, int matchNumber){
    return globalCup[competitionName]![phaseKeyName][idaOrVoltaKey][matchNumber];
  }



  List<String> getAllCupNames(){
    List leagueNames = getAvailableLeaguesNames();
    List<String> cupNames = [];
    //get all cup names from leagues
    for (String element in leagueNames) {
      cupNames.add(getCup(element));
    }
    //remove duplicates
    cupNames = cupNames.toSet().toList();

    return cupNames;
  }


  void nextPhaseClassified(){

      List cupNames = getAllCupNames();
      for (int i = 0; i < cupNames.length; i++) {
        String competitionName = cupNames[i];

        List<String> classifiedClubs = [];
        //IF IS THE FIRST STAGE ADD THE ALREADY QUALIFIED CLUBS
        String phaseName = getPhaseKeyName(semana);
        if(phaseName == getFirstPhaseStageName(competitionName)){
          if(globalVariable[competitionName]!.containsKey(keyClassificados)){
            classifiedClubs = classifiedClubs + globalVariable[competitionName]![keyClassificados].cast<String>();
          }
        }

        nextPhaseClassifiedCompetition(competitionName, classifiedClubs);

      }

  }
  nextPhaseClassifiedCompetition(String competitionName, List<String> classifiedClubs){

    String winnerName = "";
    Map matchMapCurrentPhase = {};
    //IF PHASE INSIDE LEAGUE EXISTS
    try {

      String phaseName = getPhaseKeyName(semana);

      String nextPhaseName = getNextPhaseName(phaseName);

      String idaOrVoltaKey = getIdaOrVoltaKey(phaseName, semana);

      if(idaOrVoltaKey == ResultDict().keyVolta){

        matchMapCurrentPhase = getPhaseResults(competitionName, phaseName, idaOrVoltaKey);

        //Save classified teams
        for (int nMatch = 1; nMatch <= matchMapCurrentPhase.length; nMatch++) {

          Map matchMapIda = getPhaseMatchData(competitionName, phaseName, ResultDict().keyIda, nMatch);
          Map matchMapVolta = getPhaseMatchData(competitionName, phaseName, ResultDict().keyVolta, nMatch);

          String team1 = matchMapIda[ResultDict().keyTeamName1];
          String team2 = matchMapIda[ResultDict().keyTeamName2];

          int goal1 = matchMapIda[ResultDict().keyGol1] + matchMapVolta[ResultDict().keyGol2];
          int goal2 = matchMapIda[ResultDict().keyGol2] + matchMapVolta[ResultDict().keyGol1];

          if(goal1 > goal2){
            winnerName = team1;
          }
          else if(goal1 < goal2){
            winnerName = team2;
            //PENALTY
          }else if(goal1 == goal2){
            int penalty1 = Random().nextInt(5);
            int penalty2 = Random().nextInt(5);
            while(penalty1 == penalty2){
              penalty2 = Random().nextInt(5);
            }
            if(penalty1 > penalty2){
              winnerName = team1;
            }else{
              winnerName = team2;
            }
            //SAVE PENALTY - penaly order inverted, because é salvo no map da volta
            saveClassifiedAfterPenalties(competitionName, phaseName, nMatch, ResultDict().savePenaltis(matchMapVolta, penalty1, penalty2));
          }

          classifiedClubs.add(winnerName);
        }

        if(phaseName == KnockoutStage().keyFinal){
          saveChampionName(competitionName, classifiedClubs.first);
        }else{
          //SAVE CLASSIFIED CLUBS TO NEW PHASE
          Map nextPhaseInitialMap = CupClassification().saveIdaVoltaTeamNames(classifiedClubs);

          saveNextPhaseInitialMap(competitionName, nextPhaseName, nextPhaseInitialMap);
        }


      }

    }catch(e){
      //Competition don't have this phase
    }
  }


  @override
  void saveClassifiedAfterPenalties(String competitionName, String phaseName, int nMatch, Map matchMap){
    globalCup[competitionName]![phaseName][ResultDict().keyVolta][nMatch] = matchMap;
  }

  @override
  void saveChampionName(String competitionName, String clubChampion){
    globalCup[competitionName]![KnockoutStage().keyChampion] = clubChampion;
  }

  @override
  void saveNextPhaseInitialMap(String competitionName, String nextPhaseName, Map nextPhaseInitialMap){
    globalCup[competitionName]![nextPhaseName] = nextPhaseInitialMap;
  }

  String getFirstPhaseStageName(String cupName){
    List phasesNames = KnockoutStage().listPhases();
    late String firstPhaseName;
    for (String phaseName in phasesNames) {
        if(globalCup[cupName]!.containsKey(phaseName)){
          firstPhaseName = phaseName;
          break;
        }
    }
    return firstPhaseName;
  }

}


