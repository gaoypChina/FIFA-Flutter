import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/functions/func_number_clubs_total.dart';
import 'package:fifa/global_variables.dart';

transferenciaJogador(int id){

  int currentClubID = globalJogadoresClubIndex[id];
  int playerOverall = globalJogadoresOverall[id];
  int isSold = Random().nextInt(7); //Probabilidade de ser vendido
  int randomClubID = Random().nextInt(funcNumberClubsTotal());
  if(isSold == 0) {
    try{
    if(Club(index: currentClubID).nJogadores>18){ //se o clube atual tem o numero minimo de jogadores

      double destinyClubOverall = Club(index: randomClubID).getOverall();
      if(destinyClubOverall<playerOverall+7 && destinyClubOverall>playerOverall-7) { //se o clube for mais ou menos daquele potencial
        if(randomClubID != globalMyClubID && id != globalMyClubID){//se não é o meu time
          globalJogadoresClubIndex[id] = randomClubID; //vende o jogador
        }

        //Jogador player = Jogador(index: id);
        //print('Vendido ${player.name} /${player.clubName} ');

      }

    }
    }catch(e){
      //Jogador player = Jogador(index: id);
      //print('Erro: Jogador de liga inválida ${player.name} /${player.clubName} ');
    }
  }

}