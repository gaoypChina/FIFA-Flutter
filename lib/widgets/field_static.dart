import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/match.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:flutter/material.dart';
import '../values/images.dart';

Widget fieldGameplay442(int clubID){
  Club club = Club(index: clubID);
  String clubName = club.name;
  List jogadores = club.optimizeBestSquadClub();
  if(My().clubID == clubID){
    jogadores = globalMyJogadores;
  }
  return SizedBox(
    height: 420,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        //ATACANTES
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            playerWidgetMatch(jogadores[9],clubName),
            playerWidgetMatch(jogadores[10],clubName),
          ],
        ),

        //MEIAS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            playerWidgetMatch(jogadores[7],clubName),
            playerWidgetMatch(jogadores[8],clubName),
          ],
        ),

        //VOLANTES
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            playerWidgetMatch(jogadores[5],clubName),
            playerWidgetMatch(jogadores[6],clubName),
          ],
        ),

        //ZAGUEIROS
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            playerWidgetMatch(jogadores[1],clubName),
            playerWidgetMatch(jogadores[2],clubName),
            playerWidgetMatch(jogadores[3],clubName),
            playerWidgetMatch(jogadores[4],clubName),
          ],
        ),

        //GOLEIRO
        playerWidgetMatch(jogadores[0],clubName),

      ],
    ),
  );

}

Widget playerWidgetMatch(int jogadorIndex, String clubName){

  Match matchClass = Match(playerID: jogadorIndex);
  Jogador jogadorClass = Jogador(index: jogadorIndex);

  String name = jogadorClass.name;
  bool yellowCard = matchClass.yellowCard>0;
  bool redCard = matchClass.redCard>0;
  bool injury = matchClass.injury>0;
  bool goal = matchClass.goals>0;
  double healthBar = matchClass.health;
  double imageSize = 40;

  if(injury || redCard){healthBar=0;}

  return Column(
    children: [

      SizedBox(
        height: imageSize,
        width: imageSize,
        child: Stack(
          children: [
            //Uniforme
            (injury || redCard)
                ? Opacity(
                  opacity: 0.4,
                child: Image.asset('assets/clubs/${FIFAImages().imageLogo(clubName)}1.png',height: imageSize,width: imageSize)
            )
                : Image.asset('assets/clubs/${FIFAImages().imageLogo(clubName)}1.png',height: imageSize,width: imageSize),

            //GOL
            Container(
              alignment: Alignment.topRight,
              child: Container(
                height: 12,
                width: 12,
                margin: const EdgeInsets.all(4),
                color: yellowCard ? Colors.yellow : redCard ? Colors.red : Colors.transparent,
              ),
            ),

            //BOLA
            goal ? Container(
                  alignment: Alignment.bottomRight,
                  child: Image.asset('assets/icons/bola.png',height: 20,width: 20)
                  )
                : Container(),
          ],
        ),
      ),

      //Barra de saúde
      SizedBox(
        width: imageSize+7,
        child: LinearProgressIndicator(
          value: healthBar,
          color: Colors.teal,
          backgroundColor: Colors.grey,
        ),
      ),
      //Nome do jogador
      Container(
          color: Colors.black87,
          padding: const EdgeInsets.all(4),
          width: imageSize+7,
          child: Text(name,textAlign:TextAlign.center,style: EstiloTextoBranco.text8)
      ),
    ],
  );
}



