import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/global_variables.dart';
import 'package:flutter/cupertino.dart';

class Semana{
  String semanaStr = semana.toString();
  int week = semana;
  int rodadaNacional = 1;
  int rodadaGroupInternational = 1;
  bool isJogoIdaMataMata = true;
  bool isJogoIdaLeague = true;
  bool isJogoOitavasInternacional = semanaOitavas.contains(semana);
  bool isJogoQuartasInternacional = semanaQuartas.contains(semana);
  bool isJogoSemifinalInternacional = semanaSemi.contains(semana);
  bool isJogoFinalInternacional = semanaFinal.contains(semana);
  bool isJogoMundial = semanaMundial.contains(semana);
  bool isJogoCopa = semanasJogosCopas.contains(semana);
  bool isJogoCampeonatoNacional = semanasJogosNacionais.contains(semana);
  bool isJogoCampeonatoInternacional = semanasJogosInternacionais.contains(semana);
  bool isJogoGruposInternacional = semanasGruposInternacionais.contains(semana);
  bool isJogoMataMataInternacional = semanasMataMataInternacionais.contains(semana);
  String semanaAlternativeStr = semana.toString(); //com o numero da rodada
  String semanaCalendarStr = semana.toString();
  String realDate = weekRealDays[semana]!+"/"+ano.toString();

  Semana(int weekToCalculate){
    Name name = Name();

    week = weekToCalculate;
    realDate = weekRealDays[semana]!+"/"+ano.toString();

    isJogoMundial = semanaMundial.contains(weekToCalculate);
    isJogoCopa = semanasJogosCopas.contains(weekToCalculate);
    isJogoCampeonatoNacional = semanasJogosNacionais.contains(weekToCalculate);
    isJogoCampeonatoInternacional = semanasJogosInternacionais.contains(weekToCalculate);
    isJogoGruposInternacional = semanasGruposInternacionais.contains(weekToCalculate);
    isJogoMataMataInternacional = semanasMataMataInternacionais.contains(weekToCalculate);

    isJogoOitavasInternacional = semanaOitavas.contains(weekToCalculate);
    isJogoQuartasInternacional = semanaQuartas.contains(weekToCalculate);
    isJogoSemifinalInternacional = semanaSemi.contains(weekToCalculate);
    isJogoFinalInternacional = semanaFinal.contains(weekToCalculate);


    if(isJogoCampeonatoNacional) {
      rodadaNacional = semanasJogosNacionais.indexOf(weekToCalculate)+1;
      semanaStr = rodadaNacional.toString();
      //TODO: ARRUMAR
      if(globalLeagueIdaVolta && semanasJogosNacionais.indexOf(weekToCalculate) > (globalNMaxRodadasNacional-1/2).round()){
        isJogoIdaLeague = false;
      }
    }
    if(semanasJogosCopas.contains(weekToCalculate)){semanaStr = 'Jogo das Copas';}
    else if(isJogoGruposInternacional){
      semanaStr = name.groupsPhase;
      rodadaGroupInternational = semanasGruposInternacionais.indexOf(weekToCalculate)+1;}
    else if(semanaOitavas.contains(weekToCalculate)){semanaStr = name.oitavas;    }
    else if(semanaQuartas.contains(weekToCalculate)){semanaStr = name.quartas;}
    else if(semanaSemi.contains(weekToCalculate)){semanaStr = name.semifinal;}
    else if(semanaFinal.contains(weekToCalculate)){semanaStr = name.finale;}
    else if(semanaMundial.contains(weekToCalculate)){semanaStr = name.mundial;}

    verifyIsMataMataIdaOrVolta(weekToCalculate);

    semanaAlternativeStr = semanaStr;
    if(semanasGruposInternacionais.contains(weekToCalculate)){
      semanaAlternativeStr += ' ${semanasGruposInternacionais.indexOf(weekToCalculate)+1}';
    }

    semanaCalendarStr = semanaStr;
    if(isJogoCampeonatoNacional){
      semanaCalendarStr = 'Rodada ' + (rodadaNacional).toString();
    }

    if(!isJogoCampeonatoNacional && !isJogoCampeonatoInternacional && !isJogoMundial){
      semanaCalendarStr = "Week " + week.toString();
    }

}

    verifyIsMataMataIdaOrVolta(int weekToCalculate){
      if(semanaOitavas.first == weekToCalculate || semanaQuartas.first == weekToCalculate
          || semanaSemi.first == weekToCalculate || semanaFinal.first == weekToCalculate){
        isJogoIdaMataMata = true;
      }else{
        isJogoIdaMataMata = false;
      }
    }

    getTranslated(BuildContext context){
      return Name().showTranslated(context, semanaCalendarStr);
    }

}