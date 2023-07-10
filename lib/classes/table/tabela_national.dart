import 'package:fifa/classes/chaves.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/global_variables.dart';

class TableNational{

  late int chosenLeagueIndex;
  late int matchNumber;
  late League leagueClass;
  late int rodadaMatch;

  late Confronto confronto;

  TableNational({required this.chosenLeagueIndex, required this.leagueClass,required this.rodadaMatch,required this.matchNumber}) {

  int weekCalculate = semanasJogosNacionais[rodadaMatch-1];
  List chave = Chaves().obterChave(weekCalculate,chosenLeagueIndex);
  int chaveClub1 = chave[matchNumber];
  int chaveClub2 = Chaves().chaveIndexAdvCampeonato((weekCalculate),  chosenLeagueIndex, chaveClub1)[0];
  confronto = Confronto(clubName1: leagueClass.getClubName(chaveClub1), clubName2: leagueClass.getClubName(chaveClub2));

  if (globalHistoricLeagueGoalsAll.containsKey(rodadaMatch)
          && globalHistoricLeagueGoalsAll[rodadaMatch].containsKey(chosenLeagueIndex)
  ){
    List results = globalHistoricLeagueGoalsAll[rodadaMatch][chosenLeagueIndex];
    confronto.setGoals(goal1: results[chaveClub1], goal2: results[chaveClub2]);
  }

  }


}