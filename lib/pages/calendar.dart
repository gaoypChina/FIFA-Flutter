import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/page_controller/calendar_control.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/button/button_return.dart';
import 'package:flutter/material.dart';
import 'club_profile.dart';

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
          const SizedBox(height: 40),
          const Text('Calendário',style: EstiloTextoBranco.text30),
          const SizedBox(height: 10),
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
          Text('Rodada ' + (rodadaLocal).toString(),style: EstiloTextoBranco.text16),
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
              ? Text('FORA ${show.placar}',
                  style: EstiloTextoBranco.text10, textAlign: TextAlign.center)
              : Text('CASA ${show.placar}',
                  style: EstiloTextoBranco.text10, textAlign: TextAlign.center),
          Text(show.clubName2,
              overflow: TextOverflow.fade,
              style: EstiloTextoBranco.text16,
              textAlign: TextAlign.center),
          const Spacer(),
        ]),
      ),
    );
    }else{
      return Container(
        width: 120,
        height: 117,
        color: Colors.black12,
        child: Text('Semana '+rodadaLocal.toString(), textAlign: TextAlign.center,style: EstiloTextoBranco.text16),
      );
    }
  }

  Widget adversarioInternational(int semanaLocal) {
    ResultGameInternacional show = ResultGameInternacional(semanaLocal: semanaLocal, clubID: myTeamClass.clubID);
    if(show.hasAdversary && semana >= semanasJogosInternacionais.first) {
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
              Text(Semana(semanaLocal).semanaStr,
                  style: EstiloTextoBranco.text16),
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
                  ? Text('FORA ${show.placar}',
                  style: EstiloTextoBranco.text10, textAlign: TextAlign.center)
                  : Text('CASA ${show.placar}',
                  style: EstiloTextoBranco.text10, textAlign: TextAlign.center),
              Text(show.clubName2,
                  overflow: TextOverflow.fade,
                  style: EstiloTextoBranco.text16,
                  textAlign: TextAlign.center),
              const Spacer(),
            ],
          ),
        ),
      );
    }else{
      return Container(
        width: 120,
        height: 117,
        color: Colors.black12,
        child: Column(
          children: [
            Text(Semana(semanaLocal).semanaStr, textAlign: TextAlign.center,style: EstiloTextoBranco.text16),
            Image.asset(Images().getMyInternationalLeagueLogo(),height: 80, width: 80),
          ],
        ),
      );
    }
  }

  Widget adversarioMataMata(int semanaLocal) {
    ResultGameInternacional show = ResultGameInternacional(semanaLocal: semanaLocal, clubID: myTeamClass.clubID);
    if(show.hasAdversary && semana >= semanasMataMataInternacionais.first) {
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
              Text(Semana(semanaLocal).semanaStr,
                  style: EstiloTextoBranco.text16),
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
                  ? Text('FORA ${show.placar}',
                  style: EstiloTextoBranco.text10, textAlign: TextAlign.center)
                  : Text('CASA ${show.placar}',
                  style: EstiloTextoBranco.text10, textAlign: TextAlign.center),
              Text(show.clubName2,
                  overflow: TextOverflow.fade,
                  style: EstiloTextoBranco.text16,
                  textAlign: TextAlign.center),
            ],
          ),
        ),
      );
    }else{
      return Container(
          width: 120,
          height: 117,
          color: Colors.black12,
        child: Column(
          children: [
            Text(Semana(semanaLocal).semanaStr, textAlign: TextAlign.center,style: EstiloTextoBranco.text16),
            Image.asset(Images().getMyInternationalLeagueLogo(),height: 80, width: 80),
          ],
        ),
      );
    }
  }

}
