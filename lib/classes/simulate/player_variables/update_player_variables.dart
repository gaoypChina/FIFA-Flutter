
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/simulate/player_variables/cards_injury_selection.dart';
import 'package:fifa/classes/simulate/player_variables/goals_assists_selection.dart';
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



}