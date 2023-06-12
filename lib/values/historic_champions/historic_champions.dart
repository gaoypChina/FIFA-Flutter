import 'package:fifa/values/historic_champions/africa.dart';
import 'package:fifa/values/historic_champions/america.dart';
import 'package:fifa/values/historic_champions/asia.dart';
import 'package:fifa/values/historic_champions/cups.dart';
import 'package:fifa/values/historic_champions/estaduais.dart';
import 'package:fifa/values/historic_champions/europa.dart';
import 'package:fifa/values/historic_champions/europa_leste.dart';
import 'package:fifa/values/historic_champions/europa_nord_balt.dart';
import 'package:fifa/values/historic_champions/europa_top_leagues.dart';
import 'package:fifa/values/historic_champions/internationals.dart';
import 'package:fifa/values/historic_champions/north_america.dart';
import 'package:fifa/values/historic_champions/oceania.dart';
import 'package:fifa/values/historic_champions/oriente_medio.dart';
import 'package:fifa/values/historic_champions/other_leagues.dart';
import 'package:fifa/values/historic_champions/supercopa.dart';

  Map<double,dynamic> mapChampions(String league){

    Map<String, Map<String, dynamic>> allMaps = {
      "international": mapInternationals,
      "europa_top_leagues": mapEuropaTopLeagues,
      "europa": mapEuropa,
      "europa_leste": mapEuropaLeste,
      "europa_nordicos": mapEuropaNordicosBalticos,
      "america": mapAmerica,
      "north_america": mapNorthAmerica,
      "africa": mapAfrica,
      "asia": mapAsia,
      "oriente_medio": mapOrienteMedio,
      "oceania": mapOceania,
      "estaduais": mapEstaduais,
      "copas": mapCopas,
      "other_leagues": mapOtherLeagues,
      "supercopa": mapSupercopa,
    };

      for (Map<String, dynamic> continentMap in allMaps.values) {
        if (continentMap.containsKey(league)) {
          return continentMap[league];
        }
      }
      return {};

  }

void saveMapToCsv(String filePath) async {
    // Função em teste
  //Carregar as páginas com os mapas demora muito
  //Estou pensando em pegar eles desses csvs
  List<List<dynamic>> rows = [];

  // Add header row
  rows.add(['League', 'Year', 'Teams']);

  mapInternationals.forEach((leagueName, years) {
    years.forEach((double year, clubNames) {
      rows.add([leagueName, year.toStringAsFixed(1), clubNames.toString()]);
    });
    //
  });

  // Write CSV file
  //File file = File(filePath);
  //String csv = const ListToCsvConverter().convert(rows);
  //await file.writeAsString(csv);
}
