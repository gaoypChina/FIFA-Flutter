import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/values/league_names.dart';

funcRebaixamentoLeague(String leagueName1,String leagueName2, int nClubsRebaixados){
  int leagueIDRebaixados = leaguesIndexFromName[leagueName1];
  int leagueIDClassificados = leaguesIndexFromName[leagueName2];
  //Classificão final da liga
  List clubIDRebaixados = League(index: leagueIDRebaixados).getClassification();
  List clubIDClassificados = League(index: leagueIDClassificados).getClassification();

  //troca os clubes
  int lengthLeague = clubIDRebaixados.length-1;
  for(int i=0;i<nClubsRebaixados;i++){

    String nameRebaixado = Club(index: clubIDRebaixados[lengthLeague-i]).name;
    String nameClassificado = Club(index: clubIDClassificados[i]).name;

    //GET POSIÇÃO DO CLUBNAME MAP
    int posicaoIndexRebaixado = -1;
    Map map1 = clubNameMap[leagueName1];
    map1.forEach((key, value) {
      if(value==nameRebaixado){
        posicaoIndexRebaixado = key;
      }
    });
    int posicaoIndexClassificado = -1;
    Map map2 = clubNameMap[leagueName2];
    map2.forEach((key, value) {
      if(value==nameClassificado){
        posicaoIndexClassificado = key;
      }
    });
    //TROCA
    if(posicaoIndexClassificado == -1 || posicaoIndexRebaixado ==-1){
      print('ERRO NA CLASSIFICAÇÃO DOS REBAIXADOS');
      // print(nameClassificado);
      // print(clubNameMap[leagueName1]);
      // print(nameRebaixado);
      // print(clubNameMap[leagueName2]);
    }else{
      clubNameMap[leagueName1][posicaoIndexRebaixado] = nameClassificado; //novo time serieA
      clubNameMap[leagueName2][posicaoIndexClassificado] = nameRebaixado; //novo time serieB
      }
  }
}