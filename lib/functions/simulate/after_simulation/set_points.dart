import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/global_variables.dart';

class SetPoints{

  set(int indexTeam1, int indexTeam2, int golTime1, int golTime2){

    if(Semana().isJogoCampeonatoNacional){
      pointsNational(indexTeam1,indexTeam2,golTime1,golTime2);
    }
    else if(Semana().isJogoCampeonatoInternacional) {
      pointsGroupInterNational(indexTeam1,indexTeam2,golTime1,golTime2);
    }

  }

  pointsNational(int indexTeam1, int indexTeam2, int golTime1, int golTime2){

    if (golTime1 > golTime2) {
      globalClubsLeaguePoints[indexTeam1] += 3;
    }
    if (golTime1 == golTime2) {
      globalClubsLeaguePoints[indexTeam1] += 1;
      globalClubsLeaguePoints[indexTeam2] += 1;
    }
    if (golTime1 < golTime2) {
      globalClubsLeaguePoints[indexTeam2] += 3;
    }

    globalClubsLeagueGM[indexTeam1] += golTime1;
    globalClubsLeagueGS[indexTeam1] += golTime2;

    globalClubsLeagueGM[indexTeam2] += golTime2;
    globalClubsLeagueGS[indexTeam2] += golTime1;
  }

  pointsGroupInterNational(int indexTeam1, int indexTeam2, int golTime1, int golTime2){
    if (golTime1 > golTime2) {
      globalClubsInternationalPoints[indexTeam1] += 3;
    } else if (golTime1 == golTime2) {
      globalClubsInternationalPoints[indexTeam1] += 1;
      globalClubsInternationalPoints[indexTeam2] += 1;
    } else if (golTime1 < golTime2) {
      globalClubsInternationalPoints[indexTeam2] += 3;
    }

    globalClubsInternationalGM[indexTeam1] += golTime1;
    globalClubsInternationalGS[indexTeam1] += golTime2;

    globalClubsInternationalGM[indexTeam2] += golTime2;
    globalClubsInternationalGS[indexTeam2] += golTime1;
  }

}