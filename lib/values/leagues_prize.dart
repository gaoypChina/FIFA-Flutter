import 'package:fifa/classes/geral/dificuldade.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/values/league_names.dart';

void premiacao(){
  My myClass = My();
  double premio=0;
  String leagueName = myClass.campeonatoName;
  if(Semana().isJogoCampeonatoNacional){
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
    else if(leagueName==LeagueOfficialNames().ptHol){premio=1.6;}
    else if(leagueName==LeagueOfficialNames().ligaEuropa){premio=1.4;}//ocidente
    else if(leagueName==LeagueOfficialNames().lesteEuropeu){premio=1.4;}//leste
    else if(leagueName==LeagueOfficialNames().brasil1){premio=1.4;}//brasileiro
    else if(leagueName==LeagueOfficialNames().brasil2){premio=0.7;}//serie b
    else if(leagueName==LeagueOfficialNames().brasil3){premio=0.7;}//serie c
    else if(leagueName==LeagueOfficialNames().argentina){premio=1.1;}//argentina
    else if(leagueName==LeagueOfficialNames().sulamericano){premio=1.0;}//sulamerica
    else if(leagueName==LeagueOfficialNames().colombia){premio=1.1;}//colombia
    else if(leagueName==LeagueOfficialNames().mexico){premio=1.3;}//mexico
    else if(leagueName==LeagueOfficialNames().estadosUnidos){premio=1.4;}//mls
    else if(leagueName==LeagueOfficialNames().asia){premio=1.0;}//asia
    else if(leagueName==LeagueOfficialNames().africa){premio=0.6;}//africa
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