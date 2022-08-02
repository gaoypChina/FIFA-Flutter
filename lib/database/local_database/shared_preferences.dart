import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {

  ///////////////////////////////////////////////////////////////////////////
  // PLAYER'S DATABASE
  //////////////////////////////////////////////////////////////////////////
  //save data
  Future<bool> savesharedSaveNumber(int integer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt('sharedSaveNumber', integer);
  }

  //GET DATA
  Future<int?> getsharedSaveNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('sharedSaveNumber');
  }

  ///////////////////////////////////////////////////////////////////////////
  // SAVED GAMES
  ///////////////////////////////////////////////////////////////////////////
  Future<bool> savesharedSaveGameNumber(int integer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt('sharedSaveGameNumber', integer);
  }

  Future<int?> getsharedSaveGameNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('sharedSaveGameNumber');
  }

  ///////////////////////////////////////////////////////////////////////////
  // COACH RANKING
  ///////////////////////////////////////////////////////////////////////////
  Future<bool> saveCoachRanking(List<String> ranking) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList('COACHRANKING', ranking);
  }

  Future<List<String>?> getCoachRanking() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('COACHRANKING');
  }

  ///////////////////////////////////////////////////////////////////////////
  // MAP RANKING
  ///////////////////////////////////////////////////////////////////////////
  Future<bool> saveMapRanking(List<String> ranking) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setStringList('MAPCOMPLETION', ranking);
  }

  Future<List<String>?> getMapRanking() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('MAPCOMPLETION');
  }
///////////////////////////////////////////////////////////////////////////
// REMOVE
///////////////////////////////////////////////////////////////////////////

 ////////LIST
 //  Future<bool> savePlayersDatabase() async {
 //    SharedPreferences prefs = await SharedPreferences.getInstance();
 //    return prefs.setString('sharedSaveContentKEY', jsonEncode(globalSaveData.toString())); // Encode the list here
 //  }

//   getPlayersDatabase() async {// Encode the list here
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? value = prefs.getString('sharedSaveContentKEY');
//     value = value!.replaceAll("\"", '');
//     List<int> saveListNumber =[];
//     var list = value.toString().split('[');
//     //Do final pro começo
//     for (int i = list.length-1; i >= 0; i--){
//       list[i] = list[i].replaceAll('[', '');
//       list[i] = list[i].replaceAll(']', '');
//       list[i] = list[i].replaceAll('{', '');
//       list[i] = list[i].replaceAll('}', '');
//       //NUMBER OF SAVE
//       if(list[i].contains(':')){
//         int position = list[i].indexOf(':')-1;
//         saveListNumber.add(int.parse(list[i][position]));
//       }
//       if(list[i].length<100){
//         list.removeAt(i);
//       }
//     }
//
//     List listaTemp = [];
//     for (int numberSave = 0 ; numberSave < saveListNumber.length; numberSave++) {
//       for (int i = 0; i < 5; i++) {
//         //SEPARA CADA LIST EM STRINGS
//         List listaTempStrings = [];
//         listaTempStrings = list[i].split(',');
//         //PARA CADA STRING:
//           for (int nStrings = 0; nStrings < listaTempStrings.length; nStrings++) {
//             //REMOVE STRINGS VAZIAS
//             if(listaTempStrings[nStrings].toString().trim().isEmpty){
//               listaTempStrings.removeAt(nStrings);
//             }else{
//               //listaTempStrings[nStrings]=listaTempStrings.toString().trim();
//             }
//         }
//         listaTemp.add(listaTempStrings);
//       }
//       globalSaveData[saveListNumber[numberSave]] = List.from(listaTemp);
//     }
// /*
//     globalSaveData[1][0] = listOficial[1][0];//nome
//     globalSaveData[1][1] = listOficial[1][1];//Clubindex
//     globalSaveData[1][2] = listOficial[1][2];//age
//     globalSaveData[1][3] = listOficial[1][3];//overall
//     globalSaveData[1][4] = listOficial[1][4];//position
//     globalSaveData[1][4] = listOficial[1][5];//nationality
// */
//
//
//  // Decode then print it out
//   }

  ////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////


}