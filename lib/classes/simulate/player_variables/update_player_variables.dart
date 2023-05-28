
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/simulate/player_variables/cards_injury_selection.dart';
import 'package:fifa/classes/simulate/player_variables/goals_assists_selection.dart';
import 'package:fifa/classes/simulate/player_variables/origin/clean_sheets.dart';
import 'package:fifa/global_variables.dart';

class UpdatePlayerVariable{

  late Club clubClass;

  setCardsInjuryUpdate(Club clubClass,bool isMyMatch){
    CardsInjury().setRedCardsYellowCardsInjury(clubClass,isMyMatch);
  }

  setGoalAndAssists(Club clubClass){

    if(Semana(semana).isJogoCampeonatoNacional){
      GoalAssistsSelection().goalsAssistsNational(clubClass);
    }
    if(Semana(semana).isJogoCampeonatoInternacional) {
      GoalAssistsSelection().goalsAssistsInternational(clubClass);
    }

    if(Semana(semana).isJogoCopa){
      GoalAssistsSelection().goalsAssistsCup(clubClass);
    }

  }

  setGoalkeeperStats(Club clubClass, int goalsTaken){
    if(Semana(semana).isJogoCampeonatoNacional){
      CleanSheets().saveNational(clubClass.escalacao[0], goalsTaken);
    }
    if(Semana(semana).isJogoCampeonatoInternacional) {
      CleanSheets().saveInternational(clubClass.escalacao[0], goalsTaken);
    }

    if(Semana(semana).isJogoCopa){
      CleanSheets().saveCup(clubClass.escalacao[0], goalsTaken);
    }
  }


}