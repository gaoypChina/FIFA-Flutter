import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';

class TransferRules{
  late Jogador player;
  late Club playerClub;
  late Club destinyClub;
  TransferRules({required this.player,required this.playerClub,required this.destinyClub});

  bool isSameCountry(){
    return false;
  }



}

transferenciaJogador(int id){

  int isSold = Random().nextInt(4); //Probabilidade de ser vendido
  if(isSold == 0) {
    int currentClubID = globalJogadoresClubIndex[id];
    int playerOverall = globalJogadoresOverall[id];
    try{
    if(Club(index: currentClubID, clubDetails: false).nJogadores>18){ //se o clube atual tem o numero minimo de jogadores

      int randomClubID = Random().nextInt(globalNumberClubsTotal);
      double destinyClubOverall = Club(index: randomClubID,clubDetails: false).overallAproximated;
      if(destinyClubOverall<playerOverall+7 && destinyClubOverall>playerOverall-4) { //se o clube for mais ou menos daquele potencial
        if(randomClubID != globalMyClubID && currentClubID != globalMyClubID){//se não é o meu time
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