import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/match/result_dict.dart';

class KnockoutStage{
  final Map<String,List<int>> _mapDates = {};
  final Map  _globalVariable = {};

  Map<String, List<int>> get mapDates => _mapDates;
  Map  get globalVariable => _globalVariable;

  String keyFinal = "Final";
  String keySemifinal = "Semifinal";
  String keyQuartas = "Quartas";
  String keyOitavas = "Oitavas";
  String key16round = "Phase 16";
  String key32round = "Phase 32";
  String key64round = "Phase 64";
  String key128round = "Phase 128";

  String keyChampion = "Champion";

  List<String> listPhases(){
    return [key128round, key64round, key32round, keyOitavas, keyQuartas, keySemifinal, keyFinal];
  }

  void getPhaseResults(String competitionName, String phaseKeyName, String idaOrVoltaKey){
  }

  void getPhaseMatchData(String competitionName, String phaseKeyName, String idaOrVoltaKey, int matchNumber){
  }

  Confronto getConfrontoFromMapMatch(Map results){

    Confronto confronto = Confronto(clubName1: results[ResultDict().keyTeamName1], clubName2: results[ResultDict().keyTeamName2]);

    if(results.containsKey(ResultDict().keyGol1)){
      confronto.setGoals(goal1: results[ResultDict().keyGol1], goal2: results[ResultDict().keyGol2]);
    }
    if(results.containsKey(ResultDict().keyPenalty1)){
      confronto.setPenalties(penaltis1: results[ResultDict().keyPenalty2], penaltis2: results[ResultDict().keyPenalty1]);
    }
    return confronto;
  }

  String getPhaseKeyName(int week){
    final entry = mapDates.entries.firstWhere(
            (entry) => entry.value.contains(week)
    );
    return entry.key;
  }

  String getIdaOrVoltaKey(String phaseName, int week){
    List<int> dates = mapDates[phaseName]!;
    if(week == dates.first){
      return ResultDict().keyIda;
    }else{
      return ResultDict().keyVolta;
    }
  }

  Map<int, dynamic> getPhaseResultsMap(String competitionName, int week){
    String phaseKeyName = getPhaseKeyName(week);
    String idaOrVoltaKey = getIdaOrVoltaKey(phaseKeyName, week);
    return Map.from(globalVariable[competitionName]![phaseKeyName][idaOrVoltaKey]);
  }

  Map getClubMatchMap(String cupName, int week, String clubName){
    Map<int, dynamic> allMatchsPhase = {};
    Map match = {};
    try{
      allMatchsPhase = getPhaseResultsMap(cupName, week);

      late int matchKey;
      allMatchsPhase.forEach((key, value) {
        if(value.containsValue(clubName)){
          matchKey = key;
        }
      });

      match = allMatchsPhase[matchKey];

    }catch(e){
      // The league don't have this phase yet
    }

    return match;
  }

  bool hasChampion(String competitionName){
    if(globalVariable.containsKey(competitionName)
        && globalVariable[competitionName].containsKey(KnockoutStage().keyChampion)){
      return true;
    }else{
      return false;
    }
  }

  String getNextPhaseName(String phaseName){
    late String nextPhaseName;
    if(phaseName == KnockoutStage().keyFinal){
      nextPhaseName = KnockoutStage().keyChampion;
    }else{
      nextPhaseName = KnockoutStage().listPhases()[KnockoutStage().listPhases().indexOf(phaseName)+1];
    }
    return nextPhaseName;
  }

  Map saveIdaVoltaTeamNames(List<String> classifiedTeams){
    Map matchesMapIda = {};
    Map matchesMapVolta = {};
    int k=0;
    for(int i=0; i < classifiedTeams.length; i+=2){
      k += 1;
      matchesMapIda[k] = ResultDict().startNames(classifiedTeams[i], classifiedTeams[i+1]);
      matchesMapVolta[k] = ResultDict().startNames(classifiedTeams[i+1], classifiedTeams[i]);
    }
    Map result = {
      ResultDict().keyIda: matchesMapIda,
      ResultDict().keyVolta: matchesMapVolta,
    };
    return result;
  }

  void saveClassifiedAfterPenalties(String competitionName, String phaseName, int nMatch, Map matchMap){}

  void saveChampionName(String competitionName, String clubChampion){}

  void saveNextPhaseInitialMap(String competitionName, String nextPhaseName, Map nextPhaseInitialMap){}


}