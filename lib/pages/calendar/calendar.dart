import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/result_game/result_match.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/result_game/result_game_internacional.dart';
import 'package:fifa/classes/result_game/result_game_nacional.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/calendar/calendar_adv_box.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  My myTeamClass = My();
  int nClubsLeague = (League(index: My().leagueID).nClubs) - 1;
  ScrollController _scrollController = ScrollController();
  late Club myClub;

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    myClub = Club(index: myTeamClass.clubID);
    _scrollController = ScrollController(initialScrollOffset: 125*((semana-1)-((semana-1)%3))/3);
    super.initState();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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

              backButtonText(context, Translation(context).text.calendar, true),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 8,right: 8,top: 8),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: List.generate(globalUltimaSemana, (index) {
                        return adversarioWidget(Semana(index + 1));
                      }),
                    ),
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

    }else if(weekLocal.isJogoCopa){
      ResultMatch show = ResultMatch();
      show.fromCopa(weekLocal.week, myClub);
      if(show.hasAdversary) {
        return wCalendarAdvBox(context, weekLocal.week, show);
      }else{
        return wCalendarNotPlayWidget(
            weekLocal.week,
            weekLocal.getTranslated(context),
            Images().getMyCupLogo()
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
