import 'dart:convert';
import 'package:fifa/global_variables.dart';
import 'package:flutter/services.dart';

Future<Map<double, dynamic>> mapChampionsJSON(String league) async {
  List<String> allNames = [
    "africa", "americasul", "asia", "brasil", "asia_central", "oriente_medio",
    "europaTOP7", "europa_ocidental", "europa_oriental", "oceania",
    "internationals", "estaduais", "cups", "recopas", "others",
    "countries"
  ];


    for (String filename in allNames) {
      Map<String, dynamic> leaguesMap = await loadJsonData(filename);
      if (leaguesMap.containsKey(league)) {
        Map<String, dynamic> mapYears = leaguesMap[league]!;
        // Create a new map with double keys
        Map<double, dynamic> doubleKeyMap = {};
        mapYears.forEach((key, value) {
          // Parse the key to a double
          double? doubleKey = double.tryParse(key);

          if (doubleKey != null) {
            // Add the entry to the new map with a double key
            doubleKeyMap[doubleKey] = value;
          }
        });

        return doubleKeyMap;
      }
    }
  return {};
}

Future<Map<double, dynamic>> mapChampions(String league) async {

  List<List<dynamic>> filteredLists = globalHistoricRealChampions.where((list) => list[0] == league).toList();

  Map<double, List<String>> transformedMap = {};

  for (var innerList in filteredLists) {

    double keyYear = innerList[1];
    String clubName = innerList[3];

    transformedMap.putIfAbsent(keyYear, () => []); // Initialize an empty list if key doesn't exist
    transformedMap[keyYear]!.add(clubName); // Add value to the list associated with the key

  }
  // Sort keys in descending order
  List<double> sortedKeys = transformedMap.keys.toList()..sort((a, b) => b.compareTo(a));

  // Access map elements using sorted keys
  Map<double, List<String>> transformedMapOrdered = {};
  for (double key in sortedKeys) {
    transformedMapOrdered[key] = transformedMap[key]!;
  }

  if(transformedMapOrdered.isNotEmpty){
    return transformedMapOrdered;
  }else{
    return {};
  }

}

Future<Map<String, dynamic>> loadJsonData(String filename) async {
  // Load the JSON file
  final String jsonString = await rootBundle.loadString('assets/json/$filename.json');

  // Parse the JSON string
  Map<String, dynamic> jsonData = json.decode(jsonString);

  return jsonData;
}

