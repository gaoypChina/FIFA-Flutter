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
    if(word == groupsPhase){word = Translation(context).text.groupStage;}
    if(word == oitavas){word = Translation(context).text.oitavas;}
    if(word == quartas){word = Translation(context).text.quartas;}
    if(word == semifinal){word = Translation(context).text.semi;}
    if(word == finale){word = Translation(context).text.finale;}
    if(word == qualify){word = Translation(context).text.qualify;}
    return word;
  }
}