import 'dart:math';

import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_divisions.dart';
import 'package:fifa/values/league_names.dart';

class CupClassification{
  String keyClassificados = "Classificados";
  String keyPrePhase = "Pre-fase";

  String keyFinal = "Final";
  String keySemifinal = "Semifinal";
  String keyQuartas = "Quartas";
  String keyOitavas = "Oitavas";
  String key16round = "Fase 16";
  String key32round = "Fase 32";
  String key64round = "Fase 64";
  String key128round = "Fase 128";

  List<String> listPhases(){
    return [key128round, key64round, key32round, keyOitavas, keyQuartas, keySemifinal, keyFinal];
  }

  Map<String,List<int>> mapDates(){
    Map<String,List<int>> map = {
      keyFinal: [semanasJogosCopas[12], semanasJogosCopas[13]],
      keySemifinal:[semanasJogosCopas[10], semanasJogosCopas[11]],
      keyQuartas: [semanasJogosCopas[8], semanasJogosCopas[9]],
      keyOitavas: [semanasJogosCopas[6], semanasJogosCopas[7]],
      key32round: [semanasJogosCopas[4], semanasJogosCopas[5]],
      key64round: [semanasJogosCopas[2], semanasJogosCopas[3]],
      key128round: [semanasJogosCopas[0], semanasJogosCopas[1]],
    };
    return map;
  }

  String getIdaOrVoltaKey(String phaseName, int week){
    List<int> dates = mapDates()[phaseName]!;
    if(week == dates.first){
      return ResultDict().keyIda;
    }else{
      return ResultDict().keyVolta;
    }
  }

  String getPhaseKeyName(int week){
    Map<String,List<int>> mapDate = mapDates();
    final entry = mapDate.entries.firstWhere(
          (entry) => entry.value.contains(week)
    );
    return entry.key;
  }

  setClubs(){
    globalCup = {};
    for (String leagueName in getAvailableLeaguesNames()){
      Map<String, Map<String, dynamic>> mapa = definePrePhaseTeams(getDivisionClassification(leagueName), leagueName);
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
    if(allTeamsLeague.length>nInf && allTeamsLeague.length<=nSup){
      //EX LIGA 36 TIMES: 28 classificados, 8 jogam a pre fase. No final ficam 32.
      int diff = (allTeamsLeague.length - nInf)*2;
      classified = allTeamsLeague.sublist(0, allTeamsLeague.length - diff).toList();
    }
    return classified;
  }

  Map<String, Map<String, dynamic>> definePrePhaseTeams(List allTeamsLeague, String leagueName){
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

    if(allTeamsLeague.length==4){ keyPhase = keySemifinal;}
    else if(allTeamsLeague.length>4 && allTeamsLeague.length<=8){ keyPhase = keyQuartas;}
    else if(allTeamsLeague.length>8 && allTeamsLeague.length<=16){ keyPhase = keyOitavas;}
    else if(allTeamsLeague.length>16 && allTeamsLeague.length<=32){ keyPhase = key32round;}
    else if(allTeamsLeague.length>32 && allTeamsLeague.length<=64){ keyPhase = key64round;}
    else if(allTeamsLeague.length>64 && allTeamsLeague.length<=128){ keyPhase = key128round;}

    //Embaralha os times;
    classified.shuffle();
    prePhase.shuffle();
    //TO String

    List prePhaseNames = [];
    for (int clubID in prePhase) {
      prePhaseNames.add(clubsAllNameList[clubID]);
    }
    List classifiedNames = [];
    for (int clubID in classified) {
      classifiedNames.add(clubsAllNameList[clubID]);
    }

    Map idaVoltaInitialMap = saveIdaVoltaTeamNames(prePhaseNames);

    Map<String, Map<String, dynamic>> mapa = {};
    mapa = {getCup(leagueName): {
                keyClassificados: classifiedNames,
                keyPrePhase: prePhaseNames,
                keyPhase: idaVoltaInitialMap,
    }};
    return mapa;
  }

  Map saveIdaVoltaTeamNames(List classifiedTeams){
    Map matchsMapIda = {};
    Map matchsMapVolta = {};
    int k=0;
    for(int i=0; i<classifiedTeams.length; i+=2){
      k += 1;
      matchsMapIda[k] = ResultDict().startNames(classifiedTeams[i], classifiedTeams[i+1]);
      matchsMapVolta[k] = ResultDict().startNames(classifiedTeams[i+1], classifiedTeams[i]);
    }
    Map result = {ResultDict().keyIda: matchsMapIda,
      ResultDict().keyVolta: matchsMapVolta,
    };
    return result;
  }


  List<Club> getListClubsClassificados(String cupName){
    Map<String, dynamic>? cupData = globalCup[cupName];
    List clubsNames = cupData![CupClassification().keyClassificados];
    List<Club> clubs = [];
    for (String clubName in clubsNames) {
      clubs.add(Club(index: clubsAllNameList.indexOf(clubName)));
    }
    return clubs;
  }

  Map getCupPhaseResults(String cupName, String phaseKeyName, String idaOrVoltaKey){
    return globalCup[cupName]![phaseKeyName][idaOrVoltaKey];
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


  nextPhaseClassified(){


    List cupNames = getAllCupNames();
    for (int i = 0; i < cupNames.length; i++) {
      List classifiedClubs = [];

      String cupName = cupNames[i];
      Map matchMapCurrentPhase = {};
      //IF PHASE INSIDE LEAGUE EXISTS
      try {
        String phaseName = getPhaseKeyName(semana);
        String nextPhaseName = listPhases()[listPhases().indexOf(phaseName)+1];
        String idaOrVoltaKey = getIdaOrVoltaKey(phaseName, semana);
        matchMapCurrentPhase = CupClassification().getCupPhaseResults(cupName, phaseName, idaOrVoltaKey);

        if(idaOrVoltaKey == ResultDict().keyVolta){

          //Salva os classificados
          for (int nConfronto = 1; nConfronto <= matchMapCurrentPhase.length; nConfronto++) {

            Map matchMapIda = getCupPhaseResults(cupName, phaseName, ResultDict().keyIda)[nConfronto];
            Map matchMapVolta = getCupPhaseResults(cupName, phaseName, ResultDict().keyVolta)[nConfronto];

            String team1 = matchMapIda[ResultDict().keyTeamName1];
            String team2 = matchMapIda[ResultDict().keyTeamName2];

            int goal1 = matchMapIda[ResultDict().keyGol1] + matchMapVolta[ResultDict().keyGol2];
            int goal2 = matchMapIda[ResultDict().keyGol2] + matchMapVolta[ResultDict().keyGol1];

            if(goal1>goal2){
              classifiedClubs.add(team1);
            }
            else if(goal1<goal2){
              classifiedClubs.add(team2);
              //PENALTIS
            }else if(goal1==goal2){
              int penalti1 = Random().nextInt(5);
              int penalti2 = Random().nextInt(5);
              while(penalti1==penalti2){
                penalti2 = Random().nextInt(5);
              }
              if(penalti1>penalti2){
                classifiedClubs.add(team1);
              }else{
                classifiedClubs.add(team2);
              }
              //SAVE PENALTIS - ordem invertida dos penaltis, porque é salvo no mapa da volta
              globalCup[cupName]![phaseName][ResultDict().keyVolta][nConfronto] = ResultDict().savePenaltis(matchMapVolta, penalti2, penalti1);
            }
          }

          //IF IS THE FIRST STAGE ADD THE ALREADY QUALIFIED CLUBS
          if(phaseName == getFirstPhaseStageName(cupName)){
            classifiedClubs = classifiedClubs + globalCup[cupName]![keyClassificados];
          }

          //SAVE CLASSIFIED CLUBS TO NEW PHASE
          Map idaVoltaInitialMap = saveIdaVoltaTeamNames(classifiedClubs);

          globalCup[cupName]![nextPhaseName] = idaVoltaInitialMap;

        }

      }catch(e){
        //COPA NÃO TEM ESSA FASE
      }
    }

  }

  String getFirstPhaseStageName(String cupName){
    List phasesNames = listPhases();
    late String firstPhaseName;
    for (String phaseName in phasesNames) {
        if(globalCup[cupName]!.containsKey(phaseName)){
          firstPhaseName = phaseName;
        }
    }
    return firstPhaseName;
  }
}


