import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/simulate/after_simulation/historic.dart';
import 'package:fifa/functions/simulate/my_match/my_match_simulation.dart';
import 'package:fifa/functions/simulate/player_variables/cards_injury_selection.dart';
import 'package:fifa/functions/simulate/player_variables/match_selection.dart';
import 'package:flutter/cupertino.dart';

import '../../../values/leagues_prize.dart';

class PosturaDoTimeClass{
  String defesa = 'Defesa';
  String normal = 'Normal';
  String ataque = 'Ataque';
  String value = 'Normal';

  setValue(String newValue){
    value = newValue;
  }
}

class CounterMatch extends ChangeNotifier{

  int milis = 0;
  late My myClass;
  late Club adversarioClubClass;
  bool finishedMatch = false;
  late MyMatchSimulation myMatchSimulation;
  late PosturaDoTimeClass posturaDoTime;

  start(My myClass,Club adversarioClubClass, MyMatchSimulation myMatchSimulation, PosturaDoTimeClass posturaDoTime){
    this.myClass = myClass;
    this.adversarioClubClass = adversarioClubClass;
    this.myMatchSimulation = myMatchSimulation;
    this.posturaDoTime = posturaDoTime;
  }

  simulateMinute () async {
    Club myClubClass = Club(index: myClass.clubID);

      milis+=1;
      if(milis>90){
        milis = 90;
        if(!finishedMatch){
          myMatchSimulation.endMatch(); //set vitoria, empate ou derrota

          premiacao(); //dinheiro

          //update poe +1 match pros meus jogadores
          UpdatePlayerVariableMatch().update(myClubClass);
          UpdatePlayerVariableMatch().update(adversarioClubClass);

          CardsInjury().setMinus1InjuryRedYellowCardAllTeam(myClubClass);
          CardsInjury().setMinus1InjuryRedYellowCardAllTeam(adversarioClubClass);

          //salva resultado no histórico
          if(Semana().isJogoCampeonatoNacional){
            SaveMatchHistoric().setHistoricGoalsLeagueMy(myMatchSimulation);
          }else if(Semana().isJogoGruposInternacional){
            SaveMatchHistoric().setHistoricGoalsGruposInternational(myClass.getMyInternationalLeague(), myClass.clubID, adversarioClubClass.index,myMatchSimulation.meuGolMarcado, myMatchSimulation.meuGolSofrido);
          }else if(Semana().isJogoMataMataInternacional){
            SaveMatchHistoric().setHistoricGoalsMataMataInternational(myClass.getMyInternationalLeague(), myClass.clubID, adversarioClubClass.index,myMatchSimulation.meuGolMarcado, myMatchSimulation.meuGolSofrido);
          }

          finishedMatch = true;
        }
      }else{
        //ATUALIZAÇÃO DE PARAMENTROS DA SIMULAÇAO
        myMatchSimulation.updateMilis(milis);
        myMatchSimulation.golPorMinuto(posturaDoTime, myClubClass.getOverall(), adversarioClubClass.getOverall());
        myMatchSimulation.updateHealth(myClubClass,adversarioClubClass);
        CardsInjury().setRedCardsYellowCardsInjury(myClubClass, true);
        CardsInjury().setRedCardsYellowCardsInjury(adversarioClubClass, true);

        notifyListeners();
      }
  }
}