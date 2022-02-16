import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/global/global_variables.dart';

import 'chaves.dart';

class GlobalFunctions{

  changeVariables(var a, var b){
    late var aux = a; a=b; b=aux;
    return [a,b];
  }
  double getDificuldadeValue(){
    double multiplicacaoDouble = 0;
    if(globalDificuldade==0){multiplicacaoDouble=2;}
    if(globalDificuldade==1){multiplicacaoDouble=1.25;}
    if(globalDificuldade==2){multiplicacaoDouble=1;}
    if(globalDificuldade==3){multiplicacaoDouble=0.8;}
    if(globalDificuldade==4){multiplicacaoDouble=0.6;}
    return multiplicacaoDouble;
  }
  String getDificuldadeNome(){
    String nome = '';
    if(globalDificuldade==0){nome='Amador';}
    if(globalDificuldade==1){nome='Fácil';}
    if(globalDificuldade==2){nome='Médio';}
    if(globalDificuldade==3){nome='Difícil';}
    if(globalDificuldade==4){nome='Expert';}
    return nome;
  }
  List organizarVariavelLeague(int leagueID, int goalOrYellowOrRed) {
    //Oraganiza em ordem lista de artilheiros, cartoes amarelos ou cartoes amarelos

    List global = [];
    if(goalOrYellowOrRed==0){global = globalJogadoresTotalGoals;}
    if(goalOrYellowOrRed==1){global = globalJogadoresYellowCard;}
    if(goalOrYellowOrRed==2){global = globalJogadoresRedCard;}

    List copyVariableList = [];
    List leaguePlayers = [];

    List clubsInLeague = League(index: leagueID).getClassification();
    for(int index=0; index<globalJogadoresClubIndex.length; index++){
      if(clubsInLeague.contains(globalJogadoresClubIndex[index])){
        try {// Na 1ªrodada pode dar pau, pq a lista nao foi criada
          if (global[index] >= 0) {
            copyVariableList.add(global[index]);
            leaguePlayers.add(index);
          }
        }catch(e){
          print('Erro GlobalFunctions().organizarVariavelLeague: '+e.toString());
        }
      }
    }
    //ARTILHEIROS EM ORDEM
    leaguePlayers = GlobalFunctions().organizarOrdemDecrescente(listA: copyVariableList, listB: leaguePlayers, length: leaguePlayers.length)[1];
  return leaguePlayers;
  }

  organizarOrdemDecrescente({required List listA,required List listB,required int length}){
    dynamic help;
    for(int i=0;i<length;i++){
      for(int k=i;k<length;k++){
        if(listA[i]<listA[k]){
          help = listA[i];listA[i] = listA[k];listA[k] = help;
          help = listB[i];listB[i] = listB[k];listB[k] = help;
        }
      }
    }
    return [listA,listB];
  }
  organizarOrdemCrescente({required List listA,required List listB,required int length}){
    dynamic help;
    for(int i=0;i<length;i++){
      for(int k=i;k<length;k++){
        if(listA[i]>listA[k]){
          help = listA[i];listA[i] = listA[k];listA[k] = help;
          help = listB[i];listB[i] = listB[k];listB[k] = help;
        }
      }
    }
    return [listA,listB];
  }

  /////////////////////////////////////////
  getClubIndexFromName(String clubName){
    //SEARCH IN ALL LEAGUES
    return clubsName.indexOf(clubName);
  }

  changeTeam(String newClubName, int newLeagueID, int posicao){

    globalMyClubName = newClubName;
    globalMyLeagueID = newLeagueID;
    globalMyPosicaoChave = posicao;
    int clubIndex = GlobalFunctions().getClubIndexFromName(newClubName);
    globalMyClubID = clubIndex;
    globalMyJogadores = getMyJogadoresInicio(clubIndex); //global MyJogadores tem que ser declarado antes de usar qualquer getOverall();
    double overall = Club(index: clubIndex).getOverall();
    globalMyMoney = ((overall-68)*(overall-68)/5)*0.7;
  }
  getMyJogadoresInicio(int index){
    //GET MY JOGADORES
    List jogadores = [];
    for (int i=0; i<globalJogadoresIndex.length;i++) {
      if(globalJogadoresClubIndex[i] == index){ //index do clube do jogador == index do clube
        jogadores.add(i);
      }
    }
    return jogadores;
  }

  int numberClubsTotal(){
    int numberClubsTotal = 0;
    for (var element in leaguesListRealIndex) {//element: 0-70
      var leagueName = leaguesIndexFromName.keys.firstWhere((k) => leaguesIndexFromName[k] == element, orElse: () => null);
      int i = leagueNames.indexOf(leagueName);
      numberClubsTotal = numberClubsTotal + int.parse(leaguesListNClubs[i].toString());
    }
    return numberClubsTotal;
  }
  bool isJogoCampeonatoNacional(){
    return semanasJogosNacionais.contains(semana);
  }
  bool isJogoCampeonatoInternacional(){
    return semanasJogosInternacionais.contains(semana);
  }
  String qualCopaInternacional(int virtualIndex){
    int numeroCampeonato = virtualIndex;
    if(numeroCampeonato<50){return "Champions";}
    if(numeroCampeonato>=50 && numeroCampeonato<70){return "Libertadores";}
    if(numeroCampeonato>=70){return "Liga Mundial";}
    return "Champions";
  }


  /////////////////////////////////////////////////////////////////
  // CHAVE
  /////////////////////////////////////////////////////////////////
  //define os adversarios dos pontos corridos
  List obterChave(int semana, int leagueIndex){
    List chave = [];
    if(semanasJogosNacionais.contains(semana)){
      if(League(index: leagueIndex).nClubs==6){
        chave = Chaves().obterChave6(semana);
      }
      if(League(index: leagueIndex).nClubs==14){
        chave = Chaves().obterChave14(semana);
      }
      if(League(index: leagueIndex).nClubs==16){
        chave = Chaves().obterChave16(semana);
      }
      if(League(index: leagueIndex).nClubs==18){
        chave = Chaves().obterChave18(semana);
      }
      if(League(index: leagueIndex).nClubs==20){
        chave = Chaves().obterChave20(semana);
      }
    }
    else if(semanasJogosInternacionais.contains(semana)){
      chave = Chaves().obterChaveGrupoInternacional(semana);
    }
    else if(semanasJogosCopas.contains(semana)){
      chave = [];
    }

    return chave;
  }

  List chaveIndexAdvCampeonato(int semana, int leagueIndex, int posicaoChave) {
    List chaves = obterChave(semana, leagueIndex);
    bool visitante = false;
    late int indexAdv; //de 0-16
    if (chaves.isNotEmpty) {
      if (chaves.indexOf(posicaoChave) % 2 == 0) {
        indexAdv = chaves[chaves.indexOf(posicaoChave) + 1];
      } else {
        indexAdv = chaves[chaves.indexOf(posicaoChave) - 1];
        visitante = true;
      }
      return [indexAdv,visitante];
    }
    return [0,false];
  }

}