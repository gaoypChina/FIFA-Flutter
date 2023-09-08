import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/functions/order_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:flutter/material.dart';

class TransferParameters {
  int ascOrDescAge = 0;
  int ascOrDescOVR = 0;
  int ascOrDescMoney = 0;
  String filteredPosition = '';
  String filteredCountry = '';
  String filteredLeague = '';
  String filteredTeam = '';
  int page = 0;

  FilterTransfersController ageControl = FilterTransfersController(title: "Age", values: const RangeValues(15, 50));
  FilterTransfersController ovrControl = FilterTransfersController(title: "Overall", values: const RangeValues(30, 100));
  FilterTransfersController priceControl = FilterTransfersController(title: "Price", values: const RangeValues(0, 400));

}

class FilterTransfersController{
  late String title;
  late RangeValues values;
  late double min;
  late double max;

  FilterTransfersController({required this.title, required this.values}){
    min = values.start;
    max = values.end;
  }

  void printar(){
    print("start: ${values.start}    end:${values.end}");
  }

  void updateValue(RangeValues newValues){
    values = newValues;
  }

  double mapPriceScale(double value) {
    double adjValue = value*value*value*0.00001;
    if(adjValue>max){
      adjValue=max;
    }
    return adjValue;
  }

  void fromRangeValues(){
    values = RangeValues(
        mapPriceScale(values.start),
        mapPriceScale(values.end)
    );
  }


}

class FilterPlayers{

  TransferParameters transferParameters = TransferParameters();
  List copyJogadoresID = List.from(globalJogadoresIndex);
  List copyJogadoresAge = List.from(globalJogadoresAge);
  List copyJogadoresOVR = List.from(globalJogadoresOverall);
  String searchString = '';

  resetCopyLists() {
    copyJogadoresID = List.from(globalJogadoresIndex);
    copyJogadoresAge = List.from(globalJogadoresAge);
    copyJogadoresOVR = List.from(globalJogadoresOverall);
    transferParameters.page = 0;
  }
  setOverall() {
    transferParameters.ascOrDescAge = 0;
    transferParameters.ascOrDescMoney = 0;
    transferParameters.ascOrDescOVR++;
    if (transferParameters.ascOrDescOVR == 3) {
      transferParameters.ascOrDescOVR = 1;
    }
    filterByPosition();
  }

  setAge() {
    transferParameters.ascOrDescOVR = 0;
    transferParameters.ascOrDescMoney = 0;
    transferParameters.ascOrDescAge++;
    if (transferParameters.ascOrDescAge == 3) {
      transferParameters.ascOrDescAge = 1;
    }
    filterByPosition();
  }

  setPrice() {
    transferParameters.ascOrDescAge = 0;
    transferParameters.ascOrDescOVR = 0;
    transferParameters.ascOrDescMoney++;
    if (transferParameters.ascOrDescMoney == 3) {
      transferParameters.ascOrDescMoney = 1;
    }
    filterByPosition();
  }



  filterByAge() {
    copyJogadoresAge = [];
    for (int playerID=0;playerID < copyJogadoresID.length; playerID++) {
      Jogador player = Jogador(index: playerID);
      copyJogadoresAge.add(player.age);
    }
    if (transferParameters.ascOrDescAge == 1) {
      if (searchString.isNotEmpty) {
        transferParameters.page = 0;
      } else {
        resetCopyLists();
      }
      List list = Order().listCrescente(
          listA: copyJogadoresAge,
          listB: copyJogadoresID,
          length: copyJogadoresAge.length);
      copyJogadoresAge = List.from(list[0]);
      copyJogadoresID = List.from(list[1]);
    }
    if (transferParameters.ascOrDescAge == 2) {
      if (searchString.isNotEmpty) {
        transferParameters.page = 0;
      } else {
        resetCopyLists();
      }
      List list = Order().listDecrescente(
          listA: copyJogadoresAge,
          listB: copyJogadoresID,
          length: copyJogadoresAge.length);
      copyJogadoresAge = List.from(list[0]);
      copyJogadoresID = List.from(list[1]);
    }
  }

  filterByOVR() {
    copyJogadoresOVR = [];
    for (int playerID=0;playerID < copyJogadoresID.length; playerID++) {
      Jogador player = Jogador(index: playerID);
      copyJogadoresOVR.add(player.overall);
    }
    if (transferParameters.ascOrDescOVR == 1) {
      if (searchString.isNotEmpty) {
        transferParameters.page = 0;
      } else {
        resetCopyLists();
      }
      List list = Order().listDecrescente(
          listA: copyJogadoresOVR,
          listB: copyJogadoresID,
          length: copyJogadoresOVR.length);
      copyJogadoresOVR = List.from(list[0]);
      copyJogadoresID = List.from(list[1]);
    }
    if (transferParameters.ascOrDescOVR == 2) {
      if (searchString.isNotEmpty) {
        transferParameters.page = 0;
      } else {
        resetCopyLists();
      }
      List list = Order().listCrescente(
          listA: copyJogadoresOVR,
          listB: copyJogadoresID,
          length: copyJogadoresOVR.length);
      copyJogadoresOVR = List.from(list[0]);
      copyJogadoresID = List.from(list[1]);
    }
  }

  filterByPrice() {
    List copyJogadoresPrice = [];
    for (int playerID=0;playerID < copyJogadoresID.length; playerID++) {
      Jogador player = Jogador(index: playerID);
      copyJogadoresPrice.add(player.price);
    }
    if (transferParameters.ascOrDescMoney == 1) {
      if (searchString.isNotEmpty) {
        transferParameters.page = 0;
      } else {
        resetCopyLists();
      }
      List list = Order().listDecrescente(
          listA: copyJogadoresPrice,
          listB: copyJogadoresID,
          length: copyJogadoresPrice.length);
      copyJogadoresPrice = List.from(list[0]);
      copyJogadoresID = List.from(list[1]);
    }
    if (transferParameters.ascOrDescMoney == 2) {
      if (searchString.isNotEmpty) {
        transferParameters.page = 0;
      } else {
        resetCopyLists();
      }
      List list = Order().listCrescente(
          listA: copyJogadoresPrice,
          listB: copyJogadoresID,
          length: copyJogadoresPrice.length);
      copyJogadoresPrice = List.from(list[0]);
      copyJogadoresID = List.from(list[1]);
    }
  }

  filterByCountry(){
    filterByPosition();
  }
  filterByPosition() {
    if (searchString.isNotEmpty) {
      transferParameters.page = 0;
    } else {
      resetCopyLists();
    }
    filterByAge();
    filterByOVR();
    filterByPrice();
    if (transferParameters.filteredPosition.isNotEmpty) {
      copyJogadoresID.removeWhere((playerID) => Jogador(index: playerID).position != transferParameters.filteredPosition);
    }
    if (transferParameters.filteredCountry.isNotEmpty) {
      copyJogadoresID.removeWhere((playerID) => Jogador(index: playerID).nationality != transferParameters.filteredCountry);
    }
    if (transferParameters.filteredTeam.isNotEmpty) {
      copyJogadoresID.removeWhere((playerID) => Jogador(index: playerID).clubName != transferParameters.filteredTeam);
    }

    copyJogadoresID.removeWhere((playerID) => Jogador(index: playerID).age < transferParameters.ageControl.values.start);

    copyJogadoresID.removeWhere((playerID) => Jogador(index: playerID).age > transferParameters.ageControl.values.end);

    copyJogadoresID.removeWhere((playerID) => Jogador(index: playerID).price < transferParameters.priceControl.values.start);

    copyJogadoresID.removeWhere((playerID) => Jogador(index: playerID).price > transferParameters.priceControl.values.end);

    copyJogadoresID.removeWhere((playerID) => Jogador(index: playerID).overall < transferParameters.ovrControl.values.start);

    copyJogadoresID.removeWhere((playerID) => Jogador(index: playerID).overall > transferParameters.ovrControl.values.end);

  }
}
