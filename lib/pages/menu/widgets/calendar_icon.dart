import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/match/adversario.dart';
import 'package:fifa/pages/calendar/calendar.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';

Widget wMenuCalendarIcon(BuildContext context, int semana, Adversario adversario){
  return                         GestureDetector(
    onTap: (){
      Navigator.push(context,MaterialPageRoute(builder: (context) => const Calendar()));
    },
    onLongPress: (){
      Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: adversario.clubID)));
    },
    child: Stack(
      children: [

        leagueLogo(),

        const Padding(
          padding: EdgeInsets.only(top:8.0),
          child: Opacity(opacity:0.3,child: Icon(Icons.calendar_month,size:100,color: Colors.white)),
        ),
        Column(
          children: [
            Text(Translation(context).text.nextAdversary,style: EstiloTextoBranco.text14),
            //Escudo
            adversario.clubName.isNotEmpty ? Images().getEscudoWidget(adversario.clubName,50,50) : Container(),
            adversario.clubName.isNotEmpty ? Text(adversario.clubName,style: EstiloTextoBranco.negrito14) : Container(),
            adversario.clubName.isNotEmpty
                ? Semana(semana).isJogoMataMataInternacional
                ? Text(Semana(semana).semanaStr,style: EstiloTextoBranco.text14)
                : Text('${Translation(context).text.position}: '+adversario.posicao.toString()+'º',style: EstiloTextoBranco.text14)
                : Container(),
            adversario.clubName.isNotEmpty ? adversario.visitante
                ? Text(Translation(context).text.away,style: EstiloTextoBranco.text14)
                : Text(Translation(context).text.home,style: EstiloTextoBranco.text14) : Container(),

          ],
        ),
      ],
    ),
  );
}

Widget leagueLogo(){
  return
    //CAMPEONATO
    Container(
      margin: const EdgeInsets.only(right: 8,top: 15),
      alignment: Alignment.topRight,
      child: Images().getMyActualCampeonatoLogo().isNotEmpty
          ? Image.asset(Images().getMyActualCampeonatoLogo(),height: 30,width: 30)
          : const SizedBox(height: 20,width: 20),
    );
}