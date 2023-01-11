import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';

class HighestSellBuy{
  int playerID = 0;
  int clubID = 0;
  double maxPrice = 0;
  int overall = 0;
  int weekTimestamp = 0;

}
class HistoricMyTransfers{
  String sellKeyword = 'Sell';
  String buyKeyword = 'Buy';

  String clubNameKeyword = 'ClubName';
  String valueKeyword = 'Value';
  String overallKeyword = 'Overall';
  String weekTimestamp = 'week';

  resetGlobalVariable(){
    globalHistoricMyTransfers
    = {'Sell':{},//'Sell':{anoInicial: {67:{'ClubName':{},'Value':{},'Overall':{}}}
      'Buy' :{}, //'Buy':{anoInicial: {67:{'ClubName':{},'Value':{},'Overall':{}}}
    };
  }

  checkMapHistoricTranfersNew(String sellORbuyStr, Jogador player, int clubID){
    Map<int,Map<String,dynamic>> allPlayersMap = {};
    try{
      allPlayersMap = globalHistoricMyTransfers[sellORbuyStr]![ano]!;
    }catch(e){
      //year don't have data
    }
    allPlayersMap[player.index] = {
      clubNameKeyword: clubID,
      valueKeyword:player.price,
      overallKeyword:player.overall,
      weekTimestamp: semana,
    };
    globalHistoricMyTransfers[sellORbuyStr]![ano] = allPlayersMap;
  }



  List<HighestSellBuy> getTransfersYear(String buyOrSellKeyword, int year){
    Map players = {};
    try {
      players = globalHistoricMyTransfers[buyOrSellKeyword]![year]!;
    }catch(e){
      return [];
    }
    List playersID = players.keys.toList();
    List<HighestSellBuy> highestSellBuyList = [];
    for (int playerID in playersID){
      HighestSellBuy highestSellBuy = HighestSellBuy();
      Map data = globalHistoricMyTransfers[buyOrSellKeyword]![year]![playerID]!;
      highestSellBuy.playerID = playerID;
      highestSellBuy.clubID = data[clubNameKeyword];
      highestSellBuy.maxPrice = data[valueKeyword];
      highestSellBuy.overall = data[overallKeyword];
      highestSellBuy.weekTimestamp = semana;
      highestSellBuyList.add(highestSellBuy);
    }
    return highestSellBuyList;
  }

  HighestSellBuy getHighest(String buyOrSellKeyword){
    //CREATE LIST OF PLAYERS
    List<HighestSellBuy> highestSellBuyList = [];
    if(globalHistoricMyTransfers[buyOrSellKeyword]!.isNotEmpty){
      globalHistoricMyTransfers[buyOrSellKeyword]!.forEach((year, mapPlayers) {

        List<HighestSellBuy> highestSellBuyListYear = getTransfersYear(buyOrSellKeyword,year);
        highestSellBuyList += highestSellBuyListYear;
      });
    }

    //FILTER
    double maxPrice = 0;
    HighestSellBuy choosenPlayer = HighestSellBuy();
    for (HighestSellBuy highestSellBuy in highestSellBuyList) {
      if(highestSellBuy.maxPrice > maxPrice){
        maxPrice = highestSellBuy.maxPrice;
        choosenPlayer = highestSellBuy;
      }
    }

    return choosenPlayer;
  }
}