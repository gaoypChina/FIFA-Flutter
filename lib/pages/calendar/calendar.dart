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
              reverse: (semana>globalUltimaSemana/2) ? true : false,
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  for (int i=1;i<=globalUltimaSemana;i++)
                    adversarioWidget(Semana(i)),
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
  Widget adversarioWidget(Semana weekLocal){
    Club myClub = Club(index: myTeamClass.clubID);
    if(weekLocal.isJogoCampeonatoNacional){
      ResultGameNacional show = ResultGameNacional(
          rodadaLocal: weekLocal.rodadaNacional,
          club: myClub
      );

      if(weekLocal.rodadaNacional <= nClubsLeague){
        return wCalendarAdvBox(context, weekLocal.week, show);
      }else{
        return wCalendarNotPlayWidget(
          weekLocal.week,
          weekLocal.semanaCalendarStr,
          Images().getMyLeagueLogo(),
        );
      }

    }else if(weekLocal.isJogoCampeonatoInternacional){
      ResultGameInternacional show = ResultGameInternacional(
          weekLocal: weekLocal.week,
          club: myClub,
          competitionName: myTeamClass.playingInternational
      );
      if(show.hasAdversary) {
        return wCalendarAdvBox(context, weekLocal.week, show);
      }else{
        return wCalendarNotPlayWidget(
            weekLocal.week,
            weekLocal.getTranslated(context),
            Images().getMyInternationalLeagueLogo()
        );
      }

    }else if(weekLocal.isJogoMataMataInternacional){
      ResultGameInternacional show = ResultGameInternacional(
          weekLocal: weekLocal.week,
          club: myClub,
          competitionName: myTeamClass.playingInternational
      );
      if(show.hasAdversary && semana >= semanasMataMataInternacionais.first) {
        return wCalendarAdvBox(context, weekLocal.week, show);
      }else{
        return wCalendarNotPlayWidget(
            weekLocal.week,
            weekLocal.getTranslated(context),
            Images().getMyInternationalLeagueLogo()
        );
      }

    }else if(weekLocal.isJogoMundial){
      return wCalendarNotPlayWidget(
          weekLocal.week,
          weekLocal.getTranslated(context),
          Images().getMundialLogo()
      );
    }
    return wCalendarNotPlayWidget(weekLocal.week, '');
  }








}
