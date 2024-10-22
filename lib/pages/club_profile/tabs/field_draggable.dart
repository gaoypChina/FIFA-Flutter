import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/esquemas_taticos.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/background_color/background_age.dart';
import 'package:fifa/theme/background_color/background_overall.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button.dart';
import 'package:fifa/widgets/club_profile/analise_elenco.dart';
import 'package:fifa/widgets/field_size.dart';
import 'package:fifa/widgets/popup/popup_player_info.dart';
import 'package:flutter/material.dart';

import '../../../theme/textstyle.dart';

class FieldDraggable extends StatefulWidget {
  final Function() notifyParent;
  const FieldDraggable({Key? key, required this.notifyParent}) : super(key: key);
  @override
  State<FieldDraggable> createState() => _FieldDraggableState();
}

class _FieldDraggableState extends State<FieldDraggable> {

  My my = My();
  String show = 'OVR';

  //Change player position
  bool select = false;
  late int selectedIndexPosition;
  late int selectedIndexConteudo;
  int dragPlayer = -1;

  @override
  Widget build(BuildContext context) {

    Club myClub = Club(index: my.clubID);

    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),
          Column(
            children: [

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      //Widget do campo
                      fieldWidget(),

                      Container(
                          width: Sized(context).width,
                          color: AppColors().greyTransparent,
                          child: Row(
                            children: [
                              Text('${Translation(context).text.substitutes}:', style: EstiloTextoBranco.negrito16),
                              const Spacer(),
                              Column(
                                children: [
                                  Text('${Translation(context).text.avgAge}: ' + myClub.getAverageAge().toStringAsFixed(2), style: EstiloTextoBranco.text14),
                                  Text('${Translation(context).text.player}: ' + myClub.nJogadores.toString(), style: EstiloTextoBranco.text14),
                                ],
                              ),
                            ],
                          )
                      ),

                      Container(
                        height: 90,
                        color: AppColors().greyTransparent,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:  myClub.nJogadores>11 ? myClub.nJogadores> 18 ? 7 : myClub.nJogadores -11 : 0,
                            itemBuilder: (BuildContext context, int index) {
                              index = index+11;
                              return dragPlayerSelection(index);
                            }
                        ),
                      ),

                      Container(
                        height: 90,
                        color: AppColors().greyTransparent,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: myClub.nJogadores>18 ? myClub.nJogadores-18 : 0,
                            itemBuilder: (BuildContext context, int index) {
                              index = index+18;
                              return dragPlayerSelection(index);
                            }
                        ),
                      ),

                      //ANALISE DO ELENCO
                      analiseElenco(context, myClub),

                      const SizedBox(height: 60),
                    ],
                  ),
                ),
              ),

              //AUTO ORGANIZE BUTTON
              optionButtons(myClub),

            ],
          ),
        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////
  venderJogador(Jogador player){
    popUpOkShowPlayerInfos(
        context: context,
        playerID: player.index,
        funcSetState: (){
          setState(() {});
          widget.notifyParent();
        }
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget optionButtons(Club myClub){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          SizedBox(
              width: 140,
              child: button(title: 'Auto-organize',
                  function: (){
                    setState(() {});
                    myClub.optimizeBestSquadClub();
                    globalMyJogadores = myClub.escalacao;
                    widget.notifyParent();
                    my = My();
                  })
          ),

          const Spacer(),

          //MUDAR ESQUEMA TATICO
          button(
              title: my.esquemaTatico,
              function: (){
                EsquemaTatico().changeMyEsquema();
                my = My();
                widget.notifyParent();
                setState(() {});
              }
          ),

          const Spacer(),

          //FILTER SELECTION
          SizedBox(
            width: 50,
            child: buttonIcon(
                widget: const Icon(Icons.filter_alt_rounded, color: Colors.white,),
                function: (){bottomSheetFilterOptions(context);}
            ),
          ),
        ],
      ),
    );
  }
  Future bottomSheetFilterOptions(BuildContext context){

    //FILTRAR POR TÓPICOS
    return showModalBottomSheet(
        barrierColor: Colors.transparent,
        context: context, builder: (c){
      return Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buttonText(title: Translation(context).text.ovr3, function: (){setState(() {});show = 'OVR';}),
            buttonText(title: Translation(context).text.age, function: (){setState(() {});show = 'Idade';}),
            buttonText(title: Translation(context).text.matchs, function: (){setState(() {});show = 'Jogos';}),
            buttonText(title: Translation(context).text.goals, function: (){setState(() {});show = 'Gols';}),
            buttonText(title: Translation(context).text.assists, function: (){setState(() {});show = 'Assists';}),
          ],
        ),
      );
    });
  }

  Widget dragPlayerSelection(int index){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      child: dragPlayer<0
          ?  draggable(my.jogadores[index])
          : draggableTarget(my.jogadores[index]),
    );
  }

  button({required String title, required Function()? function}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: function,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: AppColors().green, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: EstiloTextoBranco.text16,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget draggable(int playerID){
    return LongPressDraggable (
      data: playerID,
      child: playerWidgetOVR(playerID),
      feedback: playerWidgetOVR(playerID),
      childWhenDragging: Container(height:60, width: 60,color:AppColors().greyTransparent),
      onDragStarted: (){
        dragPlayer=playerID;
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
        int playerIDData = int.parse(data.toString());
        int finalPosition1 = globalMyJogadores.indexOf(playerIDData);
        int finalPosition2 = globalMyJogadores.indexOf(playerTargetID);
        //Troca Jogadores
        globalMyJogadores[finalPosition1] = playerTargetID;globalMyJogadores[finalPosition2] = playerIDData;
        setState(() {});
        dragPlayer=-1;

        widget.notifyParent();
      },
    );
  }


  Widget playerWidgetOVR(int playerIndex){
    Jogador player = Jogador(index: playerIndex);

    int positionNumber = my.jogadores.indexOf(player.index);
    player.isPlayerInRightPosition(positionNumber);

    String name = player.nameResume;
    String position = player.position;
    double imageSize = 57;
    double healthBar = player.health;

    String circleShow = player.overallDynamic.toStringAsFixed(0);
    Color colorBackground = colorOverallBackground(player.overallDynamic);
    if(show == 'Jogos'){circleShow = player.matchsLeague.toStringAsFixed(0);colorBackground = Colors.transparent;}
    else if(show == 'Gols'){circleShow = player.goalsLeague.toStringAsFixed(0);colorBackground = Colors.transparent;}
    else if(show == 'Assists'){circleShow = player.assistsLeague.toStringAsFixed(0);colorBackground = Colors.transparent;}
    else if(show == 'Idade'){circleShow = player.age.toStringAsFixed(0);colorBackground = colorAgeBackground(player.age);}

    return GestureDetector(
      onTap:(){
        //PLAYER INFOS
      },
      onDoubleTap: (){
        venderJogador(player);
      },
      child: Center(
        child: Column(
          children: [

            //OVR
            SizedBox(
              height: imageSize-15,
              width: imageSize+15 ,
              child: Stack(
                children: [

                  //Uniforme
                  Center(
                   child: (player.injury >0 || player.redCard >0)
                        ? Opacity(
                        opacity: 0.4,
                        child: Images().getMyUniform(height: imageSize-15,width: imageSize+15)
                    )
                        : globalHasInternet
                          ? Images().getPlayerPictureWidget(player, imageSize-15, imageSize-15)
                          : Images().getMyUniform(height: imageSize-15,width: imageSize+15),
                  ),

                  //CIRCULO
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Image.asset('assets/icons/circulo.png',height: 22),
                  ),

                  //OVR
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        height: 22,
                        width: 22,
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        decoration: BoxDecoration(
                          color: colorBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: Text(circleShow,style: EstiloTextoPreto.text14))),
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
              width: imageSize+20,
              child: LinearProgressIndicator(
                value: healthBar,
                color: Colors.teal,
                backgroundColor: Colors.grey,
              ),
            ),
            //Nome do jogador
            Container(
                color: AppColors().greyTransparent,
                width: imageSize+20,
                child: Text(name,textAlign: TextAlign.center,style: EstiloTextoBranco.text10)
            ),

          ],
        ),
      ),
    );
  }

  Widget fieldWidget(){
    My my = My();
    if(my.esquemaTatico == EsquemaTatico().e442) return fieldGameplay442();
    if(my.esquemaTatico == EsquemaTatico().e433) return fieldGameplay433();
    if(my.esquemaTatico == EsquemaTatico().e343) return fieldGameplay343();
    if(my.esquemaTatico == EsquemaTatico().e451) return fieldGameplay451();
    if(my.esquemaTatico == EsquemaTatico().e541) return fieldGameplay541();

    return Container();
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
      ),
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
      ),
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
      ),
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
