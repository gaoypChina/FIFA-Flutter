import 'package:fifa/classes/chaves.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/global_variables.dart';

class TableNational{

  late int choosenLeagueIndex;
  late int numeroDoConfronto;
  late League leagueClass;
  late int rodadaMatch;
  late bool showGoals;
  int gol1=0;
  int gol2=0;
  String teamName1 = "";
  String teamName2 = "";

  TableNational({required this.choosenLeagueIndex, required this.leagueClass,required this.rodadaMatch,required this.numeroDoConfronto}) {

  int weekCalculate = semanasJogosNacionais[rodadaMatch-1];
  List chave = Chaves().obterChave(weekCalculate,choosenLeagueIndex);
  int chaveClub1 = chave[numeroDoConfronto];
  teamName1 = leagueClass.getClubName(chaveClub1);
  int chaveClub2 = Chaves().chaveIndexAdvCampeonato((weekCalculate),  choosenLeagueIndex, chaveClub1)[0];
  teamName2 = leagueClass.getClubName(chaveClub2);

  showGoals = true;
  //quando chega na rodada max ele acabaria nao mostrando, por isso quando termina o campeonato mostra a ultima rodada
  if(showGoals) {
    try {
      List results = globalHistoricLeagueGoalsAll[rodadaMatch][choosenLeagueIndex];
      gol1 = results[chaveClub1];
      gol2 = results[chaveClub2];
    }catch(e){
      showGoals = false;
    }
  }
  }


}