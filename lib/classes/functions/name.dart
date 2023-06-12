import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';

class Name{
  String groupsPhase = 'Fase de Grupos';
  String oitavas = 'Oitavas';
  String quartas = 'Quartas';
  String semifinal = 'Semifinal';
  String finale = 'Final';
  String qualify = 'Classificar';
  String mundial = 'Mundial';

  showTranslated(BuildContext context, String word){
    Map<String, String> mapTranslation = {
      groupsPhase: Translation(context).text.groupStage,
      oitavas: Translation(context).text.oitavas,
      quartas: Translation(context).text.quartas,
      semifinal: Translation(context).text.semi,
      finale: Translation(context).text.finale,
      qualify: Translation(context).text.qualify,
    };
    if (mapTranslation.containsKey(word)){
      return mapTranslation[word];
    }
    return word;
  }
}