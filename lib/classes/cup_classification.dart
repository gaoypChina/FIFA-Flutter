import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/match/confronto.dart';
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
  String key32round = "Fase 32";
  String key64round = "Fase 64";
  String key128round = "Fase 128";

  Map<String,List<int>> mapDates(){
    Map<String,List<int>> map = {
      keyFinal: [semanasJogosCopas[8], semanasJogosCopas[9]],
      keySemifinal:[semanasJogosCopas[6], semanasJogosCopas[7]],
      keyQuartas: [semanasJogosCopas[4], semanasJogosCopas[5]],
      keyOitavas: [semanasJogosCopas[2], semanasJogosCopas[3]],
      key32round: [semanasJogosCopas[0], semanasJogosCopas[1]],
      key64round: [semanasJogosCopas[0], semanasJogosCopas[1]],
    };
    return map;
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

  Map<String, Map<String, dynamic>> definePrePhaseTeams(List allTeamsLeague, String leagueName){
    List classified = [];
    List prePhase = [];
    String keyPhase = "";
    allTeamsLeague.shuffle();
    if(allTeamsLeague.length>=4 && allTeamsLeague.length<8){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 4).toList();
    }
    else if(allTeamsLeague.length>=8 && allTeamsLeague.length<16){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 8).toList();
    }
    else if(allTeamsLeague.length>=16 && allTeamsLeague.length<32){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 16).toList();
    }
    else if(allTeamsLeague.length>=32 && allTeamsLeague.length<64){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 32).toList();
    }
    else if(allTeamsLeague.length>=64){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 64).toList();
    }

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

    Map matchsMap = {};
    int k=0;
    for(int i=0; i<prePhase.length;i+=2){
      k += 1;
      matchsMap[k] = ResultDict().startNames(clubsAllNameList[prePhase[i]], clubsAllNameList[prePhase[i+1]]);
    }

    Map<String, Map<String, dynamic>> mapa = {};
    mapa = {getCup(leagueName): {
                keyClassificados: classified,
                keyPrePhase: prePhase,
                keyPhase: matchsMap
    }};
    return mapa;
  }

  List<Club> getListClubsPrePhase(String cupName){
    Map<String, dynamic>? cupData = globalCup[cupName];
    List clubsIDs = cupData![CupClassification().keyPrePhase];
    List<Club> clubs = [];
    for (int clubID in clubsIDs) {
      clubs.add(Club(index: clubID));
    }
    return clubs;
  }

  List<Club> getListClubsClassificados(String cupName){
    Map<String, dynamic>? cupData = globalCup[cupName];
    List clubsIDs = cupData![CupClassification().keyClassificados];
    List<Club> clubs = [];
    for (int clubID in clubsIDs) {
      clubs.add(Club(index: clubID));
    }
    return clubs;
  }

  Map getPhaseMap(int week){
    String phaseKeyName = getPhaseKeyName(week);
    return globalCup[phaseKeyName]!;
  }

  Map getCupPhaseResultsWeek(int week, String cupName){
    return getPhaseMap(week)[cupName];
  }

  Map getCupPhaseResults(String phaseKeyName, String cupName){
    return globalCup[cupName]![phaseKeyName];
  }

  Confronto? getCupClubPhaseResults(int week, String cupName, String clubName){
    Map resultsPhase = getCupPhaseResultsWeek(week, cupName);
    for(Map value in resultsPhase.values){
      if(ResultDict().hasClubName(value, clubName)){
        Confronto confronto = ResultDict().getConfronto(value);
        return confronto;
      }
    }
    return null;
  }

}


