import 'package:fifa/values/historic_champions/africa.dart';
import 'package:fifa/values/historic_champions/america.dart';
import 'package:fifa/values/historic_champions/asia.dart';
import 'package:fifa/values/historic_champions/europa.dart';
import 'package:fifa/values/historic_champions/europa_leste.dart';
import 'package:fifa/values/historic_champions/europa_nord_balt.dart';
import 'package:fifa/values/historic_champions/europa_top_leagues.dart';
import 'package:fifa/values/historic_champions/internationals.dart';
import 'package:fifa/values/historic_champions/oceania.dart';
import 'package:fifa/values/historic_champions/oriente_medio.dart';

  Map<double,dynamic> mapChampions(String league){

    Map<String, Map<String, dynamic>> allMaps = {
      "international": mapInternationals,
      "europa_top_leagues": mapEuropaTopLeagues,
      "europa": mapEuropa,
      "europa_leste": mapEuropaLeste,
      "europa_nordicos": mapEuropaNordicosBalticos,
      "america": mapAmerica,
      //"north_america": mapNorthAmerica,
      "africa": mapAfrica,
      "asia": mapAsia,
      "oriente_medio": mapOrienteMedio,
      "oceania": mapOceania,
      //"estaduais": mapEstaduais,
      //"copas": mapCopas,
      //"other_leagues": mapOtherLeagues,
      //"supercopa": mapSupercopa,
    };

      for (Map<String, dynamic> continentMap in allMaps.values) {
        if (continentMap.containsKey(league)) {
          return continentMap[league];
        }
      }
      return {};

  }

