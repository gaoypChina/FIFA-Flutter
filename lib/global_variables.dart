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

int globalDificuldade = 2; //2-> médio
int anoInicial = 2023; //ano fixo para contas
int ano = 2023;
int semana = 1, rodada = 1;
int globalNMaxRodadasNacional = globalLeagueIdaVolta ? 38 : 19;
late int posicao;
List<int> semanaOitavas = [semanasJogosInternacionais.first+6,semanasJogosInternacionais.first+7],
    semanaQuartas = [semanasJogosInternacionais.first+8,semanasJogosInternacionais.first+9],
    semanaSemi = [semanasJogosInternacionais.first+10,semanasJogosInternacionais.first+11],
    semanaFinal = [semanasJogosInternacionais.first+12],
    semanaMundial = [semanasJogosInternacionais.length+semanasJogosNacionais.length+1];
//List<int> semanasJogosInternacionais = [for(var i=semanasJogosNacionais.last+1; i<=semanasJogosNacionais.last+13; i++) i];
List<int> semanasJogosInternacionais = [for(var i=1; i<=13; i++) i];

List semanasGruposInternacionais = semanasJogosInternacionais.take(6).toList();
List<int> semanasMataMataInternacionais = semanaOitavas+semanaQuartas+semanaSemi+semanaFinal;

//List<int> semanasJogosNacionais = [for(var i=1; i<=globalNMaxRodadasNacional; i++) i];
List<int> semanasJogosNacionais = [for(var i=semanasJogosInternacionais.last+1; i<=semanasJogosInternacionais.last+globalNMaxRodadasNacional; i++) i];

List semanasJogosCopas = [];
int globalUltimaSemana = semanaMundial.last+1;

Map<int,String> weekRealDays = {
  1: "04/08/2022",  2: "07/08/2022",  3: "11/08/2022",
  4: "14/08/2022",  5: "18/08/2022",  6: "21/08/2022",
  7: "24/08/2022",  8: "28/08/2022",  9: "31/08/2022",
  10: "04/09/2022",  11: "07/09/2022",  12: "11/09/2022",
  13: "14/09/2022",  14: "18/09/2022",  15: "21/09/2022",
  16: "25/09/2022",  17: "28/09/2022",  18: "02/10/2022",
  19: "05/10/2022",  20: "09/10/2022",  21: "12/10/2022",
  22: "16/10/2022",  23: "19/10/2022",  24: "23/10/2022",
  25: "26/10/2022",  26: "30/10/2022",  27: "02/11/2022",
  28: "06/11/2022",  29: "09/11/2022",  30: "13/11/2022",
  31: "16/11/2022",  32: "20/11/2022",  33: "23/11/2022",
  34: "27/11/2022",  35: "30/11/2022",  36: "04/12/2022",
  37: "07/12/2022",  38: "11/12/2022",  39: "15/12/2022",
  40: "18/12/2022",  41: "21/12/2022",  42: "04/01/2023",
  43: "08/01/2022",  44: "11/01/2022",  45: "15/01/2023",
  46: "18/01/2022",  47: "22/01/2022",  48: "25/01/2023",
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
List globalJogadoresLeagueMatchs = [];
List globalJogadoresLeagueGoals = [];
List globalJogadoresLeagueAssists = [];
List globalJogadoresInternationalMatchs = [];
List globalJogadoresInternationalGoals = [];
List globalJogadoresInternationalAssists = [];
List globalJogadoresYellowCard = [];
List globalJogadoresRedCard = [];
List globalJogadoresGrades = [];
List globalJogadoresInjury = [];
List globalJogadoresMoralNames = ['Excelent','Good','Average','Bad','Terrible'];

/////////////////////
//CLUBS
List globalClubsLeaguePoints = [];
List globalClubsLeagueGM = [];
List globalClubsLeagueGS = [];
List globalClubsInternationalPoints = [];
List globalClubsInternationalGM = [];
List globalClubsInternationalGS = [];

Map<String,List<int>> globalHistoricPositionsThisYear = {}; //{'Palmeiras': [1,4,6,4,3,4,4], 'Santos': ...};

//LEAGUES CONFIGURATION
Map globalLeagueRelegated = {};
Map globalLeagueClassified = {};
int globalNumberClubsTotal = 0;

///////////////////////////
//CHAMPIONS E LIBERTADORES
Map globalInternationalMataMataClubsID = {};
Map globalInternationalMataMataGoals = {};

//Clubs IDs: Champions, Libertadores, Europa League e SulAmericana
Map globalInternational = {};

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