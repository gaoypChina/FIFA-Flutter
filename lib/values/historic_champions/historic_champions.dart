import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';

Future<Map<double, dynamic>> mapChampions(String league) async {
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

classificationCSV(String league) async{

  final String raw = await rootBundle.loadString('assets/csv/classification.csv');
  List<List<dynamic>> parsed = const CsvToListConverter().convert(raw);
  List<List<dynamic>> filteredLists = parsed.where((list) => list[0] == league).toList();


  Map<double, List<String>> transformedMap = {};

  print(filteredLists);
  for (var innerList in filteredLists) {
    double keyYear = innerList[1]; // Key is the first element of the inner list
    String value = innerList[3]; // Value is the fourth element of the inner list

    transformedMap.putIfAbsent(keyYear, () => []); // Initialize an empty list if key doesn't exist
    transformedMap[keyYear]!.add(value); // Add value to the list associated with the key
  }

  if(transformedMap.isNotEmpty){
    return transformedMap;
  }
}

Future<Map<String, dynamic>> loadJsonData(String filename) async {
  // Load the JSON file
  final String jsonString = await rootBundle.loadString('assets/json/$filename.json');

  // Parse the JSON string
  Map<String, dynamic> jsonData = json.decode(jsonString);

  return jsonData;
}

