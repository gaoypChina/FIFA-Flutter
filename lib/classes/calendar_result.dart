import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/mundial.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/result_game/result_game_internacional.dart';
import 'package:fifa/classes/result_game/result_game_nacional.dart';
import 'package:fifa/classes/result_game/result_match.dart';

class CalendarResult{
  ResultMatch show = ResultMatch();

  CalendarResult({required int semanaLocal,required Club club}) {
    Semana week = Semana(semanaLocal);
    if (week.isJogoCampeonatoNacional) {
      ResultGameNacional resultGameNacional = ResultGameNacional(
          rodadaLocal: week.rodadaNacional,
          club: club
      );
      show.fromResultGameNacional(resultGameNacional);
    }

    else if (week.isJogoCampeonatoInternacional) {
      ResultGameInternacional resultGameInternacional = ResultGameInternacional(
          weekLocal: semanaLocal,
          club: club,
          competitionName: club.internationalLeagueNamePlaying
      );

      show.fromResultGameInternacional(resultGameInternacional);

    }else if(week.isJogoMundial){
      MundialFinal mundial = MundialFinal();
      show.fromMundial(semanaLocal, club, mundial);
    }else if(week.isJogoCopa){
      show.fromCopa(semanaLocal, club);
    }
    else{
      show.setDefault(semanaLocal);
    }

  }

}