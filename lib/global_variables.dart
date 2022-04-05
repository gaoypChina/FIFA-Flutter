library globals;

//MEU
String globalMyClubName = 'Arsenal';
int globalMyClubID = 0;
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
int testInitRodada = 1;

int globalDificuldade = 2;
int anoInicial = 2022; //ano fixo para contas
int ano = 2022;
int semana = 1, rodada = 1;
late int posicao;
List<int> semanaOitavas = [22,23],
    semanaQuartas = [24,25],
    semanaSemi = [26],
    semanaFinal = [27],
    semanaMundial = [28];
List semanasJogosInternacionais = [for(var i=16; i<=25; i++) i];
List semanasGruposInternacionais = semanasJogosInternacionais.take(6).toList();
List semanasJogosNacionais = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
List semanasJogosCopas = [];
int globalUltimaSemana = semanasJogosInternacionais.last;

//HISTORIC
Map globalHistoricLeagueGoalsAll = {};
Map globalHistoricLeagueGoalsLastRodada = {};

Map globalHistoricInternationalGoalsAll = {}; //nao usado ainda

Map globalHistoricLeagueClassification = {};
Map globalHistoricInternationalClassification = {};

Map globalHistoricMyClub = {};

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
List globalJogadoresAge = [];
List globalJogadoresOverall = [];

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

///////////////////////////
//CHAMPIONS E LIBERTADORES
List globalInternational32ClubsID = [[],[]];//0:Champions, 1:Libertadores
Map globalInternationalMataMataClubsID = {};
Map globalInternationalMataMataGoals = {};

/////////////////////
//POSITIONS
Map positions442 = {
  'GOL': [0],
  'LE': [1],
  'ZAG': [2, 3],
  'LD': [4],
  'VOL': [5, 6],
  'MC': [5, 6, 7, 8],
  'MD': [8, 10],
  'MEI': [7, 8],
  'ME': [7, 9],
  'PE': [7, 9],
  'PD': [8, 10],
  'ATA': [9, 10],
};
Map positions433 = {
  'GOL': [0],
  'LE': [1],
  'ZAG': [2, 3],
  'LD': [4],
  'VOL': [5, 6],
  'MC': [5, 6, 7],
  'MD': [7, 10],
  'MEI': [7],
  'ME': [5, 8],
  'PE': [8],
  'PD': [10],
  'ATA': [8,9,10],
};
