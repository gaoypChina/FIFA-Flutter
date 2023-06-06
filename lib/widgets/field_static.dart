import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/esquemas_taticos.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/match/match.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

Widget fieldWidget(){
  My my = My();
  if(my.esquemaTatico == EsquemaTatico().e442) return fieldGameplay442(Club(index: my.clubID));
  if(my.esquemaTatico == EsquemaTatico().e433) return fieldGameplay433(Club(index: my.clubID));
  if(my.esquemaTatico == EsquemaTatico().e343) return fieldGameplay343(Club(index: my.clubID));
  if(my.esquemaTatico == EsquemaTatico().e451) return fieldGameplay451(Club(index: my.clubID));
  if(my.esquemaTatico == EsquemaTatico().e541) return fieldGameplay541(Club(index: my.clubID));

  return Container();
}


List _getPlayersEscalacao(Club club){
  List players = club.escalacao;
  if(My().clubID == club.index){
    players = globalMyJogadores;
  }
  return players;
}

Widget fieldGameplay442(Club club){

  List players = _getPlayersEscalacao(club);

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //ATACANTES
      playerWidgetRow([players[9],players[10]],club.name),
      //MEIAS
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          playerWidgetMatch(players[7],club.name),
          playerWidgetMatch(players[8],club.name),
        ],
      ),
      //VOLANTES
      playerWidgetRow([players[5],players[6]],club.name),
      //ZAGUEIROS
      playerWidgetRow([players[1],players[2],players[3],players[4]],club.name),
      //GOLEIRO
      playerWidgetRow([players[0]],club.name),

    ],
  );
}

Widget fieldGameplay433(Club club){

  List players = _getPlayersEscalacao(club);

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //ATACANTES
      playerWidgetRow([players[8],players[9],players[10]],club.name),
      //MEIAS
      playerWidgetRow([players[7]],club.name),
      //VOLANTES
      playerWidgetRow([players[5],players[6]],club.name),
      //ZAGUEIROS
      playerWidgetRow([players[1],players[2],players[3],players[4]],club.name),
      //GOLEIRO
      playerWidgetRow([players[0]],club.name),
    ],
  );
}
Widget fieldGameplay343(Club club){

  List players = _getPlayersEscalacao(club);

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //ATACANTES
      playerWidgetRow([players[8],players[9],players[10]],club.name),
      //MEIAS
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          playerWidgetMatch(players[6],club.name),
          playerWidgetMatch(players[7],club.name),
        ],
      ),
      //VOLANTES
      playerWidgetRow([players[4],players[5]],club.name),
      //ZAGUEIROS
      playerWidgetRow([players[1],players[2],players[3]],club.name),
      //GOLEIRO
      playerWidgetRow([players[0]],club.name),
    ],
  );
}
Widget fieldGameplay451(Club club){

  List players = _getPlayersEscalacao(club);

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //ATACANTES
      playerWidgetRow([players[10]],club.name),
      //MEIAS
      playerWidgetRow([players[7],players[8],players[9]],club.name),
      //VOLANTES
      playerWidgetRow([players[5],players[6]],club.name),
      //ZAGUEIROS
      playerWidgetRow([players[1],players[2],players[3],players[4]],club.name),
      //GOLEIRO
      playerWidgetRow([players[0]],club.name),
    ],
  );
}
Widget fieldGameplay541(Club club){

  List players = _getPlayersEscalacao(club);

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //ATACANTES
      playerWidgetRow([players[10]],club.name),
      //MEIAS
      playerWidgetRow([players[7],players[8]],club.name),
      //VOLANTES
      playerWidgetRow([players[5],players[6]],club.name),
      //ZAGUEIROS
      playerWidgetRow([players[1],players[2],players[3],players[4],players[5]],club.name),
      //GOLEIRO
      playerWidgetRow([players[0]],club.name),
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

  String name = jogadorClass.nameResume;
  bool yellowCard = matchClass.yellowCard>0;
  bool redCard = matchClass.redCard>0;
  bool injury = matchClass.injury>0;
  bool goal = matchClass.goals>0;
  double healthBar = matchClass.health;
  double imageSize = 38;
  double headSize = 22;
  double bottomBarWidth = imageSize+38;

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
                        child: Images().getUniformWidget(clubName,imageSize,imageSize)
                    )
                : Images().getUniformWidget(clubName,imageSize,imageSize),
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
                child: globalHasInternet
                    ? Images().getPlayerPictureWidget(jogadorClass, headSize, headSize)
                    : Container(),
            ),


            Text(matchClass.grade.toStringAsFixed(1),style: EstiloTextoBranco.text12),

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



