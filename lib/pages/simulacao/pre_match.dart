import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/simulacao/play.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:fifa/widgets/background_image/backimage_international_league.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:flutter/material.dart';

class PreMatch extends StatefulWidget {
  final int adversarioClubID;
  final bool visitante;
  const PreMatch({Key? key,required this.adversarioClubID, required this.visitante}) : super(key: key);

  @override
  State<PreMatch> createState() => _PreMatchState();
}

class _PreMatchState extends State<PreMatch> {

  bool visitante = false;
  My myClass = My();
  Club myClubClass = Club(index: My().clubID);

  late Club adversarioClubClass;

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    adversarioClubClass = Club(index: widget.adversarioClubID);
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

          backgroundTournament(Semana(semana),My()),

          Column(
            children: [
              backButtonText(context,'Pre Match'),
              const Text('Simular',style: EstiloTextoBranco.text16),

              header(),

              customButtonContinue(
                title: Translation(context).text.nextMatchWeek,
                function: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Play(adversarioClubID: widget.adversarioClubID, visitante: widget.visitante)));
                },
              ),

            ],
          ),


        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget header(){
    String textRodada = '';
    if(Semana(semana).isJogoCampeonatoNacional) {
      textRodada = '${Translation(context).text.matchWeek} ' + rodada.toString() + '/' + (League(index: myClass.leagueID).getNTeams()-1).toString();
    }else{
      textRodada = Name().groupsPhase;
      if(Semana(semana).isJogoGruposInternacional){textRodada += ' ${Semana(semana).rodadaGroupInternational}'; }
      else{
        textRodada = Semana(semana).semanaStr;
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //Escudo time 1
        Images().getEscudoWidget(myClubClass.name,80,80),

        Column(
          children: [
            Semana(semana).isJogoCampeonatoNacional
                ? Image.asset(FIFAImages().campeonatoLogo(myClass.campeonatoName),height: 30,width: 30)
                : Image.asset(FIFAImages().campeonatoLogo(myClass.getMyInternationalLeague()),height: 35,width: 35),
            Text(textRodada,style: EstiloTextoBranco.text16),
            const Text('X',style: EstiloTextoBranco.text16),
          ],
        ),

        //Escudo time 2
        Images().getEscudoWidget(adversarioClubClass.name,80,80),

      ],
    );
  }
}
