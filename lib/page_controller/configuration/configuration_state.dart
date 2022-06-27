import 'dart:math';

import 'package:fifa/database/csv/read_csv.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/page_controller/configuration/open_url.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';

class ConfigurationState{
  bool hasSoundEffect = globalHasSoundEffects;
  bool turnIdaEVolta = globalLeagueIdaVolta;
  bool hasCards = globalHasCards;
  bool hasInjuries = globalHasInjuries;
  bool seeProbability = globalSeeProbabilities;
  bool randomizePlayers = globalRandomizePlayers;
  double initialMoney = globalInitialMoney;
  String coachName = globalCoachName;

  List<bool?> states = [false,globalAllEqualOverall,globalRandomPlayersOverall];
  List<String> names = ['','',''];

  changeSoundEffectSwitchState(){
    hasSoundEffect = !hasSoundEffect;
  }
  changeTurnSwitchState(){
    turnIdaEVolta = !turnIdaEVolta;
    globalLeagueIdaVolta = !globalLeagueIdaVolta;

    globalNMaxRodadasNacional = globalLeagueIdaVolta ? 30 : 15;

      semanaOitavas = [semanasJogosInternacionais.first+6,semanasJogosInternacionais.first+7];
          semanaQuartas = [semanasJogosInternacionais.first+8,semanasJogosInternacionais.first+9];
          semanaSemi = [semanasJogosInternacionais.first+10,semanasJogosInternacionais.first+11];
          semanaFinal = [semanasJogosInternacionais.first+12];
          semanaMundial = [semanasJogosInternacionais.last];
      semanasJogosInternacionais = [for(var i=semanasJogosNacionais.last+1; i<=semanasJogosNacionais.last+13; i++) i];
      semanasGruposInternacionais = semanasJogosInternacionais.take(6).toList();
      semanasMataMataInternacionais = semanaOitavas+semanaQuartas+semanaSemi+semanaFinal;
      semanasJogosNacionais = [for(var i=1; i<=globalNMaxRodadasNacional; i++) i];
      semanasJogosCopas = [];
      globalUltimaSemana = semanasJogosInternacionais.last;
  }

  changeCardsState(){
    hasCards = !hasCards;
  }
  changeInjuryState(){
    hasInjuries = !hasInjuries;
  }
  changeRandomizePlayersState(){
    globalRandomizePlayers = !globalRandomizePlayers;
    randomizePlayers = globalRandomizePlayers;
  }

  setInitialCheckboxState(BuildContext context){
    if(states[1] == true){
      setListBool(1);
    }
    else if(states[2] == true){
      setListBool(2);
    }else{
      setListBool(0);
    }
    names = [Translation(context).text.playersNormalOveerall,
             Translation(context).text.allPlayersEqual,
              Translation(context).text.allPlayersRandom];
  }
  setListBool(int index){
    states = List.filled(3, false);
    states[index] = true;
  }
  setStates(int index){
    setListBool(index);
    if(index == 0){
      globalAllEqualOverall = false;
      globalRandomPlayersOverall = false;
      ReadCSV().openCSV();
    }
    if(index==1){
      globalAllEqualOverall = true;
      globalRandomPlayersOverall = false;
      changeAllEqualPlayersOverallState();
    }
    if(index==2){
      globalAllEqualOverall = false;
      globalRandomPlayersOverall = true;
      changeAllRandomPlayersOverallState();
    }
  }

  changeAllEqualPlayersOverallState(){
    if(globalAllEqualOverall){
      for(int id in globalJogadoresIndex){
        globalJogadoresOverall[id] = 75;
      }
    }
  }

  changeAllRandomPlayersOverallState(){
    if(globalRandomPlayersOverall){
      for(int id in globalJogadoresIndex){
        int probLucky = Random().nextInt(50);
        int prob = 55+Random().nextInt(39);
        if(prob>88){
          if(probLucky < 49){
            prob -= 7;
          }
        }
        if(prob>85){
          if(probLucky < 47){
            prob -= 5;
          }
        }
        if(prob>81){
          if(probLucky < 42){
            prob -= 3;
          }
        }

        //Ajusta um pouco pela idade
        if(globalJogadoresAge[id]<19){
          prob -= 8;
        }else if(globalJogadoresAge[id]<23){
          prob -= 5;
        }else if(globalJogadoresAge[id]>35){
          prob -= 5;
        }

        globalJogadoresOverall[id] = prob;
      }
    }
  }


  changeSeeProbabilityState(){
    globalSeeProbabilities = !globalSeeProbabilities;
    seeProbability = globalSeeProbabilities;
  }

  setInitialMoney(double value){
    initialMoney = value;
    globalInitialMoney = value;
  }

  openTerms(){
    final Uri _url = Uri.parse('https://www.davaiapp.com');
    funcOpenLink(_url);
  }
}