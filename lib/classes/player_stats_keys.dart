class PlayerStatsKeys{
  String keyPlayerMatchs = "Player Matchs Played";
  String keyPlayerGoals = "Player Goals";
  String keyPlayerAssists = "Player Assists";
  String keyPlayerCleanSheets = "Player Clean Sheets";
  String keyPlayerGolsSofridos = "Player Gols Sofridos";
}


class FilterPlayersTitle{
  // título das tabs de exibição
  String artilheiros = "Artilheiros";
  String assists = "Assistências";
  String bestPlayer = "Melhor Jogador";
  String cleanSheets = "Clean Sheets";
  String redCards = "Cartões Vermelhos";
  String yellowCards = "Cartões Amarelos";

  getList(){
    return [artilheiros, assists, bestPlayer, cleanSheets];
  }

}