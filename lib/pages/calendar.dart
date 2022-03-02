import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/page_controller/calendar_control.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/widgets/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'menu/c_menu.dart';
import '../values/images.dart';
import 'club_profile.dart';

class Calendar extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Calendar({Key? key}) : super(key: key);
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {

  My myTeamClass = My();
  int nClubsLeague = (League(index: My().campeonatoID).nClubs)-1;
  
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    String rodadaStr = '';
    if(Semana().isJogoCampeonatoNacional){
      rodadaStr = rodada.toString();
    }

    return Scaffold(

        body:  Stack(
            children: [

              Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

              Column(
                children: [

                  const SizedBox(height: 40),
                  Text('Calendário - Rodada ' + rodadaStr,style: EstiloTextoBranco.text30),
                  const SizedBox(height: 10),

                  Container(
                    margin: const EdgeInsets.all(8),
                    height: 640,
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 5,runSpacing: 5,
                        children: [
                          for(int i=1; i<=nClubsLeague; i++)
                            adversario(i)
                        ],
                      ),
                    ),
                  ),

                  //VOLTAR
                  customButtonContinue(
                      title: 'VOLTAR',
                      function: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Menu()));
                      }
                  ),

                ],
              )

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget adversario(int rodadaLocal){

  ResultGameNacional show = ResultGameNacional(rodadaLocal: rodadaLocal, clubID: myTeamClass.clubID);

    return GestureDetector(
      onTap:(){
        Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: show.clubIDAdv )));
      },
      child: Container(
        width: 120,
        height: 117,
        color: show.backgroundColor,
        child: Column(
          children: [
            Text('Rodada '+(rodadaLocal).toString(),style: EstiloTextoBranco.text16),
            Image.asset('assets/clubs/${FIFAImages().imageLogo(show.clubNameAdv)}.png',height: 45,width: 45),
            show.visitante ? Text('FORA ${show.placar}',style: EstiloTextoBranco.text10,textAlign: TextAlign.center) : Text('CASA ${show.placar}',style: EstiloTextoBranco.text10,textAlign: TextAlign.center),
            Text(show.clubNameAdv,overflow: TextOverflow.fade,style: EstiloTextoBranco.text16,textAlign: TextAlign.center),
            const Spacer(),
            ]),
      ),
    );
}

}
