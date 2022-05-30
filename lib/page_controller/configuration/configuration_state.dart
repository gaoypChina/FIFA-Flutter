import 'dart:math';

import 'package:fifa/database/csv/read_csv.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/page_controller/configuration/open_url.dart';

class ConfigurationState{
  bool hasSoundEffect = globalHasSoundEffects;
  bool turnIdaEVolta = globalLeagueIdaVolta;
  bool hasCards = globalHasCards;
  bool allEqualPlayersOverall = globalAllEqualOverall;
  bool randomPlayersOverall = globalRandomPlayersOverall;
  bool hasInjuries = globalHasInjuries;
  bool seeProbability = globalSeeProbabilities;
  double initialMoney = globalInitialMoney;
  String coachName = globalCoachName;

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

  changeAllEqualPlayersOverallState(){
    allEqualPlayersOverall = !allEqualPlayersOverall;
    globalAllEqualOverall = !globalAllEqualOverall;
    if(globalAllEqualOverall){
      for(int id in globalJogadoresIndex){
        globalJogadoresOverall[id] = 75;
      }
    }else{
      ReadCSV().openCSV();
    }
  }

  changeAllRandomPlayersOverallState(){
    randomPlayersOverall = !randomPlayersOverall;
    globalRandomPlayersOverall = !globalRandomPlayersOverall;
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
    }else{
      ReadCSV().openCSV();
    }
  }


  changeSeeProbabilityState(){
    seeProbability = !seeProbability;
    globalSeeProbabilities = !globalSeeProbabilities;
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