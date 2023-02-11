import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/simulate/my_match/my_match_simulation.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:flutter/material.dart';

Widget headerPlay(BuildContext context, MyMatchSimulation myMatchSimulation){
  String textRodada = '';
  if(Semana(semana).isJogoCampeonatoNacional) {
    textRodada = '${Translation(context).text.matchWeek} ' + rodada.toString() + '/' + (League(index: myMatchSimulation.myClubClass.leagueID).getNTeams()-1).toString();
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
      Images().getEscudoWidget(myMatchSimulation.myClubClass.name,80,80),

      Column(
        children: [
          Semana(semana).isJogoCampeonatoNacional
              ? Image.asset(FIFAImages().campeonatoLogo(myMatchSimulation.myClass.campeonatoName),height: 30,width: 30)
              : Image.asset(FIFAImages().campeonatoLogo(myMatchSimulation.myClass.getMyInternationalLeague()),height: 35,width: 35),
          Text(textRodada,style: EstiloTextoBranco.text16),
          myMatchSimulation.visitante
              ? Text(myMatchSimulation.meuGolSofrido.toString() +'X'+ myMatchSimulation.meuGolMarcado.toString(),style: EstiloTextoBranco.text30)
              : Text(myMatchSimulation.meuGolMarcado.toString() +'X'+ myMatchSimulation.meuGolSofrido.toString(),style: EstiloTextoBranco.text30),
          Text(myMatchSimulation.milis.toString()+'\'',style: EstiloTextoBranco.text16),
        ],
      ),

      //Escudo time 2
      Images().getEscudoWidget(myMatchSimulation.adversarioClubClass.name,80,80),

    ],
  );
}