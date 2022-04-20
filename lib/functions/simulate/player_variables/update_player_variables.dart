
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/functions/simulate/player_variables/cards_injury_selection.dart';
import 'package:fifa/functions/simulate/player_variables/goals_assists_selection.dart';
import 'package:fifa/global_variables.dart';

import 'match_selection.dart';


class UpdatePlayerVariable{

  late Club clubClass;

  setMatchUpdate(Club clubClass){
    UpdatePlayerVariableMatch().update(clubClass);
  }

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

  }



}