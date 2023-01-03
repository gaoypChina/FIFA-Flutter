import 'package:fifa/global_variables.dart';

class HighestSellBuy{
  double maxPrice = 0;
  int playerID=0;
  int clubID=0;

}
class HistoricTransfers{
  String sellKeyword = 'Sell';
  String buyKeyword = 'Buy';



  HighestSellBuy getHighest(String keyword){
    HighestSellBuy highestSellBuy = HighestSellBuy();
    int desiredYear = 0;
    int position = 0;
    highestSellBuy.maxPrice = 0;
    if(globalHistoricMyTransfersValue[keyword]!.isNotEmpty){
      globalHistoricMyTransfersValue[keyword]!.forEach((year, listPrices) {
        for(int i=0;i<listPrices.length;i++){
          if(listPrices[i]>highestSellBuy.maxPrice){
            highestSellBuy.maxPrice = listPrices[i];
            desiredYear = year;
            position = i;
          }
        }
      });
      highestSellBuy.playerID = globalHistoricMyTransfersID[keyword]![desiredYear]![position]!;
      highestSellBuy.clubID = globalHistoricMyTransfersClubID[keyword]![desiredYear]![position]!;
    }
    return highestSellBuy;
  }
}