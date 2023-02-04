import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/league.dart';

import '../global_variables.dart';

class Chaves{
  /////////////////////////////////////////////////////////////////
  // CHAVE
  /////////////////////////////////////////////////////////////////
  //define os adversarios dos pontos corridos
  List obterChave(int semana, int leagueIndex){
    List chave = [];
    if(Semana(semana).isJogoCampeonatoNacional){
      //verify is jogo volta
      int calculateWeek = semana;
      if(League(index: leagueIndex).nClubs==2){
        chave = Chaves().obterChave4(calculateWeek);
      }
      if(League(index: leagueIndex).nClubs==4){
        chave = Chaves().obterChave4(calculateWeek);
      }
      if(League(index: leagueIndex).nClubs==6){
        chave = Chaves().obterChave6(calculateWeek);
      }
      else if(League(index: leagueIndex).nClubs==8){
        chave = Chaves().obterChave8(calculateWeek);
      }
      else if(League(index: leagueIndex).nClubs==10){
        chave = Chaves().obterChave10(calculateWeek);
      }
      else if(League(index: leagueIndex).nClubs==12){
        chave = Chaves().obterChave12(calculateWeek);
      }
      else if(League(index: leagueIndex).nClubs==14){
        chave = Chaves().obterChave14(calculateWeek);
      }
      else if(League(index: leagueIndex).nClubs==16){
        chave = Chaves().obterChave16(calculateWeek);
      }
      else if(League(index: leagueIndex).nClubs==18){
        chave = Chaves().obterChave18(calculateWeek);
      }
      else if(League(index: leagueIndex).nClubs==20){
        chave = Chaves().obterChave20(calculateWeek);
      }
    }
    else if(Semana(semana).isJogoCampeonatoInternacional){
      chave = Chaves().obterChaveGrupoInternacional(semana);
    }
    else if(Semana(semana).isJogoCopa){
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

  List obterChave2(int semana) {
    List chave = [];
    if (semana == semanasJogosNacionais[0]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [0,1];
    }

    return chave;
  }

  List obterChave4(int semana) {
    List chave = [];
    if (semana == semanasJogosNacionais[0]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [0,1, 2,3];
    }
    else if (semana == semanasJogosNacionais[1]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [0,2, 3,1];
    }
    else if (semana == semanasJogosNacionais[2]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [3,0, 2,1];
    }

    return chave;
  }

  List obterChave6(int semana) {
    List chave = [];
    if (semana == semanasJogosNacionais[0]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [1,4, 2,5, 3,0];
    }
    else if (semana == semanasJogosNacionais[1]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [0,2, 4,3, 5,1];
    }
    else if (semana == semanasJogosNacionais[2]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [1,0, 2,3, 5,4];
    }
    else if (semana == semanasJogosNacionais[3]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [0,5, 2,4, 3,1];
    }
    else if (semana == semanasJogosNacionais[4]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [1,2, 4,0, 5,3];
    }

    return chave;
  }
  List obterChave8(int semana) {
    List chave = [];
    if (semana == semanasJogosNacionais[0]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [0,1, 2,7, 3,6, 5,4];
    }
    else if (semana == semanasJogosNacionais[1]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [1,5, 4,3, 6,2, 7,0];
    }
    else if (semana == semanasJogosNacionais[2]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [2,4, 3,1, 5,0, 6,7];
    }
    else if (semana == semanasJogosNacionais[3]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [0,3, 1,2, 4,6, 7,5];
    }
    else if (semana == semanasJogosNacionais[4]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [2,0, 3,5, 4,7, 6,1];
    }
    else if (semana == semanasJogosNacionais[5]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [0,6, 1,4, 3,7, 5,2];
    }
    else if (semana == semanasJogosNacionais[6]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [2,3, 4,0, 6,5, 7,1];
    }
    return chave;
  }
  List obterChave10(int semana) {
    List chave = [];
    if (semana == semanasJogosNacionais[0]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [0,7, 1,2, 3,6, 4,5, 9,8];
    }
    else if (semana == semanasJogosNacionais[1]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [2,0, 5,9, 6,4, 7,3, 8,1];
    }
    else if (semana == semanasJogosNacionais[2]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [0,8, 1,5, 3,2, 7,6, 9,4];
    }
    else if (semana == semanasJogosNacionais[3]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [2,7, 4,1, 5,0, 6,9, 8,3];
    }
    else if (semana == semanasJogosNacionais[4]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [0,4, 1,9, 2,6, 3,5, 7,8];
    }
    else if (semana == semanasJogosNacionais[5]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [4,3, 5,7, 6,1, 8,2, 9,0];
    }
    else if (semana == semanasJogosNacionais[6]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [0,1, 2,5, 3,9, 7,4, 8,6];
    }
    else if (semana == semanasJogosNacionais[7]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [0,6, 1,3, 4,2, 5,8, 9,7];
    }
    else if (semana == semanasJogosNacionais[8]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [2,9, 3,0, 6,5, 7,1, 8,4];
    }
    return chave;
  }
  List obterChave12(int semana) {
    List chave = [];
    if(semana==semanasJogosNacionais[0]){//verifica o numero do meu time e ve qual a posição dele
      chave = [1,7, 10,4, 2,9, 5,0, 6,3, 8,11];
    }
    else if(semana==semanasJogosNacionais[1]){
      chave = [0,1, 11,2, 3,8, 4,6, 7,10, 9,5];
    }
    else if(semana==semanasJogosNacionais[2]){
      chave = [10,1, 2,3, 5,11, 6,7, 8,4, 9,0];
    }
    else if(semana==semanasJogosNacionais[3]){
      chave = [0,10, 1,6, 11,9, 3,5, 4,2, 7,8];
    }
    else if(semana==semanasJogosNacionais[4]){
      chave = [11,0, 2,7, 5,4, 6,10, 8,1, 9,3];
    }
    else if(semana==semanasJogosNacionais[5]){
      chave = [0,6, 1,2, 10,8, 3,11, 4,9, 7,5];
    }
    else if(semana==semanasJogosNacionais[6]){
      chave = [11,4, 2,10, 3,0, 5,1, 8,6, 9,7];
    }
    else if(semana==semanasJogosNacionais[7]){
      chave = [0,8, 1,9, 10,5, 4,3, 6,2, 7,11];
    }
    else if(semana==semanasJogosNacionais[8]){
      chave = [11,1, 2,8, 3,7, 4,0, 5,6, 9,10];
    }
    else if(semana==semanasJogosNacionais[9]){
      chave = [1,3, 10,11, 2,0, 6,9, 7,4, 8,5];
    }
    else if(semana==semanasJogosNacionais[10]){
      chave = [0,7, 11,6, 3,10, 4,1, 5,2, 9,8];
    }

    return chave;
  }
  List obterChave14(int semana) {
    List chave = [];
    if(semana==semanasJogosNacionais[0]){//verifica o numero do meu time e ve qual a posição dele
      chave = [10,3, 12,2, 13,6, 4,11, 7,1, 8,5, 9,0];
    }
    else if(semana==semanasJogosNacionais[1]){
      chave = [0,8, 1,4, 11,13, 2,10, 3,9, 5,7, 6,12];
    }
    else if(semana==semanasJogosNacionais[2]){
      chave = [12,11, 13,1, 4,5, 6,2, 7,0, 8,3, 9,10];
    }
    else if(semana==semanasJogosNacionais[3]){
      chave = [0,4, 1,12, 10,8, 11,6, 2,9, 3,7, 5,13];
    }
    else if(semana==semanasJogosNacionais[4]){
      chave = [11,2, 12,5, 13,0, 4,3, 6,1, 7,10, 8,9];
    }
    else if(semana==semanasJogosNacionais[5]){
      chave = [0,12, 1,11, 10,4, 2,8, 3,13, 5,6, 9,7];
    }
    else if(semana==semanasJogosNacionais[6]){
      chave = [1,2, 11,5, 12,3, 13,10, 4,9, 6,0, 7,8];
    }
    else if(semana==semanasJogosNacionais[7]){
      chave = [0,11, 10,12, 2,7, 3,6, 5,1, 8,4, 9,13];
    }
    else if(semana==semanasJogosNacionais[8]){
      chave = [1,0, 11,3, 12,9, 13,8, 4,7, 5,2, 6,10];
    }
    else if(semana==semanasJogosNacionais[9]){
      chave = [0,5, 10,11, 2,4, 3,1, 7,13, 8,12, 9,6];
    }
    else if(semana==semanasJogosNacionais[10]){
      chave = [0,2, 1,10, 11,9, 12,7, 13,4, 5,3, 6,8];
    }
    else if(semana==semanasJogosNacionais[11]){
      chave = [10,5, 13,2, 3,0, 4,12, 7,6, 8,11, 9,1];
    }
    else if(semana==semanasJogosNacionais[12]){
      chave = [0,10, 1,8, 11,7, 12,13, 2,3, 5,9, 6,4];
    }

    return chave;
  }
  List obterChave16(int semana){
    List chave = [];
    if(semana==semanasJogosNacionais[0]) { //verifica o numero do meu time e ve qual a posição dele
      chave = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
    }
    else if(semana==semanasJogosNacionais[1]){
      chave = [11,6, 13,2, 15,8, 7,10, 1,14, 3,4, 9,12, 5,0];
    }
    else if(semana==semanasJogosNacionais[2]){
      chave = [0,9,  7,11,  2,1, 4,15, 6,5, 8,13, 10,3, 14,12];
    }
    else if(semana==semanasJogosNacionais[3]){
      chave = [13,4, 15,6, 0,10, 1,7, 3,5, 9,11, 12,8, 14,2];
    }
    else if(semana==semanasJogosNacionais[4]){
      chave = [11,14, 15,1, 2,4, 8,3, 9,13, 5,7, 10,6, 12,0];
    }
    else if(semana==semanasJogosNacionais[5]){
      chave = [13,0, 7,8, 1,12, 3,15, 4,10, 6,2, 5,11, 14,9];
    }
    else if(semana==semanasJogosNacionais[6]){
      chave = [11,3, 15,13, 0,14, 2,7, 1,6, 8,4, 9,10, 12,5];
    }
    else if(semana==semanasJogosNacionais[7]){
      chave = [11,2, 13,14, 7,3, 4,1, 6,12, 8,0, 5,9, 10,15];
    }
    else if(semana==semanasJogosNacionais[8]){
      chave = [15,11, 0,4, 2,5, 1,13, 3,6, 9,7, 12,10, 14,8];
    }
    else if(semana==semanasJogosNacionais[9]){
      chave = [11,13, 7,15, 2,12, 3,9, 4,14, 6,0, 5,1, 10,8];
    }
    else if(semana==semanasJogosNacionais[10]){
      chave = [13,10, 15,5, 0,3, 1,11, 8,2, 9,6, 12,4, 14,7];
    }
    else if(semana==semanasJogosNacionais[11]){
      chave = [11,0, 7,12, 2,15, 3,1, 4,9, 6,8, 5,13, 10,14];
    }
    else if(semana==semanasJogosNacionais[12]){
      chave = [13,3, 0,7, 1,10, 4,6, 8,11, 9,2, 12,15, 14,5];
    }
    else if(semana==semanasJogosNacionais[13]){
      chave = [11,4, 15,9, 7,13, 2,0, 1,8, 3,12, 6,14, 5,10];
    }
    else if(semana==semanasJogosNacionais[14]){
      chave = [13,6, 0,15, 4,7, 8,5, 9,1, 10,2, 12,11, 14,3];
    }

    return chave; //lista dos adversario
  }

  List obterChave18(int semana){
    List chave = [];
    if(semana==semanasJogosNacionais[0]){//verifica o numero do meu time e ve qual a posição dele
      chave = [2,7, 11,1, 12,6, 14,9, 15,3, 16,10, 17,13, 4,8, 5,0];
    }
    else if(semana==semanasJogosNacionais[1]){
      chave = [1,14, 13,16, 0,4, 3,17, 6,5, 7,11, 8,15, 9,12, 10,2];
    }
    else if(semana==semanasJogosNacionais[2]){
      chave = [1,9, 2,13, 11,10, 14,7, 15,0, 16,3, 17,8, 4,6, 5,12];
    }
    else if(semana==semanasJogosNacionais[3]){
      chave = [1,7, 2,3, 4,12, 5,9, 6,15, 8,16, 10,14, 11,13, 0,17];
    }
    else if(semana==semanasJogosNacionais[4]){
      chave = [1,10, 2,8, 11,3, 4,5, 17,6, 7,9, 15,12, 14,13, 16,0];
    }
    else if(semana==semanasJogosNacionais[5]){
      chave = [13,1, 0,2, 3,14, 9,4, 5,15, 6,16, 10,7, 8,11, 12,17];
    }
    else if(semana==semanasJogosNacionais[6]){
      chave = [1,3, 2,6, 15,4, 17,5, 7,13, 14,8, 10,9, 11,0, 16,12];
    }
    else if(semana==semanasJogosNacionais[7]){
      chave = [8,1, 12,2, 3,7, 4,17, 5,16, 6,11, 9,15, 0,14, 13,10];
    }
    else if(semana==semanasJogosNacionais[8]){
      chave = [1,0, 2,5, 10,3, 16,4, 14,6, 7,8, 13,9, 11,12, 17,15];
    }
    else if(semana==semanasJogosNacionais[9]){
      chave = [6,1, 4,2, 3,13, 5,11, 0,7, 8,10, 9,17, 12,14, 15,16];
    }
    else if(semana==semanasJogosNacionais[10]){
      chave = [1,12, 2,15, 3,9, 11,4, 14,5, 7,6, 13,8, 10,0, 16,17];
    }
    else if(semana==semanasJogosNacionais[11]){
      chave = [5,1, 17,2, 8,3, 4,14, 6,10, 12,7, 9,16, 15,11, 0,13];
    }
    else if(semana==semanasJogosNacionais[12]){
      chave = [1,4, 2,16, 3,0, 7,5, 13,6, 8,9, 10,12, 11,17, 14,15];
    }
    else if(semana==semanasJogosNacionais[13]){
      chave = [15,1, 9,2, 6,3, 4,7, 5,10, 0,8, 16,11, 12,13, 17,14];
    }
    else if(semana==semanasJogosNacionais[14]){
      chave = [1,17, 11,2, 3,12, 10,4, 13,5, 8,6, 7,15, 0,9, 14,16];
    }
    else if(semana==semanasJogosNacionais[15]){
      chave = [16,1, 2,14, 5,3, 4,13, 6,0, 17,7, 12,8, 11,9, 15,10];
    }
    else if(semana==semanasJogosNacionais[16]){
      chave = [1,2, 3,4, 7,16, 8,5, 9,6, 10,17, 14,11, 0,12, 13,15];
    }
    return chave;
  }
  List obterChave20(int semana){
    List chave = [];
    if(semana==semanasJogosNacionais[0]){//verifica o numero do meu time e ve qual a posição dele
      chave = [1,2, 3,4, 5,6, 7,8, 9,10, 11,12, 13,14, 15,16, 17,18, 19,0];
    }
    else if(semana==semanasJogosNacionais[1]){
      chave = [6,17, 4,13, 14,1, 0,3, 16,5, 12,9, 8,15, 2,11, 10,19, 18,7];
    }
    else if(semana==semanasJogosNacionais[2]){
      chave = [17,12, 3,6, 19,8, 15,2, 13,10, 11,4, 9,0, 7,16, 5,14, 1,18];
    }
    else if(semana==semanasJogosNacionais[3]){
      chave = [16,17, 4,5, 6,9, 12,3, 8,11, 10,1, 18,19, 14,15, 2,7, 0,13];
    }
    else if(semana==semanasJogosNacionais[4]){
      chave = [11,18, 7,6, 17,9, 14,4, 1,12, 13,8, 15,0, 3,10, 19,16, 5,2];
    }
    else if(semana==semanasJogosNacionais[5]){
      chave = [4,8, 6,15, 16,0, 12,19, 9,3, 2,14, 10,7, 5,11, 18,13, 1,17];
    }
    else if(semana==semanasJogosNacionais[6]){
      chave = [3,5, 19,1, 0,12, 15,10, 8,18, 13,6, 11,9, 2,4, 7,17, 14,16];
    }
    else if(semana==semanasJogosNacionais[7]){
      chave = [3,19, 17,11, 6,14, 16,8, 9,13, 10,2, 7,4, 5,12, 18,0, 1,15];
    }
    else if(semana==semanasJogosNacionais[8]){
      chave = [8,6, 4,18, 13,17, 11,16, 14,7, 0,1, 2,3, 19,5, 15,9, 12,10];
    }
    else if(semana==semanasJogosNacionais[9]){
      chave = [3,11, 17,19, 6,12, 16,4, 8,14, 9,5, 10,0, 7,15, 18,2, 1,13];
    }
    else if(semana==semanasJogosNacionais[10]){
      chave = [4,6, 0,8, 15,3, 12,14, 13,19, 11,7, 9,1, 2,16, 5,17, 18,10];
    }
    else if(semana==semanasJogosNacionais[11]){
      chave = [4,15, 19,9, 17,3, 6,11, 16,10, 8,2, 13,12, 7,0, 1,5, 14,18];
    }
    else if(semana==semanasJogosNacionais[12]){
      chave = [3,1, 0,2, 17,14, 6,19, 12,4, 11,13, 9,16, 10,8, 5,7, 18,15];
    }
    else if(semana==semanasJogosNacionais[13]){
      chave = [4,0, 19,11, 15,12, 16,18, 8,17, 13,5, 2,9, 7,3, 1,6, 14,10];
    }
    else if(semana==semanasJogosNacionais[14]){
      chave = [3,13, 10,4, 9,8, 11,1, 12,7, 6,16, 17,15, 0,14, 19,2, 5,18];
    }
    else if(semana==semanasJogosNacionais[15]){
      chave = [4,1, 0,6, 15,11, 16,13, 8,12, 2,17, 10,5, 7,9, 18,3, 14,19];
    }
    else if(semana==semanasJogosNacionais[16]){
      chave = [3,14, 19,15, 17,10, 6,18, 12,16, 13,2, 11,0, 9,4, 5,8, 1,7];
    }
    else if(semana==semanasJogosNacionais[17]){
      chave = [4,17, 0,5, 15,13, 16,3, 8,1, 2,12, 10,6, 7,19, 18,9, 14,11];
    }
    else if(semana==semanasJogosNacionais[18]){
      chave = [1,16, 19,4, 17,0, 6,2, 12,18, 13,7, 11,10, 9,14, 5,15, 3,8];
    }
    return chave;
  }
  List obterChaveGrupoInternacional(int semana){
    List chave = [];
    if(semana == semanasGruposInternacionais[0])
    {chave = [1,2,3,0];         }
    else if(semana == semanasGruposInternacionais[1])
    { chave = [0,1,2,3];       }
    else if(semana == semanasGruposInternacionais[2])
    {chave = [1,3,0,2];        }
    else if(semana == semanasGruposInternacionais[3])
    {chave = [1,0,3,2];         }
    else if(semana == semanasGruposInternacionais[4])
    {chave = [2,1,0,3];       }
    else if(semana == semanasGruposInternacionais[5])
    {chave = [3,1,2,0];           }

    return chave; //lista dos adversario
  }
}
