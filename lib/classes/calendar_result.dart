import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/mundial.dart';
import 'package:fifa/classes/result_game/result_game_internacional.dart';
import 'package:fifa/classes/result_game/result_game_nacional.dart';
import 'package:fifa/classes/result_game/result_match.dart';
import 'package:fifa/classes/semana.dart';

class CalendarResult{
  ResultMatch show = ResultMatch();

  CalendarResult({required int semanaLocal,required Club club}) {
    Semana week = Semana(semanaLocal);
    if (week.isJogoCampeonatoNacional) {
      ResultGameNacional resultGameNacional = ResultGameNacional(
          rodadaLocal: week.rodadaNacional,
          club: club
      );
      show = resultGameNacional;
    }

    else if (week.isJogoCampeonatoInternacional) {
      ResultGameInternational resultGameInternational = ResultGameInternational(
          weekLocal: semanaLocal,
          club: club,
          competitionName: club.internationalLeagueNamePlaying
      );

      show = resultGameInternational;

    }else if(week.isJogoMundial){
      MundialFinal mundial = MundialFinal();
      show.fromMundial(semanaLocal, club, mundial);
    }else if(week.isJogoCopa){
      show.fromCopa(semanaLocal, club);
      if(show.hasAdversary && club.name == show.clubName2){
        show.invertTeams();
      }
    }
    else{
      show.setDefault(semanaLocal);
    }

  }

}