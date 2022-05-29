import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/esquemas_taticos.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/match.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget fieldWidget(){
  if(My().esquemaTatico == EsquemaTatico().e442) return fieldGameplay442(My().clubID);
  if(My().esquemaTatico == EsquemaTatico().e433) return fieldGameplay433(My().clubID);
  if(My().esquemaTatico == EsquemaTatico().e343) return fieldGameplay343(My().clubID);
  if(My().esquemaTatico == EsquemaTatico().e451) return fieldGameplay451(My().clubID);
  if(My().esquemaTatico == EsquemaTatico().e541) return fieldGameplay541(My().clubID);

  return Container();
}

Widget fieldGameplay442(int clubID){
  Club club = Club(index: clubID);
  String clubName = club.name;
  List jogadores = club.escalacao;
  if(My().clubID == clubID){
    jogadores = globalMyJogadores;
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //ATACANTES
      playerWidgetRow([jogadores[9],jogadores[10]],clubName),
      //MEIAS
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          playerWidgetMatch(jogadores[7],clubName),
          playerWidgetMatch(jogadores[8],clubName),
        ],
      ),
      //VOLANTES
      playerWidgetRow([jogadores[5],jogadores[6]],clubName),
      //ZAGUEIROS
      playerWidgetRow([jogadores[1],jogadores[2],jogadores[3],jogadores[4]],clubName),
      //GOLEIRO
      playerWidgetRow([jogadores[0]],clubName),

    ],
  );
}


Widget fieldGameplay433(int clubID){
  Club club = Club(index: clubID);
  String clubName = club.name;
  List jogadores = club.escalacao;
  if(My().clubID == clubID){
    jogadores = globalMyJogadores;
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //ATACANTES
      playerWidgetRow([jogadores[8],jogadores[9],jogadores[10]],clubName),
      //MEIAS
      playerWidgetRow([jogadores[7]],clubName),
      //VOLANTES
      playerWidgetRow([jogadores[5],jogadores[6]],clubName),
      //ZAGUEIROS
      playerWidgetRow([jogadores[1],jogadores[2],jogadores[3],jogadores[4]],clubName),
      //GOLEIRO
      playerWidgetRow([jogadores[0]],clubName),
    ],
  );
}
Widget fieldGameplay343(int clubID){
  Club club = Club(index: clubID);
  String clubName = club.name;
  List jogadores = club.escalacao;
  if(My().clubID == clubID){
    jogadores = globalMyJogadores;
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //ATACANTES
      playerWidgetRow([jogadores[8],jogadores[9],jogadores[10]],clubName),
      //MEIAS
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          playerWidgetMatch(jogadores[6],clubName),
          playerWidgetMatch(jogadores[7],clubName),
        ],
      ),
      //VOLANTES
      playerWidgetRow([jogadores[4],jogadores[5]],clubName),
      //ZAGUEIROS
      playerWidgetRow([jogadores[1],jogadores[2],jogadores[3]],clubName),
      //GOLEIRO
      playerWidgetRow([jogadores[0]],clubName),
    ],
  );
}
Widget fieldGameplay451(int clubID){
  Club club = Club(index: clubID);
  String clubName = club.name;
  List jogadores = club.escalacao;
  if(My().clubID == clubID){
    jogadores = globalMyJogadores;
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //ATACANTES
      playerWidgetRow([jogadores[10]],clubName),
      //MEIAS
      playerWidgetRow([jogadores[7],jogadores[8],jogadores[9]],clubName),
      //VOLANTES
      playerWidgetRow([jogadores[5],jogadores[6]],clubName),
      //ZAGUEIROS
      playerWidgetRow([jogadores[1],jogadores[2],jogadores[3],jogadores[4]],clubName),
      //GOLEIRO
      playerWidgetRow([jogadores[0]],clubName),
    ],
  );
}
Widget fieldGameplay541(int clubID){
  Club club = Club(index: clubID);
  String clubName = club.name;
  List jogadores = club.escalacao;
  if(My().clubID == clubID){
    jogadores = globalMyJogadores;
  }
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //ATACANTES
      playerWidgetRow([jogadores[10]],clubName),
      //MEIAS
      playerWidgetRow([jogadores[7],jogadores[8]],clubName),
      //VOLANTES
      playerWidgetRow([jogadores[5],jogadores[6]],clubName),
      //ZAGUEIROS
      playerWidgetRow([jogadores[1],jogadores[2],jogadores[3],jogadores[4],jogadores[5]],clubName),
      //GOLEIRO
      playerWidgetRow([jogadores[0]],clubName),
    ],
  );
}
Widget playerWidgetRow(List playersID, String clubName){
  if(playersID.length==1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        playerWidgetMatch(playersID[0],clubName),
      ],
    );
  }
  else if(playersID.length==2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        playerWidgetMatch(playersID[0],clubName),
        playerWidgetMatch(playersID[1],clubName),
      ],
    );
  }
  else if(playersID.length==3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        playerWidgetMatch(playersID[0],clubName),
        playerWidgetMatch(playersID[1],clubName),
        playerWidgetMatch(playersID[2],clubName),
      ],
    );
  }
  else if(playersID.length==4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        playerWidgetMatch(playersID[0],clubName),
        playerWidgetMatch(playersID[1],clubName),
        playerWidgetMatch(playersID[2],clubName),
        playerWidgetMatch(playersID[3],clubName),
      ],
    );
  }
  else if(playersID.length==5) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        playerWidgetMatch(playersID[0],clubName),
        playerWidgetMatch(playersID[1],clubName),
        playerWidgetMatch(playersID[2],clubName),
        playerWidgetMatch(playersID[3],clubName),
        playerWidgetMatch(playersID[4],clubName),
      ],
    );
  }
  else{
    return Container();
  }
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
  double imageSize = 38;
  double headSize = 22;
  double bottomBarWidth = imageSize+45;

  if(injury || redCard){healthBar=0;}

  return Column(
    children: [
      SizedBox(
        height: imageSize+headSize-5,
        width: imageSize,
        child: Stack(
          children: [
            //Uniforme
            Container(
              margin: EdgeInsets.only(top: headSize-5),
              child: (injury || redCard)
                    ? Opacity(
                        opacity: 0.4,
                        child: Image.asset(Images().getUniform(clubName),height: imageSize,width: imageSize)
                    )
                : Image.asset(Images().getUniform(clubName),height: imageSize,width: imageSize),
            ),


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

            Container(
                alignment: Alignment.topCenter,
                child: globalHasInternet ? Image.network(jogadorClass.imageUrl,height: headSize,width: headSize) : Container(),
            ),

          ],
        ),
      ),

      //Barra de saúde
      SizedBox(
        width: bottomBarWidth,
        child: LinearProgressIndicator(
          value: healthBar,
          color: Colors.teal,
          backgroundColor: Colors.grey,
        ),
      ),
      //Nome do jogador
      Container(
          color: Colors.black87,
          padding: const EdgeInsets.all(2),
          width: bottomBarWidth,
          child: Text(name,textAlign:TextAlign.center,overflow:TextOverflow.clip,style: EstiloTextoBranco.text10)
      ),
    ],
  );
}



