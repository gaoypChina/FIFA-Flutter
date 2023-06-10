import 'package:fifa/classes/match/result_dict.dart';

class KnockoutStage{

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

  void getPhaseResults(String internationalName, String phaseKeyName, String idaOrVoltaKey){
  }

  void getPhaseMatchData(String internationalName, String phaseKeyName, String idaOrVoltaKey, int matchNumber){
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
    Map result = {
      ResultDict().keyIda: matchsMapIda,
      ResultDict().keyVolta: matchsMapVolta,
    };
    return result;
  }
}