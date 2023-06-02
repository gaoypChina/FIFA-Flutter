import 'dart:math';

import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';

class Negotiation{

  String accepted = "Accepted";
  String negotiating = "Negotiating";
  String rejected = "Rejected";
  String cancelled = "Cancelled";

  String typeBuy = "Buy";
  String typeSell = "Sell";
  String typeRent = "Rent";

  String keyWeek = "Semana";
  String keyClub = "Club";
  String keyPrice = "Price";
  String keySalary = "Salary";
  String keyDuration = "Duration";
  String keyStatus = "Status";
  String keyType = "Type";

  bool isNegotiating(int playerID){
    if(getStatus(playerID) == negotiating  || getStatus(playerID) == rejected){
      return true;
    }else{
      return false;
    }
  }

  List getPlayers(){
    return globalNegotiation.keys.toList();
  }
  String getStatus(int playerID){
    return globalNegotiation[playerID][keyStatus];
  }
  String getType(int playerID){
    return globalNegotiation[playerID][keyType];
  }
  String getClubName(int playerID){
    return globalNegotiation[playerID][keyClub];
  }
  double getPrice(int playerID){
    return globalNegotiation[playerID][keyPrice];
  }
  double getSalary(int playerID){
    return globalNegotiation[playerID][keySalary];
  }
  int getWeek(int playerID){
    return globalNegotiation[playerID][keyWeek];
  }
  int getDuration(int playerID){
    return globalNegotiation[playerID][keyDuration];
  }

  void updateOffers(){
    List playersIDs = getPlayers();
    for (var playerID in playersIDs) {
      _updateAnswerOffer(Jogador(index: playerID));
    }
  }
  void _updateAnswerOffer(Jogador player){
    if(isNegotiating(player.index)){

    if(getType(player.index)==typeRent &&
        getSalary(player.index) >= player.salaryK){
      globalNegotiation[player.index][keyStatus] = accepted;
    }else{
      int probSuccessPrice = (getPrice(player.index)/ player.price).round();
      int probSuccessSalary = ((getSalary(player.index)/ player.salaryK)).round();
      if(probSuccessSalary>1){
        probSuccessSalary = 1;
      }
      num probSuccess = pow(probSuccessPrice, 3) * pow(probSuccessSalary, 2);
      int prob = Random().nextInt(100);
      if(prob < probSuccess){
        globalNegotiation[player.index][keyStatus] = accepted;
      }else{
        globalNegotiation[player.index][keyStatus] = rejected;
      }
    }

    if(getPrice(player.index) >= player.price &&
        getSalary(player.index) >= player.salaryK){
      globalNegotiation[player.index][keyStatus] = accepted;
    }

    if(getType(player.index) == typeBuy &&
        getPrice(player.index) <= player.price * 0.5){
      globalNegotiation[player.index][keyStatus] = cancelled;
    }

    }
  }

  void cancelOffer(int playerID){
    globalNegotiation[playerID][keyStatus] = cancelled;
  }

  void resetNegotiatedPlayers(){
    globalNegotiation = {};
  }
  void saveNewOffer(int playerID, double price, double salary, int duration, String type){
    globalNegotiation[playerID][keyPrice] = price;
    globalNegotiation[playerID][keySalary] = salary;
    globalNegotiation[playerID][keyStatus] = negotiating;
    globalNegotiation[playerID][keyDuration] = duration;
    globalNegotiation[playerID][keyType] = type;
  }

  void saveBuyPlayer(Jogador player){
    globalNegotiation[player.index] = {
      keyWeek: semana,
      keyClub: player.clubName,
      keyPrice: player.price,
      keyDuration: 3,
      keySalary: player.salaryK,
      keyStatus: negotiating,
      keyType: typeBuy,
    };
  }

  void saveSellPlayer(Jogador player) {
    globalNegotiation[player.index] = {
      keyWeek: semana,
      keyClub: player.clubName,
      keyPrice: player.price,
      keyDuration: 3,
      keySalary: player.salaryK,
      keyStatus: negotiating,
      keyType: typeSell,
    };
  }

}