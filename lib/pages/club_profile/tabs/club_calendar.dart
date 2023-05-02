import 'package:fifa/classes/calendar_result.dart';
import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:flutter/material.dart';

class ClubCalendar extends StatefulWidget {
  final Club club;
  const ClubCalendar({Key? key,required this.club}) : super(key: key);

  @override
  State<ClubCalendar> createState() => _ClubCalendarState();
}

class _ClubCalendarState extends State<ClubCalendar> {

  ///////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
  }

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(int i=1;i<globalUltimaSemana;i++)
                    calendarRow(i),

                ],
          ),
            ),
          ),
        ],
      ),
    );
  }


////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget calendarRow(int week){
    Semana semanaClass = Semana(week);
    CalendarResult calendarResult = CalendarResult(semanaLocal: week, club: widget.club);

    return GestureDetector(
      onTap: (){
        clickClubProfilePage(context, Club(index: calendarResult.show.clubID2));
      },
      child: Container(
        color: calendarResult.show.backgroundColor,
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Image.asset(FIFAImages().campeonatoLogo(calendarResult.show.competitionName),height:30,width: 30,),

            const SizedBox(width: 8),
            Column(
              children: [
                calendarResult.show.visitante
                    ? Text(Translation(context).text.away.toUpperCase(),style: EstiloTextoBranco.text12)
                    : Text(Translation(context).text.home.toUpperCase(),style: EstiloTextoBranco.text12),
                Text(calendarResult.show.placar,style: EstiloTextoBranco.text16),
              ],
            ),
            const SizedBox(width: 8),

            calendarResult.show.hasAdversary
                ? Images().getEscudoWidget(calendarResult.show.clubName2,30,30)
                : Container(),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(semanaClass.semanaCalendarStr,style: EstiloTextoBranco.text12),
                  calendarResult.show.hasAdversary
                      ? Text(calendarResult.show.clubName2,style: EstiloTextoBranco.text16)
                      : Container(),

                ],
              ),

          ],
        ),
      ),
    );
}

}
