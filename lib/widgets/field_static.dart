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
      playerWidgetRow([players[9],players[10]]),
      //MEIAS
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          playerWidgetMatch(players[7]),
          playerWidgetMatch(players[8]),
        ],
      ),
      //VOLANTES
      playerWidgetRow([players[5],players[6]]),
      //ZAGUEIROS
      playerWidgetRow([players[1],players[2],players[3],players[4]]),
      //GOLEIRO
      playerWidgetRow([players[0]]),

    ],
  );
}

Widget fieldGameplay433(Club club){

  List players = _getPlayersEscalacao(club);

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //ATACANTES
      playerWidgetRow([players[8],players[9],players[10]]),
      //MEIAS
      playerWidgetRow([players[7]]),
      //VOLANTES
      playerWidgetRow([players[5],players[6]]),
      //ZAGUEIROS
      playerWidgetRow([players[1],players[2],players[3],players[4]]),
      //GOLEIRO
      playerWidgetRow([players[0]]),
    ],
  );
}
Widget fieldGameplay343(Club club){

  List players = _getPlayersEscalacao(club);

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //ATACANTES
      playerWidgetRow([players[8],players[9],players[10]]),
      //MEIAS
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          playerWidgetMatch(players[6]),
          playerWidgetMatch(players[7]),
        ],
      ),
      //VOLANTES
      playerWidgetRow([players[4],players[5]]),
      //ZAGUEIROS
      playerWidgetRow([players[1],players[2],players[3]]),
      //GOLEIRO
      playerWidgetRow([players[0]]),
    ],
  );
}
Widget fieldGameplay451(Club club){

  List players = _getPlayersEscalacao(club);

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //ATACANTES
      playerWidgetRow([players[10]]),
      //MEIAS
      playerWidgetRow([players[7],players[8],players[9]]),
      //VOLANTES
      playerWidgetRow([players[5],players[6]]),
      //ZAGUEIROS
      playerWidgetRow([players[1],players[2],players[3],players[4]]),
      //GOLEIRO
      playerWidgetRow([players[0]]),
    ],
  );
}
Widget fieldGameplay541(Club club){

  List players = _getPlayersEscalacao(club);

  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      //ATACANTES
      playerWidgetRow([players[10]]),
      //MEIAS
      playerWidgetRow([players[7],players[8]]),
      //VOLANTES
      playerWidgetRow([players[5],players[6]]),
      //ZAGUEIROS
      playerWidgetRow([players[1],players[2],players[3],players[4],players[5]]),
      //GOLEIRO
      playerWidgetRow([players[0]]),
    ],
  );
}
Widget playerWidgetRow(List playersID){
  if(playersID.length==1) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        playerWidgetMatch(playersID[0]),
      ],
    );
  }
  else if(playersID.length==2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        playerWidgetMatch(playersID[0]),
        playerWidgetMatch(playersID[1]),
      ],
    );
  }
  else if(playersID.length==3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        playerWidgetMatch(playersID[0]),
        playerWidgetMatch(playersID[1]),
        playerWidgetMatch(playersID[2]),
      ],
    );
  }
  else if(playersID.length==4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        playerWidgetMatch(playersID[0]),
        playerWidgetMatch(playersID[1]),
        playerWidgetMatch(playersID[2]),
        playerWidgetMatch(playersID[3]),
      ],
    );
  }
  else if(playersID.length==5) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        playerWidgetMatch(playersID[0]),
        playerWidgetMatch(playersID[1]),
        playerWidgetMatch(playersID[2]),
        playerWidgetMatch(playersID[3]),
        playerWidgetMatch(playersID[4]),
      ],
    );
  }
  else{
    return Container();
  }
}

Widget playerWidgetMatch(int jogadorIndex){

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
  double widthSize = imageSize+headSize;
  double bottomBarWidth = imageSize+38;

  if(injury || redCard){healthBar=0;}

  return Column(
    children: [
      SizedBox(
        height: imageSize+headSize-5,
        width: widthSize,
        child: Stack(
          children: [
            //Uniforme
            Container(
              margin: EdgeInsets.only(top: headSize-5),
              alignment: Alignment.topCenter,
              child: (injury || redCard)
                    ? Opacity(
                        opacity: 0.4,
                        child: Images().getUniformWidget(jogadorClass.clubName,imageSize+12,imageSize)
                    )
                : Images().getUniformWidget(jogadorClass.clubName, imageSize+12,imageSize),
            ),

            //GOL
            Container(
              alignment: Alignment.topRight,
              child: Container(
                height: 10,
                width: 6,
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

            //HEAD
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



