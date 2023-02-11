import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/result_game/result_game_internacional.dart';
import 'package:fifa/classes/result_game/result_game_nacional.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/calendar/calendar_adv_box.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  My myTeamClass = My();
  int nClubsLeague = (League(index: My().leagueID).nClubs) - 1;

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(children: [

          Images().getWallpaper(),

      Column(
        children: [
          backButtonText(context, Translation(context).text.calendar),
          Container(
            margin: const EdgeInsets.all(8),
            height: Sized(context).height-95,
            child: SingleChildScrollView(
              reverse: (Semana(semana).isJogoCampeonatoInternacional) ? true : false,
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  for (int i=1;i<=globalUltimaSemana;i++)
                    adversarioWidget(i),
                ],
              ),
            ),
          ),
        ],
      ),
    ]));
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget adversarioWidget(int semanaLocal){
    Club myClub = Club(index: myTeamClass.clubID);
    if(Semana(semanaLocal).isJogoCampeonatoNacional){
      ResultGameNacional show = ResultGameNacional(
          rodadaLocal: Semana(semanaLocal).rodadaNacional,
          club: myClub
      );

      if(Semana(semanaLocal).rodadaNacional <= nClubsLeague){
        return wCalendarAdvBox(context, semanaLocal, show);
      }else{
        return wCalendarNotPlayWidget(
          semanaLocal,
          Semana(semanaLocal).semanaCalendarStr,
          Images().getMyLeagueLogo(),
        );
      }

    }else if(Semana(semanaLocal).isJogoCampeonatoInternacional){
      ResultGameInternacional show = ResultGameInternacional(
          weekLocal: semanaLocal,
          club: myClub,
          competitionName: myTeamClass.playingInternational
      );
      if(show.hasAdversary && semana >= semanasJogosInternacionais.first) {
        return wCalendarAdvBox(context, semanaLocal, show);
      }else{
        return wCalendarNotPlayWidget(
            semanaLocal,
            Semana(semanaLocal).getTranslated(context),
            Images().getMyInternationalLeagueLogo()
        );
      }

    }else if(Semana(semanaLocal).isJogoMataMataInternacional){
      ResultGameInternacional show = ResultGameInternacional(
          weekLocal: semanaLocal,
          club: myClub,
          competitionName: myTeamClass.playingInternational
      );
      if(show.hasAdversary && semana >= semanasMataMataInternacionais.first) {
        return wCalendarAdvBox(context, semanaLocal, show);
      }else{
        return wCalendarNotPlayWidget(
            semanaLocal,
            Semana(semanaLocal).getTranslated(context),
            Images().getMyInternationalLeagueLogo()
        );
      }

    }else if(Semana(semanaLocal).isJogoMundial){
      return wCalendarNotPlayWidget(
          semanaLocal,
          Semana(semanaLocal).getTranslated(context),
          Images().getMundialLogo()
      );
    }
    return wCalendarNotPlayWidget(semanaLocal, '');
  }








}
