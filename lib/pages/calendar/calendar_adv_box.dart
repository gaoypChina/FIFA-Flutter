import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/pages/club_profile/tabs/club_calendar.dart';
import 'package:fifa/pages/menu/c_menu.dart';
import 'package:fifa/pages/menu/widgets/play_button.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  final Club club;
  const CalendarPage({Key? key, required this.club}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),
          Column(
            children: [
              backButtonText(context, "Calendar", true),
              Expanded(child: ClubCalendar(club: widget.club)),
            ],
          ),
        ],
      ),
    );
  }
}







Widget wCalendarAdvBox(BuildContext context, int semanaLocal, show){
  //OLD CALENDAR LAYOUT
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        navigatorPush(context, ClubProfile(clubID: show.clubID2));
      },
      child: Container(
        width: 122,
        height: 148,
        color: show.backgroundColor,
        child: Column(
          children: [
            const SizedBox(height: 4),
            Text(Semana(semanaLocal).getTranslated(context),style: EstiloTextoBranco.negrito14),
            SizedBox(
              height: 45,
              width: 80,
              child: Stack(
                children: [
                  show.visitante
                      ? Image.asset(Images().getStadium(show.clubName2),height: 90, width: 90)
                      : Container(),
                  Semana(semanaLocal).isJogoCampeonatoInternacional
                      ? Image.asset(Images().getMyInternationalLeagueLogo(),height: 22, width: 22)
                      : Semana(semanaLocal).isJogoCampeonatoNacional
                        ? Image.asset(Images().getMyLeagueLogo(),height: 22, width: 22)
                        : Semana(semanaLocal).isJogoCopa
                          ? Image.asset(Images().getMyCupLogo(),height: 22, width: 22)
                            : Container(),
                  Center(child: Images().getEscudoWidget(show.clubName2,45,45)),
                ],
              ),
            ),
            show.visitante
                ? Text(Translation(context).text.away.toUpperCase(),
                style: EstiloTextoBranco.text10, textAlign: TextAlign.center)
                : Text(Translation(context).text.home.toUpperCase(),
                style: EstiloTextoBranco.text10, textAlign: TextAlign.center),
            Text(show.clubName2,
                overflow: TextOverflow.fade,
                style: show.clubName2.length>16 ? EstiloTextoBranco.text12 : EstiloTextoBranco.text14,
                textAlign: TextAlign.center),
            Text('${show.placar}',
                style: EstiloTextoBranco.negrito16, textAlign: TextAlign.center),
            semanaLocal >= semana ? Column(
              children: [
                InkWell(
                  onTap:(){
                    simulateManyWeeksFunction(context,semanaLocal);
                    navigatorReplace(context, const Menu());
                  },
                  child: const Icon(Icons.timer,color: Colors.white,size: 25),
                ),
                const SizedBox(height: 4),
              ],
            ) : Container(),
          ],
        ),
      ),
    ),
  );
}

Widget wCalendarNotPlayWidget(BuildContext context, int semanaLocal, String title, [String? imageName]){
  return PressableButton(
    onTap: () async{
      simulateManyWeeksFunction(context,semanaLocal);
      navigatorReplace(context, const Menu());
    },
    child: Container(
      width: 122,
      height: 148,
      color: semana > semanaLocal ? Colors.black87 : Colors.black38,
      child: Column(
        children: [
          const SizedBox(height: 4),
          Text(title, textAlign: TextAlign.center,style: EstiloTextoBranco.negrito14),
          const SizedBox(height: 10),
          imageName != null ? Image.asset(imageName,height: 70, width: 70) : Container(),
          const Spacer(),
          semanaLocal >= semana ? Column(
            children: [
              InkWell(
                onTap:(){
                  simulateManyWeeksFunction(context, semanaLocal);
                  navigatorReplace(context, const Menu());
                },
                child: const Icon(Icons.timer,color: Colors.white,size: 25),
              ),
              const SizedBox(height: 4),
            ],
          ) : Container(),
        ],
      ),
    ),
  );
}
