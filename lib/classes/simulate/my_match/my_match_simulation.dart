import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/dict_keys/player_stats_keys.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/historic/total_victories.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/simulate/my_match/counter.dart';
import 'package:fifa/classes/simulate/player_variables/origin/assists.dart';
import 'package:fifa/classes/simulate/player_variables/origin/goal.dart';
import 'package:fifa/classes/simulate/player_variables/origin/grade.dart';
import 'package:fifa/global_variables.dart';

class MyMatchSimulation{

  bool visitante = false;
  int milis=0;
  int meuGolMarcado=0;
  int meuGolSofrido=0;
  int probGM=0;
  int probGS=0;
  late List adversarioEscalacao;
  late My myClass;
  Club myClubClass = Club(index: My().clubID);
  late Club adversarioClubClass;

  MyMatchSimulation(this.myClass,this.adversarioClubClass){
    adversarioEscalacao = adversarioClubClass.optimizeBestSquadClub();
    //reseta Substituicoes
    globalMatchSubstitutionsLeft = 3;
  }


  updateMilis(int milis){
    this.milis = milis;
  }
  golPorMinuto(PosturaDoTimeClass posturaDoTimeClass, double overallMy, double overallAdversario){

    //Define a probabilidade de marcar gol GM e de sofrer gol GS
    funcPosturaTime(posturaDoTimeClass, overallMy, overallAdversario);

    int gol = Random().nextInt(800);

    //EU FAÇO O GOL
    if(gol<=probGM) {

      funcMeuGol(gol);

      //GOL DO ADVERSARIO
    }else{
      //Os dois times não podem fazer gol no mesmo minuto
      //Ex: GM: 20 GS:15 e nº= 8
      gol = Random().nextInt(900);
      funcGolAdversario(gol);
    }

  }

  void funcMeuGol(int gol){
    globalMatchGoalsMinutesMy.add(milis);
    meuGolMarcado++;
    //quem fez GOL
    funcQuemfezgol(1);
    //quem fez ASSISTENCIA
    funcQuemfezAssistencia(1);
  }
  void funcGolAdversario(int gol){
    //TOMO O GOL
    if (gol <= probGS) {
      globalMatchGoalsMinutesAdv.add(milis);
      meuGolSofrido++;
      //GOL ADVERSARIO
      //QUEM FEZ O GOL DO ADVERSARIO ACESSA A FUNÇÃO quemfezgol, retorna um int
      funcQuemfezgol(2);
      //quem fez ASSISTENCIA
      funcQuemfezAssistencia(2);
    }
  }

  funcQuemfezgol(int clubMyorAdv){

    int quemfez = Goal().funcQuemfezgol();
    

    //Procura o nome do jogador na lista de todos os jogadores e adiciona um gol pra ele
    late int playerID;
    if(clubMyorAdv==1){
      playerID=myClass.jogadores[quemfez];
      globalMatchGoalScorerIDMy.add(playerID);
    }
    if(clubMyorAdv==2){
      playerID=adversarioEscalacao[quemfez];
      globalMatchGoalScorerIDAdv.add(playerID);
    }
    if(Semana(semana).isJogoCampeonatoNacional){
      globalLeaguePlayers[PlayerStatsKeys().keyPlayerGoals]![playerID]++;
    }else if(Semana(semana).isJogoCampeonatoInternacional){
      globalInternationalPlayers[PlayerStatsKeys().keyPlayerGoals]![playerID]++;
    }
    globalJogadoresMatchGoals[playerID]++;
    globalJogadoresCarrerGoals[playerID]++;

    Grade().goalMyMatch(playerID);
  }

  funcQuemfezAssistencia(int clubMyorAdv){

    int quemfez = Assists().funcQuemfezAssistencia();
    if(quemfez >= 0) { //nem todos gols tem assitencia, 75% tem

      //Procura o nome do jogador na lista de todos os jogadores e adiciona uma assistencia pra ele
      late int playerID;
      if(clubMyorAdv==1){playerID=myClass.jogadores[quemfez];}
      if(clubMyorAdv==2){playerID=adversarioEscalacao[quemfez];}
      if(Semana(semana).isJogoCampeonatoNacional){
        globalLeaguePlayers[PlayerStatsKeys().keyPlayerAssists]![playerID]++;
      }else if(Semana(semana).isJogoCampeonatoInternacional){
        globalInternationalPlayers[PlayerStatsKeys().keyPlayerAssists]![playerID]++;
      }
      globalJogadoresMatchAssists[playerID]++;
      globalJogadoresCarrerAssists[playerID]++;


      Grade().assistMyMatch(playerID);
    }
  }

  updateHealth(Club myClubClass, Club adversarioClubClass){
    for(int i=0; i<11; i++){
      Jogador myJogador = Jogador(index: globalMyJogadores[i]);
      Jogador adversarioJogador = Jogador(index: adversarioClubClass.escalacao[i]);

      updateHealthPlayer(myJogador);
      updateHealthPlayer(adversarioJogador);
      
      updateGradePlayer(myJogador);
      updateGradePlayer(adversarioJogador);
    }
  }

  updateGradePlayer(Jogador player){
    Grade().addMyGameRandomScore(player.index);
  }

  updateHealthPlayer(Jogador player){
    int globalID = player.index;

    if(player.age>35){ globalJogadoresMatchHealth[globalID] -= 0.011;  }
    else if(player.age>30){ globalJogadoresMatchHealth[globalID] -= 0.010;  }
    else if(player.age>25){ globalJogadoresMatchHealth[globalID] -= 0.009;  }
    else if(player.age>20){ globalJogadoresMatchHealth[globalID] -= 0.008;  }
    else                             { globalJogadoresMatchHealth[globalID] -= 0.007;  }


    if(player.position.contains('GOL')){ globalJogadoresMatchHealth[globalID] += 0.006;  }
    else if(player.position.contains('ZAG')){ globalJogadoresMatchHealth[globalID] += 0.0035;  }
    else if(player.position.contains('LE') || player.position.contains('LD') )
    { globalJogadoresMatchHealth[globalID] += 0.0025;  }
    else if(player.position.contains('VOL') || player.position.contains('MC') )
    { globalJogadoresMatchHealth[globalID] += 0.001;  }
    //NO INTERVALO
    if(milis==45) globalJogadoresMatchHealth[globalID] += 0.15;

    //Globalmente
    globalJogadoresHealth[globalID] = globalJogadoresMatchHealth[globalID];
  }

  void funcPosturaTime(PosturaDoTimeClass posturaDoTime,double overallEquipeA, double overallEquipeB){
    //TIME NA DEFESA
    if(posturaDoTime.value=='Defesa'){
      if(overallEquipeA-overallEquipeB>10)                                    {probGM=20;probGS=3;}
      if(overallEquipeA-overallEquipeB>6)                                    {probGM=16;probGS=5;} //marca 4 e toma 0,3 gols por jogo
      if(overallEquipeA-overallEquipeB<=6 && overallEquipeA-overallEquipeB>4){probGM=15;probGS=6;}
      if(overallEquipeA-overallEquipeB<=4 && overallEquipeA-overallEquipeB>2){probGM=14;probGS=7;}
      if(overallEquipeA-overallEquipeB<=2 && overallEquipeA-overallEquipeB>1){probGM=13;probGS=10;}
      if(overallEquipeA-overallEquipeB<=1 && overallEquipeA-overallEquipeB>-1){probGM=12;probGS=12;}
      if(overallEquipeA-overallEquipeB<=-1 && overallEquipeA-overallEquipeB>-2){probGM=10;probGS=13;}
      if(overallEquipeA-overallEquipeB<=-2 && overallEquipeA-overallEquipeB>-4){probGM=7;probGS=14;}
      if(overallEquipeA-overallEquipeB<=-4 && overallEquipeA-overallEquipeB>-6){probGM=6;probGS=15;}
      if(overallEquipeA-overallEquipeB<=-6)                                     {probGM=5;probGS=16;}}
    //TIME NORMAL
    if(posturaDoTime.value=='Normal'){
      if(overallEquipeA-overallEquipeB>=10)                                    {probGM=30;probGS=5;}
      if(overallEquipeA-overallEquipeB>=6)                                    {probGM=25;probGS=7;} //marca 4 e toma 0,3 gols por jogo
      if(overallEquipeA-overallEquipeB<6 && overallEquipeA-overallEquipeB>=4){probGM=22;probGS=10;}
      if(overallEquipeA-overallEquipeB<4 && overallEquipeA-overallEquipeB>=2){probGM=20;probGS=12;}
      if(overallEquipeA-overallEquipeB<=2 && overallEquipeA-overallEquipeB>1){probGM=18;probGS=14;}
      if(overallEquipeA-overallEquipeB<=1 && overallEquipeA-overallEquipeB>-1){probGM=16;probGS=16;}
      if(overallEquipeA-overallEquipeB<=-1 && overallEquipeA-overallEquipeB>-2){probGM=14;probGS=18;}
      if(overallEquipeA-overallEquipeB<=-2 && overallEquipeA-overallEquipeB>-4){probGM=12;probGS=20;}
      if(overallEquipeA-overallEquipeB<=-4 && overallEquipeA-overallEquipeB>-6){probGM=10;probGS=22;}
      if(overallEquipeA-overallEquipeB<=-6)                                     {probGM=7;probGS=25;}}
    //TIME NO ATAQUE
    if(posturaDoTime.value=='Ataque'){
      if(overallEquipeA-overallEquipeB>=10)                                    {probGM=35;probGS=8;}
      if(overallEquipeA-overallEquipeB>=6)                                    {probGM=30;probGS=10;} //marca 4 e toma 0,3 gols por jogo
      if(overallEquipeA-overallEquipeB<6 && overallEquipeA-overallEquipeB>=4){probGM=26;probGS=12;}
      if(overallEquipeA-overallEquipeB<4 && overallEquipeA-overallEquipeB>=2){probGM=23;probGS=14;}
      if(overallEquipeA-overallEquipeB<=2 && overallEquipeA-overallEquipeB>1){probGM=20;probGS=16;}
      if(overallEquipeA-overallEquipeB<=1 && overallEquipeA-overallEquipeB>-1){probGM=18;probGS=18;}
      if(overallEquipeA-overallEquipeB<=-1 && overallEquipeA-overallEquipeB>-2){probGM=16;probGS=20;}
      if(overallEquipeA-overallEquipeB<=-2 && overallEquipeA-overallEquipeB>-4){probGM=14;probGS=23;}
      if(overallEquipeA-overallEquipeB<=-4 && overallEquipeA-overallEquipeB>-6){probGM=12;probGS=26;}
      if(overallEquipeA-overallEquipeB<=-6)                                     {probGM=10;probGS=30;}}

  }

  endMatch(){
    TotalVictories totalVictories = TotalVictories();
    //VITORIA
    if(Semana(semana).isJogoCampeonatoNacional) {
      if (meuGolMarcado > meuGolSofrido) {
        globalClubsLeaguePoints[myClass.clubID] += 3;
        globalMyLeagueLastResults.add(3);
        totalVictories.add1Victory();
      }
      //EMPATE
      if (meuGolMarcado == meuGolSofrido) {
        globalClubsLeaguePoints[myClass.clubID] += 1;
        globalClubsLeaguePoints[adversarioClubClass.index] += 1;
        globalMyLeagueLastResults.add(1);
        totalVictories.add1Draw();
      }
      //DERROTA
      if (meuGolMarcado < meuGolSofrido) {
        globalClubsLeaguePoints[adversarioClubClass.index] += 3;
        globalMyLeagueLastResults.add(0);
        totalVictories.add1Loss();
      }

      globalClubsLeagueGM[myClass.clubID] += meuGolMarcado;
      globalClubsLeagueGS[myClass.clubID] += meuGolSofrido;
      globalClubsLeagueGM[adversarioClubClass.index] += meuGolSofrido;
      globalClubsLeagueGS[adversarioClubClass.index] += meuGolMarcado;

    }else if(Semana(semana).isJogoCampeonatoInternacional){
      if (meuGolMarcado > meuGolSofrido) {
        globalClubsInternationalPoints[myClass.clubID] += 3;
        globalMyLeagueLastResults.add(3);
        totalVictories.add1Victory();
      }
      //EMPATE
      if (meuGolMarcado == meuGolSofrido) {
        globalClubsInternationalPoints[myClass.clubID] += 1;
        globalClubsInternationalPoints[adversarioClubClass.index] += 1;
        globalMyLeagueLastResults.add(1);
        totalVictories.add1Draw();
      }
      //DERROTA
      if (meuGolMarcado < meuGolSofrido) {
        globalClubsInternationalPoints[adversarioClubClass.index] += 3;
        globalMyLeagueLastResults.add(0);
        totalVictories.add1Loss();
      }
      globalClubsInternationalGM[myClass.clubID] += meuGolMarcado;
      globalClubsInternationalGS[myClass.clubID] += meuGolSofrido;
      globalClubsInternationalGM[adversarioClubClass.index] += meuGolSofrido;
      globalClubsInternationalGS[adversarioClubClass.index] += meuGolMarcado;
    }else if(Semana(semana).isJogoCopa || Semana(semana).isJogoMundial){
      if (meuGolMarcado > meuGolSofrido) {
        globalMyLeagueLastResults.add(3);
      }
      //EMPATE
      if (meuGolMarcado == meuGolSofrido) {
        globalMyLeagueLastResults.add(1);
      }
      //DERROTA
      if (meuGolMarcado < meuGolSofrido) {
        globalMyLeagueLastResults.add(0);
      }
    }

  }

}
