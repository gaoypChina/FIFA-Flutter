import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/match.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/widgets/field_size.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

class Substitution extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const Substitution({Key? key}) : super(key: key);
  @override
  _SubstitutionState createState() => _SubstitutionState();
}

class _SubstitutionState extends State<Substitution> {

  My my = My();
  int dragPlayer = -1;
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    Club myClub = Club(index: my.clubID);

    return Scaffold(

        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [

              Images().getWallpaper(),

              Column(
                children: [

                  const SizedBox(height: 40),
                  const Text('Substituição',style: EstiloTextoBranco.text30),
                  Text('${globalMatchSubstitutionsLeft.toString()} restantes',style: EstiloTextoBranco.text16),

                  const SizedBox(height: 8),
                  fieldSizeWidget(
                      fieldGameplay442(),
                  ),

                  const Text('Reservas',style: EstiloTextoBranco.text20),
                  Container(
                    height: 90,
                    color: AppColors().greyTransparent,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount:  myClub.nJogadores>11 ? myClub.nJogadores> 18 ? 7 : myClub.nJogadores -11 : 0,
                        itemBuilder: (BuildContext context, int index) {
                          index = index+11;
                          return draggable(my.jogadores[index]);
                        }
                    ),
                  ),

                  const Text('Estratégias',style: EstiloTextoBranco.text20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Contra-Atacar',style: EstiloTextoBranco.text12),
                      Text('Bola Aérea',style: EstiloTextoBranco.text12),
                      Text('Pressionar',style: EstiloTextoBranco.text12),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Marcação Alta',style: EstiloTextoBranco.text12),
                      Text('Posse de bola',style: EstiloTextoBranco.text12),
                      Text('Solidez Defensiva',style: EstiloTextoBranco.text12),
                    ],
                  ),

                  const Spacer(),
                  //VOLTAR
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child:  customButtonContinue(
                        title: 'VOLTAR',
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
          int finalPosition1 = globalMyJogadores.indexOf(playerIDData);
          int finalPosition2 = globalMyJogadores.indexOf(playerTargetID);

          Match matchClass1 = Match(playerID: playerIDData);
          Match matchClass2 = Match(playerID: playerIDData);
          if(matchClass1.redCard==0 && matchClass2.redCard == 0){
              //Troca Jogadores
              globalMyJogadores[finalPosition1] = playerTargetID;
              globalMyJogadores[finalPosition2] = playerIDData;

              //-1 Substituição possivel
              if (finalPosition1 > 10 || finalPosition2 > 10) {
                globalMatchSubstitutionsLeft--;
              }

              setState(() {});
          }else {
            customToast('Jogadores expulsos não podem ser substítuidos');
          }
        }else{
          customToast('Sem substituições restantes');
        }
      },
    );
  }

  Widget playerWidgetOVR(int playerIndex){
    Jogador player = Jogador(index: playerIndex);

    Match matchClass = Match(playerID: playerIndex);

    String name = player.name;
    String position = player.position;
    double imageSize = 50;
    bool yellowCard = matchClass.yellowCard>0;
    bool redCard = matchClass.redCard>0;
    bool injury = matchClass.injury>0;
    bool goal = matchClass.goals>0;
    double healthBar = matchClass.health;

    String circleShow = player.overall.toStringAsFixed(0);

    if(injury || redCard){healthBar=0;}

    return GestureDetector(
      onTap:(){
        //PLAYER INFOS
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
                      child: Image.asset(Images().getUniform(player.clubName))
                  )
                      : Image.asset(Images().getUniform(player.clubName)),

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
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(circleShow,style: EstiloTextoPreto.text14),
                    ),
                  ),

                  //POSIÇÃO
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(position,style: EstiloTextoBranco.text14),
                    ),
                  ),

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
                color: AppColors().greyTransparent,
                width: 80,
                child: Text(name,textAlign: TextAlign.center,style: EstiloTextoBranco.text10)
            ),

          ],
        ),
      ),
    );
  }

  Widget fieldGameplay442(){
    return fieldSizeWidget(
        Column(
          children: [
            //ATACANTES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                playerWidget(my.jogadores[9]),
                playerWidget(my.jogadores[10]),
              ],
            ),
            //MEIAS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                playerWidget(my.jogadores[7]),
                playerWidget(my.jogadores[8]),
              ],
            ),
            //VOLANTES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                playerWidget(my.jogadores[5]),
                playerWidget(my.jogadores[6]),
              ],
            ),
            //ZAGUEIROS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                playerWidget(my.jogadores[1]),
                playerWidget(my.jogadores[2]),
                playerWidget(my.jogadores[3]),
                playerWidget(my.jogadores[4]),
              ],
            ),

            //GOLEIRO
            playerWidget(my.jogadores[0]),

          ],
        )
    );

  }

  Widget playerWidget(int playerID){
    return dragPlayer<0 ? draggable(playerID): draggableTarget(playerID);
  }
}