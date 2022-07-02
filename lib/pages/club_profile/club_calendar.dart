import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/page_controller/club_profile/club_calendar_controller.dart';
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
    ClubCalendarController controller = ClubCalendarController(widget.club);
    controller.getWeekInfos(week);

    return Container(
      color: controller.backgroundColor,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Image.asset(FIFAImages().campeonatoLogo(controller.competitionName),height:30,width: 30,),
          const SizedBox(width: 8),
          controller.hasAdversaryDefined
              ? Image.asset(Images().getEscudo(controller.club2.name),height:30,width: 30,)
              : Container(),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                  Row(
                    children: [
                      Expanded(child: Text(semanaClass.semanaCalendarStr,style: EstiloTextoBranco.text12)),
                      controller.visitante
                          ? Text(Translation(context).text.away.toUpperCase(),style: EstiloTextoBranco.text12)
                          : Text(Translation(context).text.home.toUpperCase(),style: EstiloTextoBranco.text12),
                      const SizedBox(width: 8),
                    ],
                  ),

                  Row(
                    children: [
                      controller.hasAdversaryDefined
                          ? Expanded(child: Text(controller.club2.name,style: EstiloTextoBranco.text16))
                          : Expanded(child: Container()),
                      Text(controller.placar,style: EstiloTextoBranco.text16),
                      const SizedBox(width: 8),
                    ],
                  ),

              ],
            ),
          ),

        ],
      ),
    );
}

}
