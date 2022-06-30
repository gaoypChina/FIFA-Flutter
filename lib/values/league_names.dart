class LeagueOfficialNames{
  final String championsLeague = 'Champions League';
  final String libertadores = 'Libertadores';
  final String concacaf = 'Concacaf champions';
  final String asiaafricaChampionsLeague = 'World Champions League';
  final String resto = 'Resto do Mundo';
  final String mundial = 'Mundial de Clubes da FIFA';

  //LIGAS
  String inglaterra1 = 'Premier League';  String inglaterra2 = 'Championship'; String inglaterra3 = 'Championship2';
  String italia1 = 'Serie A TIM';  String italia2 = 'Serie B TIM';
  String espanha1 = 'La Liga';  String espanha2 = 'La Liga2';
  String franca1 = 'Ligue 1'; String franca2 = 'Ligue 2';
  String alemanha1 = 'Bundesliga';  String alemanha2 = 'Bundesliga 2';
  String ptHol = 'Liga Portugal Holanda'; String turquiaGrecia = 'Liga Greco-Turca';
  String ligaEuropa = 'Liga Europeia';  String lesteEuropeu = 'Leste Europeu';

  String brasil1 = 'Brasileirão';  String brasil2 = 'Brasileirão - Série B';String brasil3 = 'Brasileirão - Série C';
  String paulistao = 'Paulistão';
  String argentina = 'Campeonato Argentino';String sulamericano = 'Sul-Americano';String colombia = 'Merconorte';
  String mexico = 'Liga MX';String estadosUnidos = 'MLS';
  String asia = 'Liga Ásia';  String orienteMedio = 'Liga Oriente Médio';  String africa = 'Liga África';
  String outros = 'Outros';

  //COPAS
  String englandCup = 'FA Cup';String italyCup = 'Coppa Italia';String spainCup = 'Copa del Rey';
  String germanyCup = 'DFB Pokal';String franceCup = 'Coupe de France';
  String portugalCup = 'Taça de Portugal';String turkeyCup = 'Turkiye Kupasi';
  String ligaEuropaCup = 'Copa da Europa';String eastEuropeCup = 'Leste Europeu Copa';

  String brazilCup = 'Copa do Brasil';String argentinaCup = 'Copa Argentina';
  String sulamericanaCup = 'Copa Argentina';String merconorteCup = 'Copa Merconorte';

  String mexicoCup = 'Copa MX';String usaCup = 'MLS Cup';
  String asiaCup = 'Asia Cup';String africaCup = 'África Cup';
  String othersCup = 'Outros Cup';

}

getInternationalLeagueNumber(String internationalLeague){
  if(internationalLeague == LeagueOfficialNames().championsLeague){
    return 0;
  }
  if(internationalLeague == LeagueOfficialNames().libertadores){
    return 1;
  }
  if(internationalLeague == LeagueOfficialNames().resto){
    return 2;
  }
  return -1;
}

List internationalLeagueNames = [LeagueOfficialNames().championsLeague,LeagueOfficialNames().libertadores];

//Pra adicionar uma nova liga adicione o index da liga aqui:
//Essas são as ligas que de fato estão no jogo
//ID<50 -> Champions League
//ID<70 -> Libertadores
List leaguesListRealIndex = [
  1,2,3,5,6, 7,8,  9,10,11,12,15,16, 20,21,    50,51,52,60,61,62,   70,71,  80, 85, 90
];

List getAvailableLeaguesNames(){
  List availableLeaguesNames = [];
  leaguesIndexFromName.forEach((leagueName, leagueID) {
    if(leaguesListRealIndex.contains(leagueID)){
      availableLeaguesNames.add(leagueName);
    }
  });
  return availableLeaguesNames;
}

int nLeaguesTotal = leaguesListRealIndex.length;

List leagueNames = [
  LeagueOfficialNames().inglaterra1,LeagueOfficialNames().inglaterra2,LeagueOfficialNames().inglaterra3,
  LeagueOfficialNames().italia1,LeagueOfficialNames().italia2,
  LeagueOfficialNames().espanha1,LeagueOfficialNames().espanha2,
  LeagueOfficialNames().franca1,LeagueOfficialNames().franca2,
  LeagueOfficialNames().alemanha1,LeagueOfficialNames().alemanha2,
  LeagueOfficialNames().ptHol,LeagueOfficialNames().turquiaGrecia,
  LeagueOfficialNames().ligaEuropa,LeagueOfficialNames().lesteEuropeu,

  LeagueOfficialNames().brasil1,LeagueOfficialNames().brasil2,LeagueOfficialNames().brasil3,
  LeagueOfficialNames().paulistao,
  LeagueOfficialNames().argentina,LeagueOfficialNames().sulamericano,LeagueOfficialNames().colombia,
  LeagueOfficialNames().mexico,LeagueOfficialNames().estadosUnidos,
  LeagueOfficialNames().asia,LeagueOfficialNames().orienteMedio,LeagueOfficialNames().africa,
  LeagueOfficialNames().outros,
];


Map leaguesIndexFromName = {
  LeagueOfficialNames().inglaterra1: 1,
  LeagueOfficialNames().inglaterra2: 2,
  LeagueOfficialNames().inglaterra3: 3,
  LeagueOfficialNames().italia1: 5,
  LeagueOfficialNames().italia2: 6,

  LeagueOfficialNames().espanha1: 7,
  LeagueOfficialNames().espanha2: 8,
  LeagueOfficialNames().franca1: 9,
  LeagueOfficialNames().franca2: 10,
  LeagueOfficialNames().alemanha1: 11,
  LeagueOfficialNames().alemanha2: 12,
  LeagueOfficialNames().ptHol: 15,
  LeagueOfficialNames().turquiaGrecia: 16,

  LeagueOfficialNames().ligaEuropa: 20,
  LeagueOfficialNames().lesteEuropeu: 21,

  LeagueOfficialNames().brasil1: 50,
  LeagueOfficialNames().brasil2: 51,
  LeagueOfficialNames().brasil3: 52,
  LeagueOfficialNames().paulistao: 53,
  LeagueOfficialNames().argentina: 60,
  LeagueOfficialNames().sulamericano: 61,
  LeagueOfficialNames().colombia: 62,

  LeagueOfficialNames().mexico: 70,
  LeagueOfficialNames().estadosUnidos: 71,
  LeagueOfficialNames().asia: 80,
  LeagueOfficialNames().orienteMedio: 81,
  LeagueOfficialNames().africa: 85,
  LeagueOfficialNames().outros: 90,
};

Map nTeamsRelegated = {
  LeagueOfficialNames().inglaterra1: 3,
  LeagueOfficialNames().inglaterra2: 3,
  LeagueOfficialNames().italia1: 3,

  LeagueOfficialNames().espanha1: 3,
  LeagueOfficialNames().franca1: 3,
  LeagueOfficialNames().alemanha1: 3,

  LeagueOfficialNames().brasil1: 3,
  LeagueOfficialNames().brasil2: 3,
};

Map nTeamsClassified = {
  LeagueOfficialNames().inglaterra1: 4,
  LeagueOfficialNames().italia1: 4,
  LeagueOfficialNames().espanha1: 4,
  LeagueOfficialNames().franca1: 4,
  LeagueOfficialNames().alemanha1: 4,

  LeagueOfficialNames().ptHol: 4,
  LeagueOfficialNames().turquiaGrecia: 2,

  LeagueOfficialNames().ligaEuropa: 3,
  LeagueOfficialNames().lesteEuropeu: 3,

  LeagueOfficialNames().brasil1: 8,
  LeagueOfficialNames().argentina: 6,
  LeagueOfficialNames().sulamericano: 12,
  LeagueOfficialNames().colombia: 6,
};

bool leaguePlayInternationalCompetition(String name){
  bool playInternational = false;
  if(name == LeagueOfficialNames().inglaterra1 || name == LeagueOfficialNames().espanha1
      || name == LeagueOfficialNames().italia1 || name == LeagueOfficialNames().franca1
      || name == LeagueOfficialNames().alemanha1 || name == LeagueOfficialNames().ptHol
      || name == LeagueOfficialNames().turquiaGrecia
      || name == LeagueOfficialNames().lesteEuropeu || name == LeagueOfficialNames().ligaEuropa
      || name == LeagueOfficialNames().brasil1 || name == LeagueOfficialNames().argentina
      || name == LeagueOfficialNames().sulamericano || name == LeagueOfficialNames().colombia){
    playInternational = true;
  }
  return playInternational;
}
