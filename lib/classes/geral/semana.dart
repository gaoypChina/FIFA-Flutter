import 'package:fifa/classes/geral/name.dart';
import 'package:fifa/global_variables.dart';
import 'package:flutter/cupertino.dart';

class Semana{
  String semanaStr = semana.toString();
  int rodadaGroupInternational = 1;
  bool isJogoIdaMataMata = true;
  bool isJogoIdaLeague = true;
  bool isJogoMundial = semanaMundial.contains(semana);
  bool isJogoCampeonatoNacional = semanasJogosNacionais.contains(semana);
  bool isJogoCampeonatoInternacional = semanasJogosInternacionais.contains(semana);
  bool isJogoGruposInternacional = semanasGruposInternacionais.contains(semana);
  bool isJogoMataMataInternacional = semanasMataMataInternacionais.contains(semana);
  String semanaAlternativeStr = semana.toString(); //com o numero da rodada
  String semanaCalendarStr = semana.toString();

  Semana(int weekToCalculate){

    if(isJogoCampeonatoNacional) {
      semanaStr = semanasJogosNacionais.indexOf(weekToCalculate).toString();
      //TODO: ARRUMAR
      if(globalLeagueIdaVolta && semanasJogosNacionais.indexOf(weekToCalculate) > (globalNMaxRodadasNacional-1/2).round()){
        isJogoIdaLeague = false;
      }
    }
    if(semanasJogosCopas.contains(weekToCalculate)){semanaStr = 'Jogo das Copas';}
    else if(semanasGruposInternacionais.contains(weekToCalculate)){
      semanaStr = Name().groupsPhase;
      rodadaGroupInternational = semanasGruposInternacionais.indexOf(weekToCalculate)+1;}
    else if(semanaOitavas.contains(weekToCalculate)){semanaStr = Name().oitavas;    }
    else if(semanaQuartas.contains(weekToCalculate)){semanaStr = Name().quartas;}
    else if(semanaSemi.contains(weekToCalculate)){semanaStr = Name().semifinal;}
    else if(semanaFinal.contains(weekToCalculate)){semanaStr = Name().finale;}
    else if(semanaMundial.contains(weekToCalculate)){semanaStr = 'Mundial';}

    verifyIsMataMataIdaOrVolta(weekToCalculate);

    semanaAlternativeStr = semanaStr;
    if(semanasGruposInternacionais.contains(weekToCalculate)){
      semanaAlternativeStr += ' ${semanasGruposInternacionais.indexOf(weekToCalculate)+1}';
    }

    semanaCalendarStr = semanaStr;
    if(semanasJogosNacionais.contains(weekToCalculate)){
      semanaCalendarStr = 'Rodada ' + weekToCalculate.toString();
    }

    }

    verifyIsMataMataIdaOrVolta(int weekToCalculate){
      if(semanaOitavas.first == weekToCalculate || semanaQuartas.first == weekToCalculate
          || semanaSemi.first == weekToCalculate || semanaSemi.first == weekToCalculate){
        isJogoIdaMataMata = true;
      }else{
        isJogoIdaMataMata = false;
      }
    }

    getTranslated(BuildContext context){
      return Name().showTranslated(context, semanaStr);
    }

}