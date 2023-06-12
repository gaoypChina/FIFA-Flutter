import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/simulate/after_simulation/historic.dart';
import 'package:fifa/classes/simulate/my_match/my_match_simulation.dart';
import 'package:fifa/classes/simulate/player_variables/cards_injury_selection.dart';
import 'package:fifa/classes/simulate/player_variables/match_selection.dart';
import 'package:fifa/global_variables.dart';
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
  late Club myClubClass;
  bool finishedMatch = false;
  late MyMatchSimulation myMatchSimulation;
  late PosturaDoTimeClass posturaDoTime;

  start(My myClass,Club adversarioClubClass, MyMatchSimulation myMatchSimulation, PosturaDoTimeClass posturaDoTime){
    this.myClass = myClass;
    myClubClass = Club(index: myClass.clubID);
    this.adversarioClubClass = adversarioClubClass;
    this.myMatchSimulation = myMatchSimulation;
    this.posturaDoTime = posturaDoTime;
  }

  simulateMinute () async {
    //ANTES DE COMEÇAR O JOGO
    if(milis==0){
      CardsInjury().setMinus1InjuryRedYellowCardAllTeam(myClubClass);
      CardsInjury().setMinus1InjuryRedYellowCardAllTeam(adversarioClubClass);
    }

      milis+=1;
      if(milis>90){
        milis = 90;
        endOfMatch();
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

  endOfMatch(){
    Club myClubClass = Club(index: myClass.clubID);
    if(!finishedMatch){
      myMatchSimulation.endMatch(); //set vitoria, empate ou derrota

      premiacao(); //dinheiro

      //update poe +1 match pros meus jogadores
      UpdatePlayerVariableMatch().update(myClubClass);
      UpdatePlayerVariableMatch().update(adversarioClubClass);

      //salva resultado no histórico
      saveHistoricResults();

      //Reseta a saude de todos os jogadores
      globalJogadoresHealth = List.filled(globalMaxPlayersPermitted, 1.0);

      finishedMatch = true;
    }
  }

  saveHistoricResults(){
    if(Semana(semana).isJogoCampeonatoNacional){
      SaveMatchHistoric().setHistoricGoalsLeagueMy(myMatchSimulation);
    }else if(Semana(semana).isJogoGruposInternacional){
      SaveMatchHistoric().setHistoricGoalsGruposInternational(myClass.getMyInternationalLeague(), myClass.clubID, adversarioClubClass.index,myMatchSimulation.meuGolMarcado, myMatchSimulation.meuGolSofrido);
    }
  }
}