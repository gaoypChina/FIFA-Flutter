library globals;

//geral
int testInitRodada = 1;


//MEU
String globalMyClubName = '';
int globalMyClubID = 0;
int globalMyPosicaoChave = 0;
int globalMyExpectativa = 0;
String globalMyEsquemaTatico = '4-4-2';
double globalMyMoney = 0;
List globalMyLeagueLastResults = [];
List globalMyJogadores = [];

String globalCoachName = 'Eu';
int globalCoachPoints = 0;
bool alreadyChangedClubThisSeason = false;

//SAVE
const globalMaxSavesPermitted = 1;
int globalSaveNumber = 0;
Map globalSaveData = {}; //DATABASE PLAYERS DATA

bool globalHasInternet = true;
bool globalLeagueIdaVolta = false;
bool globalHasSoundEffects = false;
bool globalHasCards = true;
bool globalHasInjuries = true;
bool globalAllEqualOverall = false;
bool globalSeeProbabilities = true;
double globalInitialMoney = 0;

int globalDificuldade = 2; //2-> médio
int anoInicial = 2022; //ano fixo para contas
int ano = 2022;
int semana = 1, rodada = 1;
int globalNMaxRodadasNacional = globalLeagueIdaVolta ? 38 : 19;
late int posicao;
List<int> semanaOitavas = [semanasJogosInternacionais.first+6,semanasJogosInternacionais.first+7],
    semanaQuartas = [semanasJogosInternacionais.first+8,semanasJogosInternacionais.first+9],
    semanaSemi = [semanasJogosInternacionais.first+10,semanasJogosInternacionais.first+11],
    semanaFinal = [semanasJogosInternacionais.first+12],
    semanaMundial = [semanasJogosInternacionais.last];
List<int> semanasJogosInternacionais = [for(var i=semanasJogosNacionais.last+1; i<=semanasJogosNacionais.last+14; i++) i];
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
int globalMaxPlayersPermitted = 14000;
int globalMaxClubsPermitted = 500;

List globalJogadoresIndex = [];
List globalJogadoresName = [];
List globalJogadoresClubIndex = [];
List globalJogadoresPosition = [];
List globalJogadoresAge = [];
List globalJogadoresOverall = [];
List globalJogadoresNationality = [];
List globalJogadoresImageUrl = [];

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
  'GOL': [0],
  'LE': [1],
  'ZAG': [2, 3],
  'LD': [4],
  'VOL': [5, 6],
  'MC': [5, 6, 7],
  'ME': [5, 8],
  'MEI': [7],
  'MD': [7, 10],
  'PE': [8],
  'ATA': [8,9,10],
  'PD': [10],
};
Map positions451 = {
  'GOL': [0],
  'LE': [1],
  'ZAG': [2, 3],
  'LD': [4],
  'VOL': [5, 6],
  'MC': [5, 6, 8],
  'ME': [7, 8],
  'MEI': [7,8,9],
  'MD': [8, 9],
  'PE': [7],
  'ATA': [10],
  'PD': [9],
};
Map positions343 = {
  'GOL': [0],
  'LE': [1],
  'ZAG': [1, 2, 3],
  'LD': [3],
  'VOL': [4, 5],
  'MC': [4, 5],
  'ME': [6, 9],
  'MEI': [6,7],
  'MD': [7,10],
  'PE': [6, 9],
  'ATA': [8,9,10],
  'PD': [7,10],
};