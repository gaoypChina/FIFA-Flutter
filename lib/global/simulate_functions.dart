import 'dart:math';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global/global_variables.dart';
import 'package:fifa/global/globalfunctions.dart';

class Simulate{

  late int variableGol1;
  late int variableGol2;
  List goalsList = List.filled(25, 0);//25 pra garantir que nenhum campeonato tem mais times que isso no futuro

  nationalMatchs(int leagueSelected){

    int myClubID = My().clubID;
    int myCampeonatoID = My().campeonatoID;
    for(int i=0; i<leaguesListRealIndex.length; i++){
      int leagueIndex = leaguesListRealIndex[i];
      League leagueSelected = League(index: leagueIndex);

      int nClubs = leagueSelected.nClubs;
      List chave = GlobalFunctions().obterChave(rodada, leagueIndex);
      for(int nConfronto=0; nConfronto<nClubs/2; nConfronto++){

        int chaveClub1 = chave[nConfronto*2];
        int indexTeam1 = leagueSelected.getClubIndex(chaveClub1);
        int chaveClub2 = GlobalFunctions().chaveIndexAdvCampeonato(rodada, leagueIndex, chaveClub1)[0];
        int indexTeam2 = leagueSelected.getClubIndex(chaveClub2);

        if(myCampeonatoID != leagueIndex) {
            matchSimulation(indexTeam1, indexTeam2);
            //SALVA O PLACAR NO HISTÓRICO
            setHistoricGoalsLeague(leagueIndex,chaveClub1,chaveClub2);
        }else{
          if (myClubID != indexTeam1 && myClubID != indexTeam2) {
            matchSimulation(indexTeam1, indexTeam2);
            //SALVA O PLACAR NO HISTÓRICO
            setHistoricGoalsLeague(leagueIndex,chaveClub1,chaveClub2);
          }
        }


      }
    }
    //SOMA PRO TOTAL
    updateVariables();
  }

  internationalMatchsGroups(int internationalSelected){

    int myClubID = My().clubID;
    for(int i=0; i<globalInternational32ClubsID.length; i++) { //globalInternational32ClubsID.length = 2;
      //PRA CHAMPIONS E PARA A LIBERTADORES
      List chave = GlobalFunctions().obterChave(semana, 0);
      for (int groupNumber = 0; groupNumber < 8; groupNumber++) {
        for (int nConfronto = 0; nConfronto < 4 / 2; nConfronto++) {
          int chaveConfronto = chave[nConfronto * 2];
          int indexTeam1 = globalInternational32ClubsID[4 * groupNumber + chaveConfronto];
          int indexAdv04 = GlobalFunctions().chaveIndexAdvCampeonato(rodada, 0, chaveConfronto)[0];
          int indexTeam2 = globalInternational32ClubsID[4 * groupNumber + indexAdv04];
          if(indexTeam1 != myClubID && indexTeam2 != myClubID) {
            matchSimulation(indexTeam1, indexTeam2);
          }
        }
      }
    }

  }

  updateVariables(){
    for(int i=0; i<globalJogadoresTotalGoals.length; i++){
      globalJogadoresTotalMatchs[i] = globalJogadoresLeagueMatchs[i]+globalJogadoresInternationalMatchs[i];
      globalJogadoresTotalGoals[i] = globalJogadoresLeagueGoals[i]+globalJogadoresInternationalGoals[i];
      globalJogadoresTotalAssists[i] = globalJogadoresLeagueAssists[i]+globalJogadoresInternationalAssists[i];
    }
  }

  matchSimulation(int indexTeam1, int indexTeam2){
    Club club1Class = Club(index: indexTeam1);
    Club club2Class = Club(index: indexTeam2);
    double ovr1 = club1Class.getOverall();
    double ovr2 = club2Class.getOverall();

    //ANTES DA PARTIDA
    //REMOVE (-1) CARTOES AMARELOS E VERMELHOS E LESOES
    setMinus1InjuryRedYellowCardAllTeam(club1Class);
    setMinus1InjuryRedYellowCardAllTeam(club2Class);

    int gol = Random().nextInt(100);
    late int probVit,probEmp;
    if(ovr1 > ovr2+10){probVit = 90;probEmp = 95;}
    else if(ovr1 > ovr2+7){probVit = 85;probEmp = 95;}
    else if(ovr1 > ovr2+5){probVit = 75;probEmp = 90;}
    else if(ovr1 > ovr2+4){probVit = 65;probEmp = 85;}
    else if(ovr1 > ovr2+3){probVit = 55;probEmp = 80;}
    else if(ovr1 > ovr2+2){probVit = 50;probEmp = 75;}
    else if(ovr1 > ovr2+1){probVit = 40;probEmp = 70;}
    else if(ovr1 > ovr2)  {probVit = 33;probEmp = 66;}
    else if(ovr1 > ovr2-1){probVit = 30;probEmp = 60;}
    else if(ovr1 > ovr2-2){probVit = 25;probEmp = 50;}
    else if(ovr1 > ovr2-3){probVit = 20;probEmp = 45;}
    else if(ovr1 > ovr2-4){probVit = 15;probEmp = 35;}
    else if(ovr1 > ovr2-5){probVit = 10;probEmp = 25;}
    else if(ovr1 > ovr2-7){probVit = 5;probEmp = 15;}
    else if(ovr1 <= ovr2-7){probVit = 5;probEmp = 10;}

    late int golTime1;
    late int golTime2;
    //Vitória time 1
    if(gol<probVit){
      golTime1 = Random().nextInt(5)+1;
      golTime2 = golTime1>1 ? Random().nextInt(golTime1) : 0;
    }
    //EMPATE
    else if(gol<probEmp){
      golTime1 = Random().nextInt(4);
      golTime2 = golTime1;
      //Vitória time 2
    }else{
      golTime2 = Random().nextInt(5)+1;
      golTime1 = golTime2>1 ? Random().nextInt(golTime2) : 0;
    }
    variableGol1 = golTime1;
    variableGol2 = golTime2;

    //SETA JOGADORES
    for(int i=0; i<golTime1; i++){
      setGoalAndAssists(club1Class);
    }
    for(int i=0; i<golTime2; i++){
      setGoalAndAssists(club2Class);
    }

    //+1 Match
    setMatchPlus1(club1Class);
    setMatchPlus1(club2Class);

    //RED CARDS, YELLOW CARDS, INJURY
    setRedCardsYellowCardsInjury(club1Class,false);
    setRedCardsYellowCardsInjury(club2Class,false);

    //Reorganiza os melhores jogadores da posição;
    club1Class.optimizeBestSquadClub();
    club2Class.optimizeBestSquadClub();

    //SOMA OS PONTOS
    setPontosGanhos(indexTeam1,indexTeam2,golTime1,golTime2);

  }

  ///////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////

  setHistoricGoalsLeague(int leagueIndex, int chavePos1, int chavePos2){
    if(GlobalFunctions().isJogoCampeonatoNacional()){
      if(globalHistoricLeagueGoalsLastRodada[leagueIndex]!=null){ //Se existir
        goalsList = globalHistoricLeagueGoalsLastRodada[leagueIndex];//pega as infos da minha partida tambem
      }
      //LISTA COM GOLS DAQUELA CAMPEONATO, QUE É SOBRESCRITA A CADA CAMPEONATO
      goalsList[chavePos1] = variableGol1;
      goalsList[chavePos2] = variableGol2;

      //SALVA OS GOLS DO CAMPEONATO
      globalHistoricLeagueGoalsLastRodada[leagueIndex] = List.from(goalsList);

      //SALVA OS GOLS DO CAMPEONATO NA RODADA
      globalHistoricLeagueGoalsAll[rodada] = Map.from(globalHistoricLeagueGoalsLastRodada);
    }
  }

  setPontosGanhos(int indexTeam1, int indexTeam2, int golTime1, int golTime2){

    if(GlobalFunctions().isJogoCampeonatoNacional()) {
      if (golTime1 > golTime2) {
        globalClubsLeaguePoints[indexTeam1] += 3;
      }
      if (golTime1 == golTime2) {
        globalClubsLeaguePoints[indexTeam1] += 1;
        globalClubsLeaguePoints[indexTeam2] += 1;
      }
      if (golTime1 < golTime2) {
        globalClubsLeaguePoints[indexTeam2] += 3;
      }

      globalClubsLeagueGM[indexTeam1] += golTime1;
      globalClubsLeagueGS[indexTeam1] += golTime2;

      globalClubsLeagueGM[indexTeam2] += golTime2;
      globalClubsLeagueGS[indexTeam2] += golTime1;
    }
    if(GlobalFunctions().isJogoCampeonatoInternacional()){
      if (golTime1 > golTime2) {
        globalClubsInternationalPoints[indexTeam1] += 3;
      }
      if (golTime1 == golTime2) {
        globalClubsInternationalPoints[indexTeam1] += 1;
        globalClubsInternationalPoints[indexTeam2] += 1;
      }
      if (golTime1 < golTime2) {
        globalClubsInternationalPoints[indexTeam2] += 3;
      }

      globalClubsInternationalGM[indexTeam1] += golTime1;
      globalClubsInternationalGS[indexTeam1] += golTime2;

      globalClubsInternationalGM[indexTeam2] += golTime2;
      globalClubsInternationalGS[indexTeam2] += golTime1;
    }
  }

  setRedCardsYellowCardsInjury(Club clubClass,bool isMyMatch){
    //Média de 3 cartões amarelos por jogo
    //Média de 0.2 cartão vermelho a cada jogo
    //Média de 0.5 lesão a cada jogo

    if(isMyMatch){
      int prob = Random().nextInt(90*100);
      int probJog = Random().nextInt(11); //Posição do jogador [0-11]
      int jogadorID = clubClass.escalacao[probJog];
      if(prob<=30) {
        globalJogadoresInjury[jogadorID] = prob~/2;
          globalJogadoresMatchInjury[jogadorID] = prob~/2;
      }

      //CARTÃO VERMELHO
      prob = Random().nextInt(90*100);
      probJog = Random().nextInt(11); //Posição do jogador [0-11]
      if(prob<=25) {globalJogadoresRedCard[jogadorID]++;
                    globalJogadoresMatchRedCards[jogadorID]++;
      }
      //CARTÃO AMARELO
      else if(prob<=300) {
        globalJogadoresYellowCard[jogadorID]++;
        globalJogadoresMatchYellowCards[jogadorID]++;
      }
    }else{
      /////////////////////////////////////////////////////////
      //SIMULAÇÃO OUTRAS PARTIDAS
      //LESÃO
      for(int jogPOS=0; jogPOS<11; jogPOS++) {
        int prob = Random().nextInt(100);
        int jogadorID = clubClass.escalacao[jogPOS];
        if (prob <= 6) {
          globalJogadoresInjury[jogadorID] = prob*2;
        }

        //CARTÃO VERMELHO
        prob = Random().nextInt(100);
        if (prob <= 5) {
          globalJogadoresRedCard[jogadorID]++;
        }
        //CARTÃO AMARELO
        else if (prob <= 30) {
          globalJogadoresYellowCard[jogadorID]++;
        }
      }
    }

  }

  setMinus1InjuryRedYellowCardAllTeam(Club clubClass){
    for(int i=0; i<clubClass.nJogadores; i++) {
      int jogadorID = clubClass.jogadores[i];
      if (clubClass.index == globalMyClubID) {
        jogadorID = globalMyJogadores[i];
      }

      if(GlobalFunctions().isJogoCampeonatoNacional()){
        if(globalJogadoresYellowCard[jogadorID]>0){
          globalJogadoresYellowCard[jogadorID]--;
        }
        if(globalJogadoresRedCard[jogadorID]>0){
          globalJogadoresRedCard[jogadorID]--;
        }
        if(globalJogadoresInjury[jogadorID]>0){
          globalJogadoresInjury[jogadorID]--;
        }
      }

    }
  }
  setMatchPlus1(Club clubClass){
    for(int i=0; i<11; i++) {
      int jogadorID=clubClass.escalacao[i];
      if(clubClass.index==globalMyClubID){
        jogadorID = globalMyJogadores[i];
      }

      if(GlobalFunctions().isJogoCampeonatoNacional()){
        globalJogadoresLeagueMatchs[jogadorID]++;
      }
      if(GlobalFunctions().isJogoCampeonatoInternacional()){
        globalJogadoresInternationalMatchs[jogadorID]++;
      }
    }

  }

  setGoalAndAssists(Club clubClass){
    //SETA GOL
    int quemfez = funcQuemfezgol();
    //Se o jogador escolhido estiver machucado ou com cartão vermelho, entao escolhe outro jogador
    if(globalJogadoresMatchRedCards[quemfez]>0 && globalJogadoresMatchInjury[quemfez]>0){
      quemfez = funcQuemfezgol();
    }
    int jogadorID=clubClass.escalacao[quemfez];
    if(GlobalFunctions().isJogoCampeonatoNacional()){
      globalJogadoresLeagueGoals[jogadorID]++;
    }
    if(GlobalFunctions().isJogoCampeonatoInternacional()){
      globalJogadoresInternationalGoals[jogadorID]++;
    }

    //SETA ASSISTENCIA
    quemfez = funcQuemfezAssistencia();
    if(quemfez>0) {
      jogadorID = clubClass.escalacao[quemfez];

      if (GlobalFunctions().isJogoCampeonatoNacional()) {
        globalJogadoresLeagueAssists[jogadorID]++;
      }
      if(GlobalFunctions().isJogoCampeonatoInternacional()){
        globalJogadoresInternationalAssists[jogadorID]++;
      }
    }
  }

  int funcQuemfezgol(){
    int prob = Random().nextInt(100);
    late int quemfez;
    if(prob>75){quemfez=10;}
    else if(prob>50){quemfez=9;}
    else if(prob>40){quemfez=8;}
    else if(prob>30){quemfez=7;}
    else if(prob>20){quemfez=6;}
    else if(prob>15){quemfez=5;}
    else if(prob>11){quemfez=4;}
    else if(prob>7){quemfez=3;}
    else if(prob>3){quemfez=2;}
    else if(prob>=0){quemfez=1;}

    return quemfez;
    }
  funcQuemfezAssistencia(){
    int prob = Random().nextInt(100);
    if(Random().nextInt(100)<75) { //nem todos gols tem assitencia, 75% tem
      late int quemfez;
      if(prob>80){quemfez=8;}
      else if(prob>59){quemfez=7;}
      else if(prob>47){quemfez=9;}
      else if(prob>35){quemfez=10;}
      else if(prob>25){quemfez=6;}
      else if(prob>15){quemfez=5;}
      else if(prob>11){quemfez=4;}
      else if(prob>7){quemfez=3;}
      else if(prob>3){quemfez=2;}
      else if(prob>=0){quemfez=1;}

      return quemfez;
      }
    return -1;
    }



}