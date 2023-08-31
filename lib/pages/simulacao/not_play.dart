import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/pages/cups/tabs/cup_matchs.dart';
import 'package:fifa/pages/menu/c_menu.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/simulate/simulate_functions.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/simulacao/end_year.dart';
import 'package:fifa/pages/simulacao/not_play_international/not_play_international_groups.dart';
import 'package:fifa/pages/simulacao/not_play_international/not_play_international_matamata.dart';
import 'package:fifa/pages/simulacao/not_play_international/not_play_mundial.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/pages/table/widgets/table_widget.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

import '../../widgets/background_image/backimage_international_league.dart';

class NotPlay extends StatefulWidget {
  const NotPlay({Key? key}) : super(key: key);
  @override
  _NotPlayState createState() => _NotPlayState();
}

class _NotPlayState extends State<NotPlay> {

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    int leagueIndex = My().leagueID;
    League league = League(index: leagueIndex);
    Semana weekClass = Semana(semana);
    String weekName = Semana(semana).semanaAlternativeStr;

    return Scaffold(
        body:  Stack(
            children: [

              backgroundTournament(weekClass,My()),

              Column(
                children: [

                  const SizedBox(height: 40),
                  Text('${Translation(context).text.week}: '+Name().showTranslated(context, weekName),style: EstiloTextoBranco.text30),
                  const SizedBox(height: 10),
                  //TABELA
                  Expanded(
                      child: weekClass.isJogoCampeonatoNacional
                          ? tabelaClassificacaoWidget(context,league)
                          : weekClass.isJogoCopa
                            ? cupPhaseWidget(context, My().cupName)
                            : weekClass.isJogoGruposInternacional
                              ? notPlayShowInternationalGroups(context, league.internationalLeagueNameWhenNotPlay)
                              : weekClass.isJogoMataMataInternacional
                                ? notPlayShowInternationalMataMata(context,league.internationalLeagueNameWhenNotPlay)
                                : notPlayMundial(context),
                  ),


                  //VOLTAR
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child:  customButtonContinue(
                        title: Translation(context).text.nextMatchWeek,
                        function: (){
                          onContinueButton();
                        }
                    ),
                  ),


                ],
              ),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////


onContinueButton(){

  //SIMULA JOGOS
  Simulate().simulateWeek(simulMyMatch: false);

  if(semana >= globalUltimaSemana){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EndYear()));
  }else{
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Menu()));
  }
}

}
