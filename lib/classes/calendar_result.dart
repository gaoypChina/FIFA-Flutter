import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/result_game/result_game_internacional.dart';
import 'package:fifa/classes/result_game/result_game_nacional.dart';
import 'package:fifa/classes/result_game/result_match.dart';

class CalendarResult{
  ResultMatch show = ResultMatch();

  CalendarResult({required int semanaLocal,required Club club}) {

    if (Semana(semanaLocal).isJogoCampeonatoNacional) {
      ResultGameNacional resultGameNacional = ResultGameNacional(
          rodadaLocal: Semana(semanaLocal).rodadaNacional,
          club: club
      );
      show.fromResultGameNacional(resultGameNacional);
    }

    else if (Semana(semanaLocal).isJogoCampeonatoInternacional) {
      ResultGameInternacional resultGameInternacional = ResultGameInternacional(
          weekLocal: semanaLocal,
          club: club,
          competitionName: club.internationalLeagueNamePlaying
      );

      show.fromResultGameInternacional(resultGameInternacional);

    }else{
      show.setDefault(semanaLocal);
    }

  }

}