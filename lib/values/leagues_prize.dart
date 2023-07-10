import 'package:fifa/classes/functions/dificuldade.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

void premiacao(My myClass){

  LeagueOfficialNames l = LeagueOfficialNames();
  String leagueName = myClass.campeonatoName;
  double premio=0;

  if(Semana(semana).isJogoCampeonatoNacional){
    Map prizesMap = {
      l.inglaterra1: 2.2,
      l.inglaterra2: 1.2,
      l.inglaterra3: 0.7,
      l.italia1: 2.0,
      l.italia2: 1.0,
      l.espanha1: 2.0,
      l.espanha2: 1.0,
      l.alemanha1: 2.0,
      l.alemanha2: 1.0,
      l.franca1: 1.8,
      l.franca2: 0.5,
      l.portugal: 1.6,
      l.holanda: 1.6,
      l.turquiaGrecia: 1.5,
      l.ligaEuropa: 1.4,
      l.lesteEuropeu: 1.4,
      l.brasil1: 1.4,
      l.brasil2: 0.9,
      l.brasil3: 0.6,
      l.brasil4: 0.3,
      l.argentina: 1.1,
      l.mercosul: 1.0,
      l.colombia: 1.0,
      l.mexico: 1.3,
      l.estadosUnidos: 1.6,
      l.asia: 1.0,
      l.africa: 0.6,
    };

    if(prizesMap.containsKey(leagueName)){
      premio = prizesMap[leagueName];
    }else{
      premio=1.0;
    }

  }else if(Semana(semana).isJogoCopa) {
    //PREMIAÇÕES COPAS
    premio = 0.6;
  }else{
    if(myClass.getMyInternationalLeague() == l.championsLeague){
      premio=3;
      if(semanaOitavas.contains(rodada) || semanaQuartas.contains(rodada)) premio=4.0;
      if(semanaSemi.contains(rodada) || semanaFinal.contains(rodada)) premio=5.0;
    }
    else if(myClass.getMyInternationalLeague() == l.libertadores){
      premio=2;
      if(semanaOitavas.contains(rodada) || semanaQuartas.contains(rodada)) premio=2.5;
      if(semanaSemi.contains(rodada) || semanaFinal.contains(rodada)) premio=3.2;
    }
    else if(myClass.getMyInternationalLeague() == l.resto){
      premio=1.5;
      if(semanaOitavas.contains(rodada) || semanaQuartas.contains(rodada)) premio=2;
      if(semanaSemi.contains(rodada) || semanaFinal.contains(rodada)) premio=3;
    }
  }

  if(globalMyLeagueLastResults.last==1){premio=(premio/2);}
  if(globalMyLeagueLastResults.last==0){premio=(premio/3);}

  globalMyMoney += premio * DificuldadeClass().getDificuldadeMultiplicationValue();
}