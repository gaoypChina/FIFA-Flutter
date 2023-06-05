import 'package:fifa/values/league_names.dart';

String getTrophyImage(String leagueName){

  String trophyName = 'trophyliga';
  LeagueOfficialNames l = LeagueOfficialNames();

  Map trophiesMap = {
    l.inglaterra1: 'trophypremier',
    l.inglaterra2: 'trophy2division',
    l.inglaterra3: 'trophy2division',
    l.italia1: 'trophyitalia',
    l.italia2: 'trophyitalia',
    l.espanha1: 'trophylaliga',
    l.espanha2: 'trophylaliga',
    l.alemanha1: 'trophybundesliga',
    l.alemanha2: 'trophybundesliga',
    l.franca1: 'trophyligue1',
    l.franca2: 'trophyligue1',
    l.portugal: 'trophyportugal',
    l.holanda: 'trophyportugal', //TODO: MUDAR TROFEU
    l.turquiaGrecia: 'trophyturquia',
    l.ligaEuropa: 'trophyeuropaleague',
    l.lesteEuropeu: 'trophyrussia',
    l.brasil1: 'trophybrasileirao',
    l.brasil2: 'trophy2division',
    l.brasil3: 'trophy2division',
    l.brasil4: 'trophy2division',
    l.argentina: 'trophyargentina',
    l.mercosul: 'trophysulamericana',
    l.colombia: 'trophyliga',
    l.mexico: 'trophymexico',
    l.estadosUnidos: 'trophymls',
    l.asia: 'trophyasia',
    l.africa: 'trophyafrica',
    l.outros: 'trophychile',
  };

  if(trophiesMap.containsKey(leagueName)){
    trophyName = trophiesMap[leagueName];
  }

  Map trophiesMap2 = {
    l.libertadores: 'trophylibertadores',
    l.championsLeague: 'trophychampions',
    l.europaLeagueOficial: 'trophyeuropaleague',
    l.copaSulAmericana: 'trophysulamericana',
    l.resto: 'trophychampions',

    l.mundial: 'trophymundial',

    l.englandCup: 'trophyfacup',
    l.italyCup: 'italia_cup',
    l.germanyCup: 'germany_cup',
    l.brazilCup: 'brasil_cup',
  };
  if(trophiesMap2.containsKey(leagueName)){
    trophyName = trophiesMap2[leagueName];
  }

  return trophyName;
}