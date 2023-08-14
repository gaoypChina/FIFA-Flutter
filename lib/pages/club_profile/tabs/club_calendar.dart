import 'package:fifa/classes/calendar_result.dart';
import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/menu/c_menu.dart';
import 'package:fifa/pages/menu/widgets/play_button.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:fifa/widgets/popup/popup_simulation.dart';
import 'package:flutter/material.dart';

class ClubCalendar extends StatefulWidget {
  final Club club;
  const ClubCalendar({Key? key,required this.club}) : super(key: key);

  @override
  State<ClubCalendar> createState() => _ClubCalendarState();
}

class _ClubCalendarState extends State<ClubCalendar> {

  final ScrollController _controller = ScrollController(initialScrollOffset: semana.ceilToDouble()*50);
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
            padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
            child: SingleChildScrollView(
              controller: _controller,
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

    double heightSize = 50;
    Semana weekClass = Semana(week);
    CalendarResult calendarResult = CalendarResult(semanaLocal: week, club: widget.club);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: PressableButton(
        onTap: (){
          clickClubProfilePage(context, Club(index: calendarResult.show.clubID2));
        },
        child: Container(
          height: heightSize,
          color: calendarResult.show.backgroundColor,
          child: Stack(
            children: [

              calendarResult.show.hasAdversary && calendarResult.show.visitante
                  ? Opacity(opacity: 0.3, child: Images().getStadiumWidget(calendarResult.show.clubName2,heightSize,Sized(context).width))
                  : Container(),

              Container(
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
                        Text(calendarResult.show.placar,style: EstiloTextoBranco.negrito18),
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

                          Text(weekClass.semanaCalendarStr,style: EstiloTextoBranco.text12),
                          calendarResult.show.hasAdversary
                              ? Text(calendarResult.show.clubName2,style: EstiloTextoBranco.negrito16)
                              : Container(),

                        ],
                      ),

                    const Spacer(),

                    calendarResult.show.hasAdversary
                        ? Images().getUniformWidget(calendarResult.show.clubName2,30,30)
                        : Container(),

                    widget.club.name == My().clubName && week >= semana? InkWell(
                      onTap:(){
                        popUpSimulation(context: context,
                            week: week,
                            name: weekClass.semanaCalendarStr,
                            function: () async{
                              await simulateManyWeeksFunction(context,week);
                              Navigator.pop(context);
                              navigatorReplace(context, const Menu());
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Icon(Icons.timer_outlined,color: Colors.white,size: 25),
                      ),
                    ) : Container(),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
}

}
