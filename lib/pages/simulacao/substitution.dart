import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/match/match.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/widgets/popup/popup_player_info.dart';
import 'package:fifa/theme/background_color/background_overall.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/widgets/field_size.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

import '../../classes/geral/esquemas_taticos.dart';

class Substitution extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Substitution({Key? key}) : super(key: key);
  @override
  _SubstitutionState createState() => _SubstitutionState();
}

class _SubstitutionState extends State<Substitution> {

  My my = My();
  int dragPlayer = -1;
  Club myClub = Club(index: My().clubID);
  List originalStartingPlayers = [];
////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }
  doThisOnLaunch() {
    originalStartingPlayers =  my.jogadores.take(11).toList();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:  Stack(
            children: [

              Images().getWallpaper(),

              Column(
                children: [

                  const SizedBox(height: 40),
                  Text(Translation(context).text.substitution,style: EstiloTextoBranco.text30),
                  Text('${globalMatchSubstitutionsLeft.toString()} ${Translation(context).text.substitutionLeft}',style: EstiloTextoBranco.text16),
                  Text('${Translation(context).text.overall}: '+myClub.getOverall().toStringAsFixed(2),style: EstiloTextoBranco.text16),
                  //MUDAR ESQUEMA TATICO
                  customButtonContinue(
                      title: my.esquemaTatico,
                      function: (){
                        EsquemaTatico().changeMyEsquema();
                        my = My();
                        setState(() {});
                      }
                  ),

                  const SizedBox(height: 8),
                  fieldSizeWidget(
                    fieldWidgetSelection(),
                  ),

                  Text(Translation(context).text.substitutes,style: EstiloTextoBranco.text20),
                  Container(
                    height: 90,
                    color: AppColors().greyTransparent,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount:  myClub.nJogadores>11 ? myClub.nJogadores> 18 ? 7 : myClub.nJogadores -11 : 0,
                        itemBuilder: (BuildContext context, int index) {
                          index = index+11;
                          return dragPlayer<0
                                  ? draggable(my.jogadores[index])
                                  : draggableTarget(my.jogadores[index]);
                        }
                    ),
                  ),

                  const Spacer(),
                  //VOLTAR
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child:  customButtonContinue(
                        title: Translation(context).text.returnTo.toUpperCase(),
                        function: (){
                          Navigator.pop(context);
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
  Widget draggable(int playerIndex){
    return LongPressDraggable (
      data: playerIndex,
      child: playerWidgetOVR(playerIndex),
      feedback: playerWidgetOVR(playerIndex),
      childWhenDragging: Container(height:60, width: 60,color:AppColors().greyTransparent),
      onDragStarted: (){
        dragPlayer=playerIndex;
        setState(() {});
      },
      onDragCompleted: (){dragPlayer=-1;},
    );
  }
  Widget draggableTarget(int playerTargetID){
    return DragTarget(
      builder: (BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,){
        return playerWidgetOVR(playerTargetID);
      },
      onAccept: (data){
        if(globalMatchSubstitutionsLeft>0){
          int playerIDData = int.parse(data.toString());

          int finalPosition1 = my.jogadores.indexOf(playerIDData);
          int finalPosition2 = my.jogadores.indexOf(playerTargetID);


          Match matchClass1 = Match(playerID: playerIDData);
          Match matchClass2 = Match(playerID: playerTargetID);
          if(matchClass1.redCard==0 && matchClass2.redCard == 0) {
            //Troca Jogadores
            globalMyJogadores[finalPosition1] = playerTargetID;
            globalMyJogadores[finalPosition2] = playerIDData;

            //SUBSTITUIÇÕES RESTANTES
            List actualPlayers = my.jogadores.take(11).toList();
            int totalDifferentPlayers = 0;
            for (int originalID in originalStartingPlayers){
              if (!actualPlayers.contains(originalID)) {
                totalDifferentPlayers += 1;
              }
            }
            globalMatchSubstitutionsLeft = 3-totalDifferentPlayers;

          }else {
            if(finalPosition1<11 && finalPosition2<11){//se forem titulares pode mudar
              //Troca Jogadores
              globalMyJogadores[finalPosition1] = playerTargetID;
              globalMyJogadores[finalPosition2] = playerIDData;
            }else{
              customToast(Translation(context).text.redCardPlayersCantBeReplaced);
            }
          }
        }else{
          customToast(Translation(context).text.noSubstitutionLeft);
        }
        dragPlayer=-1;
        setState(() {});
      },
    );
  }

  Widget playerWidgetOVR(int playerIndex){
    Jogador player = Jogador(index: playerIndex);

    int positionNumber = my.jogadores.indexOf(player.index);
    player.isPlayerInRightPosition(positionNumber);

    Match matchClass = Match(playerID: playerIndex);

    String name = player.nameResume;
    String position = player.position;
    double imageSize = 50;
    bool yellowCard = matchClass.yellowCard>0;
    bool redCard = matchClass.redCard>0;
    bool injury = matchClass.injury>0;
    bool goal = matchClass.goals>0;
    double healthBar = matchClass.health;

    String circleShow = player.overallDynamic.toStringAsFixed(0);
    Color colorBackground = colorOverallBackground(player.overallDynamic);

    if(injury || redCard){healthBar=0;}

    return GestureDetector(
      onTap:(){
        //PLAYER INFOS
        popUpOkShowPlayerInfos(
            context: context,
            playerID: player.index,
            funcSetState: (){setState(() {});}
        );
      },
      child: Center(
        child: Column(
          children: [

            //OVR
            SizedBox(
              height: imageSize-5,
              width: imageSize,
              child: Stack(
                children: [

                  //Uniforme
                  (player.injury >0 || player.redCard >0)
                      ? Opacity(
                      opacity: 0.4,
                      child: Images().getUniformWidget(player.clubName,imageSize-5,imageSize)
                  )
                      : Images().getUniformWidget(player.clubName,imageSize-5,imageSize),

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

                  //CIRCULO
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Image.asset('assets/icons/circulo.png',height: 22),
                  ),

                  //OVR
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: colorBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Text(circleShow,style: EstiloTextoPreto.text14)),
                  ),

                  //POSIÇÃO
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: positionContainer(position),
                  ),

                ],
              ),
            ),
            //Barra de saúde
            SizedBox(
              width: imageSize+15,
              child: LinearProgressIndicator(
                value: healthBar,
                color: Colors.teal,
                backgroundColor: Colors.grey,
              ),
            ),
            //Nome do jogador
            Container(
                color: AppColors().greyTransparent,
                width: imageSize+15,
                child: Text(name,textAlign: TextAlign.center,style: EstiloTextoBranco.text10)
            ),

          ],
        ),
      ),
    );
  }

  Widget fieldWidgetSelection(){
    My my = My();
    if(my.esquemaTatico == EsquemaTatico().e442) {return fieldGameplay442();}
    else if(my.esquemaTatico == EsquemaTatico().e433) {return fieldGameplay433();}
    else if(my.esquemaTatico == EsquemaTatico().e343) {return fieldGameplay343();}
    else if(my.esquemaTatico == EsquemaTatico().e451) {return fieldGameplay451();}
    else if(my.esquemaTatico == EsquemaTatico().e541) {return fieldGameplay541();}

    return fieldGameplay442();
  }

  Widget fieldGameplay442(){
    return fieldSizeWidget(
        Column(
          children: [
            //ATACANTES
            playerWidgetRow([my.jogadores[9],my.jogadores[10]]),
            //MEIAS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                playerWidget(my.jogadores[7]),
                playerWidget(my.jogadores[8]),
              ],
            ),
            //VOLANTES
            playerWidgetRow([my.jogadores[5],my.jogadores[6]]),
            //ZAGUEIROS
            playerWidgetRow([my.jogadores[1],my.jogadores[2],my.jogadores[3],my.jogadores[4]]),
            //GOLEIRO
            playerWidgetRow([my.jogadores[0]]),

          ],
        )
    );
  }

  Widget fieldGameplay433(){
    return fieldSizeWidget(
        Column(
          children: [
            //ATACANTES
            playerWidgetRow([my.jogadores[8],my.jogadores[9],my.jogadores[10]]),
            //MEIAS
            playerWidgetRow([my.jogadores[7]]),
            //VOLANTES
            playerWidgetRow([my.jogadores[5],my.jogadores[6]]),
            //ZAGUEIROS
            playerWidgetRow([my.jogadores[1],my.jogadores[2],my.jogadores[3],my.jogadores[4]]),
            //GOLEIRO
            playerWidgetRow([my.jogadores[0]]),
          ],
        )
    );
  }

  Widget fieldGameplay343(){
    return fieldSizeWidget(
        Column(
          children: [
            //ATACANTES
            playerWidgetRow([my.jogadores[8],my.jogadores[9],my.jogadores[10]]),
            //MEIAS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                playerWidget(my.jogadores[6]),
                playerWidget(my.jogadores[7]),
              ],
            ),
            //VOLANTES
            playerWidgetRow([my.jogadores[4],my.jogadores[5]]),
            //ZAGUEIROS
            playerWidgetRow([my.jogadores[1],my.jogadores[2],my.jogadores[3]]),
            //GOLEIRO
            playerWidgetRow([my.jogadores[0]]),
          ],
        )
    );
  }

  Widget fieldGameplay451(){
    return fieldSizeWidget(
        Column(
          children: [
            //ATACANTES
            playerWidgetRow([my.jogadores[10]]),
            //MEIAS
            playerWidgetRow([my.jogadores[7],my.jogadores[8],my.jogadores[9]]),
            //VOLANTES
            playerWidgetRow([my.jogadores[5],my.jogadores[6]]),
            //ZAGUEIROS
            playerWidgetRow([my.jogadores[1],my.jogadores[2],my.jogadores[3],my.jogadores[4]]),
            //GOLEIRO
            playerWidgetRow([my.jogadores[0]]),
          ],
        )
    );
  }
  Widget fieldGameplay541(){
    return fieldSizeWidget(
      Column(
        children: [
          //ATACANTES
          playerWidgetRow([my.jogadores[10]]),
          //MEIAS
          playerWidgetRow([my.jogadores[8],my.jogadores[9]]),
          //VOLANTES
          playerWidgetRow([my.jogadores[6],my.jogadores[7]]),
          //ZAGUEIROS
          playerWidgetRow([my.jogadores[1],my.jogadores[2],my.jogadores[3],my.jogadores[4],my.jogadores[5]]),
          //GOLEIRO
          playerWidgetRow([my.jogadores[0]]),
        ],
      ),
    );
  }
  Widget playerWidgetRow(List playersID){
    if(playersID.length==1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          playerWidget(playersID[0]),
        ],
      );
    }
    else if(playersID.length==2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          playerWidget(playersID[0]),
          playerWidget(playersID[1]),
        ],
      );
    }
    else if(playersID.length==3) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          playerWidget(playersID[0]),
          playerWidget(playersID[1]),
          playerWidget(playersID[2]),
        ],
      );
    }
    else if(playersID.length==4) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          playerWidget(playersID[0]),
          playerWidget(playersID[1]),
          playerWidget(playersID[2]),
          playerWidget(playersID[3]),
        ],
      );
    }
    else if(playersID.length==5) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          playerWidget(playersID[0]),
          playerWidget(playersID[1]),
          playerWidget(playersID[2]),
          playerWidget(playersID[3]),
          playerWidget(playersID[4]),
        ],
      );
    }
    else{
      return Container();
    }
  }
  Widget playerWidget(int playerID){
    return dragPlayer<0 ? draggable(playerID): draggableTarget(playerID);
  }
}