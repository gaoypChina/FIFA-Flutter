library globals;

//geral
int testInitRodada = 1;
int gLOBALMAXCLUBSINLEAGUE = 20;
bool globalShowRealLogos = true;

//MEU
int globalMyClubID = -1;
int globalMyExpectativa = 0;
String globalMyEsquemaTatico = '4-4-2';
double globalMyMoney = 0;
List globalMyLeagueLastResults = [];
List globalMyJogadores = [];

String globalCoachName = 'Eu';
int globalCoachPoints = 0;
bool alreadyChangedClubThisSeason = false;
bool globalGoalForaDeCasa = false;

//SAVE
const globalMaxSavesPermitted = 2;
const int globalMaxPossibleSaves = 10;
int globalSaveNumber = 0;

bool globalHasInternet = true;
bool globalLeagueIdaVolta = false;
bool globalHasSoundEffects = false;
bool globalHasCards = true;
bool globalHasInjuries = true;
bool globalAllEqualOverall = false;
bool globalRandomPlayersOverall = false;
bool globalSeeProbabilities = true;
bool globalRandomizePlayers = false;
double globalInitialMoney = 0;

double pi = 3.14159265359;
int globalDificuldade = 2; //2-> médio
int anoInicial = 2024; //ano fixo para contas
int ano = 2023;
int semana = 1, rodada = 1;
int globalNMaxRodadasNacional = globalLeagueIdaVolta ? 38 : 19;
late int posicao;
List<int> semanaOitavas = [semanasJogosInternacionais[6],semanasJogosInternacionais[7]],
    semanaQuartas = [semanasJogosInternacionais[8],semanasJogosInternacionais[9]],
    semanaSemi = [semanasJogosInternacionais[10],semanasJogosInternacionais[11]],
    semanaFinal = [semanasJogosInternacionais[12]],
    semanaMundial = [semanasJogosCopas.length-2+semanasJogosInternacionais.length+semanasJogosNacionais.length+1];

//List<int> semanasJogosInternacionais = [1,2,3,4,5,6, 7,8, 9,10, 11,12, 13];
List<int> semanasJogosInternacionais = [8,10,12, 18,20,22, 31,32,  37,38, 40,41, 44];

List semanasGruposInternacionais = semanasJogosInternacionais.take(6).toList();
List<int> semanasMataMataInternacionais = semanaOitavas+semanaQuartas+semanaSemi+semanaFinal;

//List<int> semanasJogosNacionais = [14,15,16,17,18, 19,20,21,22,23, 24,26,29,30,33,  36,39,42,43];
List<int> semanasJogosNacionais = [5,6,7,9,11, 13,15,17,19,21, 23,26,29,30,33,  36,39,42,43];
List semanasJogosCopas = [-1,0, 1,2, 3,4, 14,16, 24,25, 27,28, 34,35]; //-1,0,...,12 FASE128 NAO EXISTE
int globalUltimaSemana = semanaMundial.last+1;

Map<int,String> weekRealDays = {
  1: "04/08",  2: "07/08",  3: "11/08",
  4: "14/08",  5: "18/08",  6: "21/08",
  7: "24/08",  8: "28/08",  9: "31/08",
  10: "04/09",  11: "07/09",  12: "11/09",
  13: "14/09",  14: "18/09",  15: "21/09",
  16: "25/09",  17: "28/09",  18: "02/10",
  19: "05/10",  20: "09/10",  21: "12/10",
  22: "16/10",  23: "19/10",  24: "23/10",
  25: "26/10",  26: "30/10",  27: "02/11",
  28: "06/11",  29: "09/11",  30: "13/11",
  31: "16/11",  32: "20/11",  33: "23/11",
  34: "27/11",  35: "30/11",  36: "04/12",
  37: "07/12",  38: "11/12",  39: "15/12",
  40: "18/12",  41: "21/12",
  42: "07/01",  43: "10/01",  44: "14/01",
  45: "17/01",  46: "21/01",  47: "24/01",
  48: "28/01",  49: "31/01",
};

//HISTORIC
Map globalHistoricLeagueGoalsAll = {};
Map globalHistoricLeagueGoalsLastRodada = {};

Map globalHistoricInternationalGoalsAll = {};

Map globalHistoricLeagueClassification = {};
Map globalHistoricInternationalClassification = {};
Map globalHistoricClassification = {'Mundial':{}};

Map globalHistoricMyClub = {};
Map globalHistoricBestPlayers = {};
Map globalHistoricTopScorers = {};
Map globalHistoricCoachResults = {};

Map<String,Map<int,Map<int,Map<String,dynamic>>>> globalHistoricMyTransfers = {};
List globalBalance = [];

Map<int,List> globalRankingClubs = {2000:[]}; //Agiliza a organização do ranking de clubes
//MATCH SIMULATION
double globalMatchVelocity = 250;
int globalMatchSubstitutionsLeft = 3;
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
List globalJogadoresMatchGrade = [];

// Negotiation
Map globalNegotiation = {};

//Jogadores
//ALL Players Data
int globalMaxPlayersPermitted = 20000;
int globalMaxClubsPermitted = 500;

List globalJogadoresIndex = [];
List globalJogadoresName = [];
List globalJogadoresClubIndex = [];
List globalJogadoresPosition = [];
List globalJogadoresAge = [];
List globalJogadoresOverall = [];
List globalJogadoresNationality = [];
List globalJogadoresImageUrl = [];

List globalJogadoresMoral = [];
List globalJogadoresHealth = [];
List globalJogadoresCarrerMatchs = List.filled(globalMaxPlayersPermitted, 0);
List globalJogadoresCarrerGoals = List.filled(globalMaxPlayersPermitted, 0);
List globalJogadoresCarrerAssists = List.filled(globalMaxPlayersPermitted, 0);
List globalJogadoresCarrerCleanSheets = List.filled(globalMaxPlayersPermitted, 0);
List globalJogadoresCarrerGolsSofridos = List.filled(globalMaxPlayersPermitted, 0);
List globalJogadoresYellowCard = [];
List globalJogadoresRedCard = [];
List globalJogadoresGrades = [];
List globalJogadoresInjury = [];
List globalJogadoresMoralNames = ['Excelent','Good','Average','Bad','Terrible'];

/////////////////////
//CLUBS
List<int> globalClubsLeaguePoints = [];
List<int> globalClubsLeagueGM = [];
List<int> globalClubsLeagueGS = [];
List<int> globalClubsInternationalPoints = [];
List<int> globalClubsInternationalGM = [];
List<int> globalClubsInternationalGS = [];

Map<String,List<int>> globalHistoricPositionsThisYear = {}; //{'Palmeiras': [1,4,6,4,3,4,4], 'Santos': ...};

//LEAGUES CONFIGURATION
Map globalLeagueRelegated = {};
Map globalLeagueClassified = {};
int globalNumberClubsTotal = 0;

///////////////////////////
//CHAMPIONS E LIBERTADORES
Map globalInternationalMataMata = {};

//Clubs IDs: Champions, Libertadores, Europa League e SulAmericana
Map globalInternational = {};



///////////////////////////
//INTERNACIONAL - NOVO FORMATO
Map<String, List<int>> globalLeaguePlayers = {};
Map<String, List<int>> globalInternationalPlayers = {};

//COPA
Map<String, Map<String, dynamic>> globalCup = {};
Map<String, List<int>> globalCupPlayers = {};

/////////////////////
//POSITIONS
List<String> globalAllPositions = ['GOL','ZAG','LE','LD','VOL','MC','MEI','ME','MD','PE','ATA','PD'];
Map positions = {
  '4-4-2': {
    'PE': [7, 9], 'ATA': [9, 10], 'PD': [8, 10],
    'ME': [7, 9], 'MEI': [7, 8], 'MD': [8, 10],
    'VOL': [5, 6], 'MC': [5, 6, 7, 8],
    'LE': [1], 'ZAG': [2, 3], 'LD': [4],
    'GOL': [0],
  },
  '4-3-3': {
    //8 9 10
    //  7
    // 5 6
    //1 2 3 4
    'PE': [8],'ATA': [8, 9, 10],'PD': [10],
    'ME': [8],'MEI': [7],'MD': [10],
    'VOL': [5, 6],'MC': [5, 6, 7],
    'LE': [1],'ZAG': [2, 3],'LD': [4],
    'GOL': [0],
  },
  '4-5-1': {
    // 10
    //7 8 9
    // 5 6
    //1 2 3 4
    'PE': [7],'ATA': [10],'PD': [9],
    'ME': [7],'MEI': [7,8,9],'MD': [9],
    'VOL': [5, 6],'MC': [5, 6, 8],
    'LE': [1],'ZAG': [2, 3],'LD': [4],
    'GOL': [0],
  },
  '3-4-3': {
    //8 9 10
    //6 7
    //4 5
    //1 2 3
    'PE': [6,8],'ATA': [8,9,10],'PD': [7,10],
    'ME': [6,8],'MEI': [6,7],'MD': [7,10],
    'VOL': [4,5],'MC': [4,5],
    'LE': [1],'ZAG': [1,2, 3],'LD': [3],
    'GOL': [0],
  },
  '5-4-1': {
    //  10
    // 8   9
    // 6   7
    //1 2 3 4 5
    'PE': [8],'ATA': [10],'PD': [9],
    'ME': [8],'MEI': [8,9],'MD': [9],
    'VOL': [6,7],'MC': [6,7,8,9],
    'LE': [1],'ZAG': [2,3,4],'LD': [5],
    'GOL': [0],
  },
};
