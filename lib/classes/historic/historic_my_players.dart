import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';

class HistoricPlayerData{
  late int playerID;
  late String name;
  late int clubID;
  late int ovr;
  late int matchs;
  late int goals;
  late int assists;
  late double price;

  getData({required int year, required int playerID}){
    Map values = Map.from(globalHistoricMyClub[year][playerID]);
    this.playerID = playerID;
    name = values['name'];
    clubID = values['clubID'];
    ovr = values['ovr'];
    matchs = values['matchs'];
    goals = values['goals'];
    assists = values['assists'];
    price = values['price'];
  }
}
class HistoricMyPlayers{

  Map getData({required int year}){
    return Map.from(globalHistoricMyClub[year]);
  }
  Map getOnlyPlayers({required int year}){
    Map data = getData(year: year);
    data.remove('clubID');
    data.remove('leagueID');
    return data;
  }

  int getClubID({required int year}){
    return globalHistoricMyClub[year]['clubID'];
  }
  int getLeagueID({required int year}){
    return globalHistoricMyClub[year]['leagueID'];
  }

  saveMyClubData(My my){
    List<Jogador> players = [];
    for (int playerID in my.jogadores) {
      players.add(Jogador(index: playerID));
    }

    Map values = {
      'clubID': my.clubID,
      'leagueID': my.getLeagueID(),
    };
    for (Jogador player in players) {
      values[player.index] = {
        'playerID': player.index,
        'name': player.name,
        'clubID': player.clubID,
        'price': player.price,
        'ovr': player.overall,
        'matchs':player.matchsYear,
        'goals': player.goalsYear,
        'assists':player.assistsYear,
    };
    }

    globalHistoricMyClub[ano] = values;
  }

  List<HistoricPlayerData> getPlayersList({required int year, required bool isActualYear}){
    List<HistoricPlayerData> historicPlayerDatas =[];
    if(!isActualYear){
      Map data = HistoricMyPlayers().getOnlyPlayers(year: year);
      for (int playerID in data.keys) {
        HistoricPlayerData historicPlayerData = HistoricPlayerData();
        historicPlayerData.getData(year: year, playerID: playerID);
        historicPlayerDatas.add(historicPlayerData);
      }
    }else{
      for (int playerID in My().jogadores) {
        Jogador player = Jogador(index: playerID);
        HistoricPlayerData historicPlayerData = HistoricPlayerData();
        historicPlayerData.playerID = playerID;
        historicPlayerData.name = player.name;
        historicPlayerData.ovr = player.overall;
        historicPlayerData.matchs = player.matchsYear;
        historicPlayerData.goals = player.goalsYear;
        historicPlayerData.assists = player.assistsYear;
        historicPlayerData.price = player.price;
        historicPlayerDatas.add(historicPlayerData);
      }
    }
    return historicPlayerDatas;
  }

  getBestPlayer({required List<HistoricPlayerData> historicPlayerDatas}){
    int ovrMax = 0;
    late HistoricPlayerData bestPlayer;
    for (HistoricPlayerData historicPlayerData in historicPlayerDatas) {
      if(historicPlayerData.ovr >= ovrMax ){
        ovrMax = historicPlayerData.ovr;
        bestPlayer = historicPlayerData;
      }
    }
    return bestPlayer.playerID;
  }
  getArtilheiro({required List<HistoricPlayerData> historicPlayerDatas}){
    int goalsMax = 0;
    late HistoricPlayerData bestPlayer;
    for (HistoricPlayerData historicPlayerData in historicPlayerDatas) {
      if(historicPlayerData.goals >= goalsMax ){
        goalsMax = historicPlayerData.goals;
        bestPlayer = historicPlayerData;
      }
    }
    return bestPlayer.playerID;
  }
  getAssistente({required List<HistoricPlayerData> historicPlayerDatas}){
    int assistsMax = 0;
    late HistoricPlayerData bestPlayer;
    for (HistoricPlayerData historicPlayerData in historicPlayerDatas) {
      if(historicPlayerData.assists >= assistsMax ){
        assistsMax = historicPlayerData.assists;
        bestPlayer = historicPlayerData;
      }
    }
    return bestPlayer.playerID;
  }
  getMVP({required List<HistoricPlayerData> historicPlayerDatas}){
    double priceMax = 0;
    late HistoricPlayerData bestPlayer;
    for (HistoricPlayerData historicPlayerData in historicPlayerDatas) {
      if(historicPlayerData.price >= priceMax ){
        priceMax = historicPlayerData.price;
        bestPlayer = historicPlayerData;
      }
    }
    return bestPlayer.playerID;
  }
}