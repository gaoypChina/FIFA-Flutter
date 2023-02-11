import 'package:fifa/classes/functions/dificuldade.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

void premiacao(){
  My myClass = My();
  double premio=0;
  String leagueName = myClass.campeonatoName;
  if(Semana(semana).isJogoCampeonatoNacional){
    if(leagueName==LeagueOfficialNames().inglaterra1){premio=2.2;}//premierleague
    else if(leagueName==LeagueOfficialNames().inglaterra2){premio=1.2;}//championship
    else if(leagueName==LeagueOfficialNames().inglaterra3){premio=0.7;}//championship
    else if(leagueName==LeagueOfficialNames().italia1
        || leagueName==LeagueOfficialNames().espanha1
        ||leagueName==LeagueOfficialNames().alemanha1){premio=2.0;}//italia, espanha, alemanha
    else if(leagueName==LeagueOfficialNames().italia2){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().espanha2){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().alemanha2){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().franca1){premio=1.8;}//frances
    else if(leagueName==LeagueOfficialNames().franca2){premio=0.5;}
    else if(leagueName==LeagueOfficialNames().portugal){premio=1.6;}
    else if(leagueName==LeagueOfficialNames().holanda){premio=1.6;}
    else if(leagueName==LeagueOfficialNames().turquiaGrecia){premio=1.5;}
    else if(leagueName==LeagueOfficialNames().ligaEuropa){premio=1.4;}//ocidente
    else if(leagueName==LeagueOfficialNames().lesteEuropeu){premio=1.4;}//leste
    else if(leagueName==LeagueOfficialNames().brasil1){premio=1.4;}//brasileiro
    else if(leagueName==LeagueOfficialNames().brasil2){premio=0.7;}//serie b
    else if(leagueName==LeagueOfficialNames().brasil3){premio=0.7;}//serie c
    else if(leagueName==LeagueOfficialNames().argentina){premio=1.1;}//argentina
    else if(leagueName==LeagueOfficialNames().mercosul){premio=1.0;}//sulamerica
    else if(leagueName==LeagueOfficialNames().colombia){premio=1.1;}//colombia
    else if(leagueName==LeagueOfficialNames().mexico){premio=1.3;}//mexico
    else if(leagueName==LeagueOfficialNames().estadosUnidos){premio=1.4;}//mls
    else if(leagueName==LeagueOfficialNames().asia){premio=1.0;}//asia
    else if(leagueName==LeagueOfficialNames().africa){premio=0.6;}//africa

    //PREMIAÇÕES COPAS
    else if(leagueName==LeagueOfficialNames().englandCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().italyCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().spainCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().germanyCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().franceCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().portugalCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().turkeyCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().ligaEuropaCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().eastEuropeCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().brazilCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().argentinaCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().mercosulCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().merconorteCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().mexicoCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().usaCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().asiaCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().africaCup){premio=0.6;}
    else if(leagueName==LeagueOfficialNames().othersCup){premio=0.6;}

    else{
      premio=1.0;
    }

  }else{
    if(myClass.getMyInternationalLeague() == LeagueOfficialNames().championsLeague){
      premio=3;
      if(semanaOitavas.contains(rodada) || semanaQuartas.contains(rodada)) premio=4.0;
      if(semanaSemi.contains(rodada) || semanaFinal.contains(rodada)) premio=5.0;
    }
    if(myClass.getMyInternationalLeague() == LeagueOfficialNames().libertadores){
      premio=2;
      if(semanaOitavas.contains(rodada) || semanaQuartas.contains(rodada)) premio=2.5;
      if(semanaSemi.contains(rodada) || semanaFinal.contains(rodada)) premio=3.2;
    }
    if(myClass.getMyInternationalLeague() == LeagueOfficialNames().resto){
      premio=1.5;
      if(semanaOitavas.contains(rodada) || semanaQuartas.contains(rodada)) premio=2;
      if(semanaSemi.contains(rodada) || semanaFinal.contains(rodada)) premio=3;
    }
  }

  if(globalMyLeagueLastResults.last==1){premio=(premio/2);}
  if(globalMyLeagueLastResults.last==0){premio=(premio/3);}

  globalMyMoney += premio * DificuldadeClass().getDificuldadeMultiplicationValue();
}