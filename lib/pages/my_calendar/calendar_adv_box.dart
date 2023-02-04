import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';

Widget wCalendarAdvBox(BuildContext context, int semanaLocal, show){
  return Material(
    color: Colors.transparent,
    child: InkWell(
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
                  Semana(semanaLocal).isJogoCampeonatoInternacional
                      ? Image.asset(Images().getMyInternationalLeagueLogo(),height: 22, width: 22)
                      : Container(),
                  Center(child: Images().getEscudoWidget(show.clubName2,45,45)),
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
    ),
  );
}

Widget wCalendarNotPlayWidget(int semanaLocal,String title, [String? imageName]){
  return Container(
    width: 120,
    height: 117,
    color: semana > semanaLocal ? Colors.deepPurple : Colors.black12,
    child: Column(
      children: [
        Text(title, textAlign: TextAlign.center,style: EstiloTextoBranco.text16),
        SizedBox(height: 10),
        imageName != null ? Image.asset(imageName,height: 70, width: 70) : Container(),
      ],
    ),
  );
}
