import 'package:fifa/classes/mata_mata/knockout_stage.dart';
import 'package:fifa/global_variables.dart';

class KnockoutInternational extends KnockoutStage{
  @override
  Map getPhaseResults(String internationalName, String phaseKeyName, String idaOrVoltaKey){
    return globalInternationalMataMataClubsID[internationalName]![phaseKeyName][idaOrVoltaKey];
  }

  @override
  Map getPhaseMatchData(String internationalName, String phaseKeyName, String idaOrVoltaKey, int matchNumber){
    return globalInternationalMataMataClubsID[internationalName]![phaseKeyName][idaOrVoltaKey][matchNumber];
  }

}