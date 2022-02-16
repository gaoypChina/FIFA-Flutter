library globals;

//MEU
String globalMyClubName = 'Arsenal';
int globalMyClubID = 0;
int globalMyLeagueID = 0;
int globalMyPosicaoChave = 0;
String globalMyEsquemaTatico = '4-4-2';
double globalMyMoney = 0;
List globalMyLeagueLastResults = [];
List globalMyJogadores = [];

bool alreadyChangedClubThisSeason = false;

//SAVE
int globalSaveNumber = 0;
Map globalSaveData = {};

//geral
int globalDificuldade = 2;
int anoInicial = 2022; //ano fixo para contas
int ano = 2022;
int semana = 1, rodada = 1;
late int posicao;
int semanaOitavas = 24,
    semanaQuartas = 25,
    semanaSemi = 26,
    semanaFinal = 27,
    semanaMundial = 28;
List semanasGruposInternacionais = [20, 21, 22, 23, 24, 25];
List semanasJogosInternacionais = [20,21,22,23,24,25,26,27,28,29,30];
List semanasJogosNacionais = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
List semanasJogosCopas = [19];
int ultimasemana = 30;

//HISTORIC
Map globalHistoricLeagueGoalsAll = {};
Map globalHistoricLeagueGoalsLastRodada = {};

//MATCH SIMULATION
double matchVelocity = 100;
List globalMatchGoalScorerIDMy = [];
List globalMatchGoalScorerIDAdv = [];
List globalMatchGoalsMinutesMy = [];
List globalMatchGoalsMinutesAdv = [];
List globalJogadoresMatchGoals = [];
List globalJogadoresMatchAssists = [];
List globalJogadoresMatchRedCards = [];
List globalJogadoresMatchYellowCards = [];
List globalJogadoresMatchInjury = [];
List globalJogadoresMatchHealth = [];



//Jogadores
//ALL Players Data
List globalJogadoresIndex = [];
List globalJogadoresName = [];
List globalJogadoresClubIndex = [];
List globalJogadoresPosition = [];
List globalJogadoresNationality = [];
List globalJogadoresAge = [];
List globalJogadoresOverall = [];
List clubsPlayers = [];

List globalJogadoresHealth = [];
List globalJogadoresTotalMatchs = [];
List globalJogadoresTotalGoals = [];
List globalJogadoresTotalAssists = [];
List globalJogadoresLeagueMatchs = [];
List globalJogadoresLeagueGoals = [];
List globalJogadoresLeagueAssists = [];
List globalJogadoresInternationalMatchs = [];
List globalJogadoresInternationalGoals = [];
List globalJogadoresInternationalAssists = [];
List globalJogadoresRedCard = [];
List globalJogadoresYellowCard = [];
List globalJogadoresInjury = [];

/////////////////////
//CLUBS
List globalClubsLeaguePoints = [];
List globalClubsLeagueGM = [];
List globalClubsLeagueGS = [];
List globalClubsInternationalPoints = [];
List globalClubsInternationalGM = [];
List globalClubsInternationalGS = [];
List globalClubsMataMataGM = [];
List globalClubsMataMataGS = [];

Map positions442 = {
  'GOL': [0],
  'LD': [1],
  'ZAG': [2, 3],
  'LE': [4],
  'VOL': [5, 6],
  'MC': [5, 6, 7, 8],
  'MD': [7, 8],
  'MEI': [7, 8],
  'ME': [7, 8],
  'PE': [7, 9],
  'PD': [8, 10],
  'ATA': [9, 10],
};
Map positions433 = {
  'GOL': [0],
  'LD': [1],
  'ZAG': [2, 3],
  'LE': [4],
  'VOL': [5, 6],
  'MC': [5, 6, 7],
  'MD': [7, 8],
  'MEI': [7],
  'ME': [7, 10],
  'PE': [8,9],
  'PD': [10,9],
  'ATA': [8,9,10],
};
///////////////////////////
//CHAMPIONS E LIBERTADORES
List globalInternational32ClubsID =[[],[]];//0:Champions, 1:Libertadores


///////////////////////////
//LEAGUES
Map globalLeagueClassification = {};

List leagueNames = [
  'Premier League','Championship','Serie A TIM','Serie B TIM',
  'La Liga','La Liga 2','Ligue 1','Bundesliga','Bundesliga 2',
  'Liga Europeia','Leste Europeu','Brasileirão','Brasileirão - Série B',
  'Brasileirão - Série C','Paulistão','Campeonato Argentino','Sul-Americano',
  'Liga Colombia MX','MLS','Liga Ásia','Liga Oriente Médio',
  'Liga África','Outros'
];
List leaguesListRealIndex = [
  1,2,5,7,  9,11,20,21,  50,51,60,61,  62,70
];
List leaguesListNClubs = [
  16,16,16,16,  16,16,16,16,16,  16,16,16,16,  16,16,16,16, 16,16,16,16, 16,6
];
Map leaguesIndexFromName = {
  'Premier League': 1,
  'Championship': 2,
  'Serie A TIM': 5,
  'Serie B TIM': 6,
  'La Liga': 7,
  'La Liga 2': 8,
  'Ligue 1': 9,
  'Ligue 2': 10,
  'Bundesliga': 11,
  'Bundesliga 2': 12,
  'Liga Europeia': 20,
  'Leste Europeu': 21,
  'Brasileirão': 50,
  'Brasileirão - Série B': 51,
  'Brasileirão - Série C': 52,
  'Paulistão': 53,
  'Campeonato Argentino': 60,
  'Sul-Americano': 61,
  'Liga Colombia MX': 62,
  'MLS': 70,
  'Liga Ásia': 80,
  'Liga Oriente Médio': 81,
  'Liga África': 85,
  'Outros': 90,
};

Map clubsMapPremier = {
  0: 'Arsenal',1: 'Aston Villa',2: 'Chelsea',3: 'Crystal Palace',
  4: 'Everton',5: 'Leeds United',6: 'Leicester',7: 'Liverpool',
  8: 'Manchester City',9: 'Manchester United',10: 'Newcastle',11: 'Tottenham',
  12: 'Southampton',13: 'West Bromwich',14: 'West Ham',15: 'Wolves',
};
Map clubsMapChampionship = {
  0: 'Birmigham',1: 'Blackburn',2: 'Bournemouth',3: 'Burnley',
  4: 'Brighton',5: 'Derby Count',6: 'Fulham',7: 'Middlesbrough',
  8: 'Norwich',9: 'Nottingham Forest',10: 'QPR',11: 'Reading',
  12: 'Sheffield United',13: 'Stoke City',14: 'Swansea',15: 'Watford',
};
Map clubsMapSerieATim = {
  0: 'Atalanta',1: 'Bologna',2: 'Cagliari',3: 'Fiorentina',
  4: 'Genoa',5: 'Inter',6: 'Juventus',7: 'Milan',
  8: 'Lazio',9: 'Napoli',10: 'Parma',11: 'Roma',
  12: 'Sampdoria',13: 'Sassuolo',14: 'Torino',15: 'Udinese',
};
Map clubsMapLaLiga = {
  0: 'Athletic Bilbao',1: 'Atlético Madrid',2: 'Barcelona',3: 'Celta de Vigo',
  4: 'Espanyol',5: 'Getafe',6: 'La Coruna',7: 'Levante',
  8: 'Osasuna',9: 'Real Betis',10: 'Real Madrid',11: 'Real Sociedad',
  12: 'Sevilla',13: 'Valencia',14: 'Valladolid',15: 'Villareal',
};

Map clubNameMap(String league){
  Map teams = {};
  if(league == 'Premier League'){    teams = clubsMapPremier;  }
  if(league == 'Championship'){    teams = clubsMapChampionship;  }
  if(league == 'Serie A TIM'){    teams = clubsMapSerieATim; }
  if(league == 'Serie B TIM'){    teams = {};    }
  if(league == 'La Liga'){    teams = clubsMapLaLiga;    }
  if(league == 'Bundesliga'){
    teams = {
      0: 'Moenchengladbach',1: 'Borussia Dortmund',2: 'Bayern Munique',3: 'Bayer Leverkusen',
      4: 'Colonia',5: 'Eintracht Frankfurt',6: 'Freiburg',7: 'Hamburgo',
      8: 'Augsburg',9: 'Hertha Berlim',10: 'Hoffenheim',11: 'RB Leipzig',
      12: 'Schalke-04',13: 'Stuttgart',14: 'Werder Bremen',15: 'Wolfsburg',
    };
  }
  if(league == 'Ligue 1'){
    teams = {
      0: 'Bordeaux',1: 'Lille',2: 'Lyon',3: 'Monaco',
      4: 'Montpellier',5: 'Nantes',6: 'Nice',7: 'Olympique Marselha',
      8: 'PSG',9: 'Reims',10: 'Rennes',11: 'Saint-Etienne',
      12: 'Metz',13: 'Anderlecht',14: 'Brugge',15: 'Standard Liege',
    };
  }
  if(league == 'Liga Europeia'){
    teams = {
      0: 'Benfica',1: 'Porto',2: 'Sporting',3: 'Braga',
      4: 'Vitória Guimarães',5: 'Ajax',6: 'Feyenoord',7: 'PSV',
      8: 'Celtic',9: 'Glasgow Rangers',10: 'Rosemborg',11: 'Malmo',
      12: 'Copenhague',13: 'RB Salzburg',14: 'Rapid Viena',15: 'Basel',
    };
  }
  if(league == 'Leste Europeu'){
    teams = {
      0: 'Zenit',1: 'CSKA',2: 'Krasnodar',3: 'Spartak Moscou',
      4: 'Galatasaray',5: 'Fenerbahce',6: 'Besiktas',7: 'Olympiakos',
      8: 'Estrela Vermelha',9: 'Partizan',10: 'Ludogorets',11: 'Dinamo Zagreb',
      12: 'Shaktar Donetsk',13: 'Dinamo Kiev',14: 'Sparta Praga',15: 'APOEL',
    };
  }
  if(league == 'Brasileirão'){
    teams = {
      0: 'Palmeiras',1: 'Atlético-GO',2: 'Atlético-MG',3: 'Atlético-PR',
      4: 'Bahia',5: 'Bragantino',6: 'Ceará',7: 'Corinthians',
      8: 'Flamengo',9: 'Fluminense',10: 'Fortaleza',11: 'Grêmio',
      12: 'Internacional',13: 'Santos',14: 'São Paulo',15: 'Sport',
    };
  }
  if(league == 'Brasileirão - Série B'){
    teams = {
      0: 'América-MG',1: 'Botafogo',2: 'Chapecoense',3: 'Coritiba',
      4: 'Cuiabá',5: 'Criciúma',6: 'Cruzeiro',7: 'Figueirense',
      8: 'Goiás',9: 'Guarani',10: 'Juventude',11: 'Naútico',
      12: 'Paraná',13: 'Ponte Preta',14: 'Vasco',15: 'Vitória',
    };
  }
  if(league == 'Brasileirão - Série C'){
    teams = {
      0: 'Avaí',1: 'Brasil Pelotas',2: 'Brusque',3: 'CRB',
      4: 'CSA',5: 'Ituano',6: 'Londrina',7: 'Manaus',
      8: 'Novorizontino',9: 'Operário-PR',10: 'Paysandu',11: 'Portuguesa',
      12: 'Remo',13: 'Sampaio Corrêa',14: 'Santa Cruz',15: 'Vila Nova',
    };
  }
  if(league == 'Campeonato Argentino'){
    teams = {
      0: 'Argentino Juniors',1: 'Arsenal Sarandí',2: 'Banfield',3: 'Boca Juniors',
      4: 'Colón',5: 'Defensa y Justicia',6: 'Estudiantes',7: 'Independiente',
      8: 'Lanús',9: 'Newell\'s Old Boys',10: 'Racing',11: 'River Plate',
      12: 'Rosario Central',13: 'San Lorenzo',14: 'Talleres',15: 'Vélez Sarsfield',
    };
  }
  if(league == 'Sul-Americano'){
    teams = {
      0: 'Peñarol',1: 'Nacional',2: 'Olimpia',3: 'Cerro Porteño',
      4: 'Libertad',5: 'Colo-Colo',6: 'LaU',7: 'Univ. Católica',
      8: 'Bolívar',9: 'I. Del Valle',10: 'Sporting Cristal',11: 'Cienciano',
      12: 'Barcelona-EQU',13: 'Emelec',14: 'LDU',15: 'Caracas',
    };
  }
  if(league == 'Liga Colombia MX'){
    teams = {
      0: 'América de Cali',1: 'Atlético Nacional',2: 'Deportivo Cali',3: 'Junior',
      4: 'I. Medellín',5: 'Once Caldas',6: 'Millonarios',7: 'Santa Fé',
      8: 'América-MEX',9: 'Chivas Guadalajara',10: 'Cruz Azul',11: 'Monterrey',
      12: 'Pachuca',13: 'Pumas',14: 'Tigres',15: 'Toluca',
    };
  }
  if(league == 'MLS'){
    teams = {
      0: 'Atlanta United',1: 'Columbus Crew',2: 'DC United',3: 'FC Dallas',
      4: 'Inter Miami',5: 'Los Angeles FC',6: 'LA Galaxy',7: 'Minnesota United',
      8: 'NE Revolution',9: 'NY City',10: 'NY Red Bulls',11: 'Orlando City',
      12: 'Portland Timbers',13: 'Seattle Sounders',14: 'Toronto FC',15: 'Vancouver Whitecaps',
    };
  }
  if(league == 'Liga Ásia'){
    teams = {
      0: 'Ghuangzhou Evergrande',1: 'Beijing Guoan',2: 'Shandong Luneng',3: 'Shanghai SIPG',
      4: 'Kashima Antlers',5: 'Urawa Red Diamonds',6: 'Vissel Kobe',7: 'Kawasaki Frontale',
      8: 'FC Seoul',9: 'Jeonbuk Hyundai',10: 'Al Nassr',11: 'Al Ain-EAU',
      12: 'Al Sadd-QAT',13: 'Al Duhail-QAT',14: 'Al Ahli',15: 'Al Hilal',
    };
  }
  if(league == 'Liga África'){
    teams = {
      0: 'Al Ahly',1: 'Espérance',2: 'Kaiser Chiefs',3: 'Mazembe',
      4: 'Mamelodi Sundowns',5: 'Orlando Pirates',6: 'Raja Casablanca',7: 'Simba',
      8: 'Wydad',9: 'Zamalek',
    };
  }
  if(league == 'Outros'){
    teams = {
      0: 'Avaí',1: 'Paysandu',2: 'Santa Cruz',3: 'Hull City',
      4: 'Huracán',5: 'Alianza Lima',
    };
  }
  return teams;
}


/////////////
//default teams
List defaultChampionsLeagueClubs = [
  'Chelsea','Liverpool', 'Manchester City','Manchester United','Juventus','Inter','Milan','Atalanta',
'Real Madrid','Barcelona','Atlético Madrid','Sevilla','Lille','PSG','Lyon','Olympique Marselha',
'Borussia Dortmund','Bayern Munique','Bayer Leverkusen','RB Leipzig',
'Benfica','Porto','Sporting','Ajax','Malmo','Basel',
'Zenit','Galatasaray','Besiktas','Olympiakos','Shaktar Donetsk','Dinamo Zagreb'];
List defaultLibertadoresClubs = [
  'Palmeiras','Flamengo', 'Atlético-MG','Corinthians','Bragantino','Fortaleza','Atlético-PR','América-MG',
  'Boca Juniors','River Plate','Talleres','Defensa y Justicia','Lanús','Independiente','Olimpia','Cerro Porteño',
  'Peñarol','Nacional','Caracas','LDU',
  'Colo-Colo','Sporting Cristal','Univ. Católica','I. Del Valle','Barcelona-EQU','Bolívar',
  'Atlético Nacional','Junior','Millonarios','Monterrey','América-MEX','Tigres'];
///////////////////////////
// CLUBS
List clubsName = [
  "Palmeiras",
  "Atlético-GO",
  "Atlético-MG",
  "Atlético-PR",
  "Bahia",
  "Bragantino",
  "Ceará",
  "Corinthians",
  "Flamengo",
  "Fluminense",
  "Fortaleza",
  "Grêmio",
  "Internacional",
  "Santos",
  "São Paulo",
  "Sport",
  "Arsenal",
  "Aston Villa",
  "Chelsea",
  "Crystal Palace",
  "Everton",
  "Leeds United",
  "Leicester",
  "Liverpool",
  "Manchester City",
  "Manchester United",
  "Newcastle",
  "Tottenham",
  "Southampton",
  "West Bromwich",
  "West Ham",
  "Wolves",
  "Atalanta",
  "Bologna",
  "Cagliari",
  "Fiorentina",
  "Genoa",
  "Inter",
  "Juventus",
  "Milan",
  "Lazio",
  "Napoli",
  "Parma",
  "Roma",
  "Sampdoria",
  "Sassuolo",
  "Torino",
  "Udinese",
  "Athletic Bilbao",
  "Atlético Madrid",
  "Barcelona",
  "Celta de Vigo",
  "Espanyol",
  "Getafe",
  "La Coruna",
  "Levante",
  "Osasuna",
  "Real Betis",
  "Real Madrid",
  "Real Sociedad",
  "Sevilla",
  "Valencia",
  "Valladolid",
  "Villareal",
  "Moenchengladbach",
  "Borussia Dortmund",
  "Bayern Munique",
  "Bayer Leverkusen",
  "Colonia",
  "Eintracht Frankfurt",
  "Freiburg",
  "Hamburgo",
  "Augsburg",
  "Hertha Berlim",
  "Hoffenheim",
  "RB Leipzig",
  "Schalke-04",
  "Stuttgart",
  "Werder Bremen",
  "Wolfsburg",
  "Bordeaux",
  "Lille",
  "Lyon",
  "Monaco",
  "Montpellier",
  "Nantes",
  "Nice",
  "Olympique Marselha",
  "PSG",
  "Reims",
  "Rennes",
  "Saint-Etienne",
  "Metz",
  "Anderlecht",
  "Brugge",
  "Standard Liege",
  "Benfica",
  "Porto",
  "Sporting",
  "Braga",
  "Vitória Guimarães",
  "Ajax",
  "Feyenoord",
  "PSV",
  "Celtic",
  "Glasgow Rangers",
  "Rosemborg",
  "Malmo",
  "Copenhague",
  "RB Salzburg",
  "Rapid Viena",
  "Basel",
  "Zenit",
  "CSKA",
  "Krasnodar",
  "Spartak Moscou",
  "Galatasaray",
  "Fenerbahce",
  "Besiktas",
  "Olympiakos",
  "Estrela Vermelha",
  "Partizan",
  "Ludogorets",
  "Dinamo Zagreb",
  "Shaktar Donetsk",
  "Dinamo Kiev",
  "Sparta Praga",
  "APOEL",
  "Birmigham",
  "Blackburn",
  "Bournemouth",
  "Burnley",
  "Brighton",
  "Derby Count",
  "Fulham",
  "Middlesbrough",
  "Norwich",
  "Nottingham Forest",
  "QPR",
  "Reading",
  "Sheffield United",
  "Stoke City",
  "Swansea",
  "Watford",
  "América-MG",
  "Botafogo",
  "Chapecoense",
  "Coritiba",
  "Cuiabá",
  "Criciúma",
  "Cruzeiro",
  "Figueirense",
  "Goiás",
  "Guarani",
  "Juventude",
  "Naútico",
  "Paraná",
  "Ponte Preta",
  "Vasco",
  "Vitória",
  "Argentino Juniors",
  "Arsenal Sarandí",
  "Banfield",
  "Boca Juniors",
  "Colón",
  "Defensa y Justicia",
  "Estudiantes",
  "Independiente",
  "Lanús",
  "Newell's Old Boys",
  "Racing",
  "River Plate",
  "Rosario Central",
  "San Lorenzo",
  "Talleres",
  "Vélez Sarsfield",
  "Peñarol",
  "Nacional",
  "Olimpia",
  "Cerro Porteño",
  "Libertad",
  "Colo-Colo",
  "LaU",
  "Univ. Católica",
  "Bolívar",
  "I. Del Valle",
  "Sporting Cristal",
  "Cienciano",
  "Barcelona-EQU",
  "Emelec",
  "LDU",
  "Caracas",
  "América de Cali",
  "Atlético Nacional",
  "Deportivo Cali",
  "Junior",
  "I. Medellín",
  "Once Caldas",
  "Millonarios",
  "Santa Fé",
  "América-MEX",
  "Chivas Guadalajara",
  "Cruz Azul",
  "Monterrey",
  "Pachuca",
  "Pumas",
  "Tigres",
  "Toluca",
  "Atlanta United",
  "Columbus Crew",
  "DC United",
  "FC Dallas",
  "Inter Miami",
  "Los Angeles FC",
  "LA Galaxy",
  "Minnesota United",
  "NE Revolution",
  "NY City",
  "NY Red Bulls",
  "Orlando City",
  "Portland Timbers",
  "Seattle Sounders",
  "Toronto FC",
  "Vancouver Whitecaps",
  "Ghuangzhou Evergrande",
  "Beijing Guoan",
  "Shandong Luneng",
  "Shanghai SIPG",
  "Kashima Antlers",
  "Urawa Red Diamonds",
  "Vissel Kobe",
  "Kawasaki Frontale",
  "FC Seoul",
  "Jeonbuk Hyundai",
  "Al Nassr",
  "Al Ain-EAU",
  "Al Sadd-QAT",
  "Al Duhail-QAT",
  "Al Ahli",
  "Al Hilal",


  'Avaí',
  'Paysandu',
  'Santa Cruz',
  'Hull City',
  'Huracán',
  'Alianza Lima',
];