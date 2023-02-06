import 'package:fifa/classes/geral/semana.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/classes/result_game.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:flutter/material.dart';
import '../../../classes/club.dart';

Widget wLast5Matchs(BuildContext context){
  My myClass = My();
  return SizedBox(
    height: 25,
    width: 120,
    child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (c,i)=>resultBox(context, i, myClass)),
  );
}
Widget resultBox(BuildContext context, int i, My myClass){
  Color color = Colors.transparent;
  int nRodadasMyLeague =  League(index: myClass.leagueID).nClubs-1;
  int semanaShow = 0;
  if(rodada >= nRodadasMyLeague){
    semanaShow = semanasJogosNacionais[nRodadasMyLeague-i];
  }else if(rodada-1-i >= 0){
    semanaShow = semanasJogosNacionais[rodada-1-i];
  }
  ResultGameNacional show = ResultGameNacional(
      rodadaLocal: Semana(semanaShow).rodadaNacional,
      club: Club(index: myClass.clubID)
  );
  if(show.victoryDrawLoss310 == 3){color = Colors.green;}
  if(show.victoryDrawLoss310 == 1){color = Colors.yellow;}
  if(show.victoryDrawLoss310 == 0){color = Colors.red;}
  if(show.exists){
    return GestureDetector(
      onTap:(){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ClubProfile(clubID: show.clubID2)));
      },
      child: Container(
        height:20,
        width: 20,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Center(child: Images().getEscudoWidget(show.clubName2,15,15)),
      ),
    );
  }else{
    return Container();
  }
}