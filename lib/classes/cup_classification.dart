import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_divisions.dart';
import 'package:fifa/values/league_names.dart';

class CupClassification{
  String keyClassificados = "Classificados";
  String keyPrePhase = "Pre-fase";
  String keyMatchs = "Matchs";

  String keyFinal = "Final";
  String keySemifinal = "Semifinal";
  String keyQuartas = "Quartas";
  String keyOitavas = "Oitavas";
  String keyFase1 = "1ªfase";
  String keyFaseClassif = "Fase Classificatória";

  Map<String,List<int>> mapDates(){
    Map<String,List<int>> map = {
      keyFinal: [semanasJogosCopas[8], semanasJogosCopas[9]],
      keySemifinal:[semanasJogosCopas[6], semanasJogosCopas[7]],
      keyQuartas: [semanasJogosCopas[4], semanasJogosCopas[5]],
      keyOitavas: [semanasJogosCopas[2], semanasJogosCopas[3]],
      keyFase1: [semanasJogosCopas[0], semanasJogosCopas[1]],
      keyFaseClassif: [semanasJogosCopas[0], semanasJogosCopas[1]],
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
    if(allTeamsLeague.length>=4 && allTeamsLeague.length<8){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 4).toList();
       keyPhase = keySemifinal;
    }
    else if(allTeamsLeague.length>=8 && allTeamsLeague.length<16){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 8).toList();
       keyPhase = keyQuartas;
    }
    else if(allTeamsLeague.length>=16 && allTeamsLeague.length<32){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 16).toList();
       keyPhase = keyOitavas;
    }
    else if(allTeamsLeague.length>=32 && allTeamsLeague.length<64){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 32).toList();
       keyPhase = keyFase1;
    }
    else if(allTeamsLeague.length>=64){
       classified = allTeamsLeague.sublist(0, allTeamsLeague.length - 64).toList();
       keyPhase = keyPrePhase;
    }

    prePhase = allTeamsLeague.where((team) => !classified.contains(team)).toList();

    //Embaralha os times;
    classified.shuffle();
    prePhase.shuffle();

    Map matchsMap = {};
    int k=0;
    for(int i=0; i<prePhase.length;i+=2){
      k += 1;
      matchsMap[k] = ResultDict().startNames(prePhase[i], prePhase[i+1]);
    }

    Map<String, Map<String, dynamic>> mapa = {};
    mapa = {getCup(leagueName): {
                keyClassificados: classified,
                keyPrePhase: prePhase,
                keyPhase: {matchsMap}
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
    return globalCup[keyMatchs]![phaseKeyName];
  }

  Map getCupPhaseResults(int week, String cupName){
    return getPhaseMap(week)[cupName];
  }

  Confronto? getCupClubPhaseResults(int week, String cupName, String clubName){
    Map resultsPhase = getCupPhaseResults(week, cupName);
    for(Map value in resultsPhase.values){
      if(ResultDict().hasClubName(value, clubName)){
        Confronto confronto = ResultDict().getConfronto(value);
        return confronto;
      }
    }
    return null;
  }

}


