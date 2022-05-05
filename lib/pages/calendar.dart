import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/page_controller/calendar_control.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button_return.dart';
import 'package:flutter/material.dart';
import 'club_profile/club_profile.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  My myTeamClass = My();
  int nClubsLeague = (League(index: My().campeonatoID).nClubs) - 1;

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
          const SizedBox(height: 30),
          Text(Translation(context).text.calendar,style: EstiloTextoBranco.text30),
          Container(
            margin: const EdgeInsets.all(8),
            height: Sized(context).height-130,
            child: SingleChildScrollView(
              reverse: (Semana(semana).isJogoCampeonatoInternacional) ? true : false,
              child: Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  for (int i in semanasJogosNacionais) adversarioLeague(i),
                  for (int weekNumber in semanasGruposInternacionais) adversarioInternational(weekNumber),
                  for (int weekNumber in semanasMataMataInternacionais) adversarioMataMata(weekNumber),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),

      //VOLTAR
      returnButton(context),
    ]));
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget adversarioLeague(int rodadaLocal) {
    ResultGameNacional show = ResultGameNacional(rodadaLocal: rodadaLocal, clubID: myTeamClass.clubID);

    if(rodadaLocal <= nClubsLeague){
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ClubProfile(clubID: show.clubID2)));
      },
      child: Container(
        width: 120,
        height: 117,
        color: show.backgroundColor,
        child: Column(children: [
          Text('${Translation(context).text.matchWeek} ' + (rodadaLocal).toString(),style: EstiloTextoBranco.text16),
          SizedBox(
            height: 45,
            width: 80,
            child: Stack(
              children: [
                show.visitante
                    ? Image.asset(Images().getStadium(show.clubName2),height: 90, width: 90)
                    : Container(),
                //Image.asset(Images().getMyLeagueLogo(),height: 22, width: 22),
                Center(child: Image.asset(Images().getEscudo(show.clubName2),height: 45, width: 45)),
              ],
            ),
          ),
          show.visitante
              ? Text('${Translation(context).text.away.toUpperCase()} ${show.placar}',
                  style: EstiloTextoBranco.text10, textAlign: TextAlign.center)
              : Text('${Translation(context).text.home.toUpperCase()} ${show.placar}',
                  style: EstiloTextoBranco.text10, textAlign: TextAlign.center),
          Text(show.clubName2,
              overflow: TextOverflow.fade,
              style: EstiloTextoBranco.text14,
              textAlign: TextAlign.center),
          const Spacer(),
        ]),
      ),
    );
    }else{
      return notPlayWidget(rodadaLocal,'${Translation(context).text.week} '+rodadaLocal.toString());
    }
  }

  Widget adversarioInternational(int semanaLocal) {
    ResultGameInternacional show = ResultGameInternacional(semanaLocal: semanaLocal, clubID: myTeamClass.clubID);
    if(show.hasAdversary && semana >= semanasJogosInternacionais.first) {
      return  playWidget(semanaLocal,show);
    }else{
      return notPlayWidget(semanaLocal,Semana(semanaLocal).getTranslated(context),Images().getMyInternationalLeagueLogo());
    }
  }

  Widget adversarioMataMata(int semanaLocal) {
    ResultGameInternacional show = ResultGameInternacional(semanaLocal: semanaLocal, clubID: myTeamClass.clubID);
    if(show.hasAdversary && semana >= semanasMataMataInternacionais.first) {
      return playWidget(semanaLocal,show);
    }else{
      return notPlayWidget(semanaLocal,Semana(semanaLocal).getTranslated(context),Images().getMyInternationalLeagueLogo());
    }
  }





Widget playWidget(int semanaLocal, show){
  return GestureDetector(
    onTap: () {
      Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: show.clubID2)));
    },
    child: Container(
      width: 120,
      height: 117,
      color: show.backgroundColor,
      child: Column(
        children: [
          Text(Semana(semanaLocal).getTranslated(context),style: EstiloTextoBranco.text16),
          SizedBox(
            height: 45,
            width: 80,
            child: Stack(
              children: [
                show.visitante
                    ? Image.asset(Images().getStadium(show.clubName2),height: 90, width: 90)
                    : Container(),
                Image.asset(Images().getMyInternationalLeagueLogo(),height: 22, width: 22),
                Center(child: Image.asset(Images().getEscudo(show.clubName2),height: 45, width: 45)),
              ],
            ),
          ),
          show.visitante
              ? Text('${Translation(context).text.away.toUpperCase()} ${show.placar}',
              style: EstiloTextoBranco.text10, textAlign: TextAlign.center)
              : Text('${Translation(context).text.home.toUpperCase()} ${show.placar}',
              style: EstiloTextoBranco.text10, textAlign: TextAlign.center),
          Text(show.clubName2,
              overflow: TextOverflow.fade,
              style: EstiloTextoBranco.text14,
              textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}

Widget notPlayWidget(int semanaLocal,String title, [String? imageName]){
  return Container(
    width: 120,
    height: 117,
    color: semana > semanaLocal ? Colors.deepPurple : Colors.black12,
    child: Column(
      children: [
        Text(title, textAlign: TextAlign.center,style: EstiloTextoBranco.text16),
        imageName != null ? Image.asset(imageName,height: 80, width: 80) : Container(),
      ],
    ),
  );
}

}
