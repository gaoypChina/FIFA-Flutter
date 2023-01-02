library globals;

//geral
int testInitRodada = 1;
int gLOBALMAXCLUBSINSIDELEAGUE = 20;

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
    semanaMundial = [semanasJogosInternacionais.first+13];
List<int> semanasJogosInternacionais = [for(var i=semanasJogosNacionais.last+1; i<=semanasJogosNacionais.last+15; i++) i];
List semanasGruposInternacionais = semanasJogosInternacionais.take(6).toList();
List<int> semanasMataMataInternacionais = semanaOitavas+semanaQuartas+semanaSemi+semanaFinal;
List<int> semanasJogosNacionais = [for(var i=1; i<=globalNMaxRodadasNacional; i++) i];
List semanasJogosCopas = [];
int globalUltimaSemana = semanasJogosInternacionais.last;

//HISTORIC
Map globalHistoricLeagueGoalsAll = {};
Map globalHistoricLeagueGoalsLastRodada = {};

Map globalHistoricInternationalGoalsAll = {};

Map globalHistoricLeagueClassification = {};
Map globalHistoricInternationalClassification = {};

Map globalHistoricMyClub = {};
Map globalHistoricBestPlayers = {};
Map globalHistoricTopScorers = {};
Map globalHistoricCoachResults = {};

Map<int,List> globalRankingClubs = {2000:[]};
//MATCH SIMULATION
double globalMatchVelocity = 100;
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
List globalJogadoresRedCard = [];
List globalJogadoresYellowCard = [];
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

//LEAGUES CONFIGURATION
Map globalLeagueRelegated = {};
Map globalLeagueClassified = {};
int globalNumberClubsTotal = 0;

///////////////////////////
//CHAMPIONS E LIBERTADORES
List globalInternational32ClubsID = [[],[]];//0:Champions, 1:Libertadores
Map globalInternationalMataMataClubsID = {};
Map globalInternationalMataMataGoals = {};


/////////////////////
//POSITIONS
List<String> globalAllPositions = ['GOL','ZAG','LE','LD','VOL','MC','MEI','ME','MD','PE','ATA','PD'];
Map positions442 = {
  'GOL': [0],
  'LE': [1],
  'ZAG': [2, 3],
  'LD': [4],
  'VOL': [5, 6],
  'MC': [5, 6, 7, 8],
  'ME': [7, 9],
  'MEI': [7, 8],
  'MD': [8, 10],
  'PE': [7, 9],
  'ATA': [9, 10],
  'PD': [8, 10],
};
Map positions433 = {
  //8 9 10
  //  7
  // 5 6
  //1 2 3 4
  'GOL': [0],
  'LE': [1],
  'ZAG': [2, 3],
  'LD': [4],
  'VOL': [5, 6],
  'MC': [5, 6, 7],
  'ME': [8],
  'MEI': [7],
  'MD': [10],
  'PE': [8],
  'ATA': [8,9,10],
  'PD': [10],
};
Map positions451 = {
  // 10
  //7 8 9
  // 5 6
  //1 2 3 4
  'GOL': [0],
  'LE': [1],
  'ZAG': [2, 3],
  'LD': [4],
  'VOL': [5, 6],
  'MC': [5, 6, 8],
  'ME': [7],
  'MEI': [7,8,9],
  'MD': [9],
  'PE': [7],
  'ATA': [10],
  'PD': [9],
};
Map positions343 = {
  //8 9 10
  //6 7
  //4 5
  //1 2 3
  'GOL': [0],
  'LE': [1],
  'ZAG': [1, 2, 3],
  'LD': [3],
  'VOL': [4, 5],
  'MC': [4, 5],
  'ME': [6, 8],
  'MEI': [6,7],
  'MD': [7,10],
  'PE': [6, 8],
  'ATA': [8,9,10],
  'PD': [7,10],
};
Map positions541 = {
  //  10
  // 8   9
  // 6   7
  //1 2 3 4 5
  'GOL': [0],
  'LE': [1],
  'ZAG': [2, 3, 4],
  'LD': [5],
  'VOL': [6, 7],
  'MC': [6, 7, 8, 9],
  'ME': [8],
  'MEI': [8,9],
  'MD': [9],
  'PE': [8],
  'ATA': [10],
  'PD': [9],
};