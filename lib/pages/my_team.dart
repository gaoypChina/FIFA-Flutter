import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/esquemas_taticos.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/my_team_all_infos.dart';
import 'package:fifa/popup/popup_player_info.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/widgets/button/button_return.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/field_size.dart';
import 'package:flutter/material.dart';
import '../classes/my.dart';

class MyTeam extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const MyTeam({Key? key}) : super(key: key);
  @override
  _MyTeamState createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> {

  Club myClub = Club(index: My().clubID);
  My my = My();

  //Change player position
  bool select = false;
  late int selectedIndexPosition;
  late int selectedIndexConteudo;

  String show = 'OVR';
  late double averageAge;

  int dragPlayer = -1;
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }
  doThisOnLaunch() {
    setAverageAge();
    setState(() {});
  }
  setAverageAge(){
    averageAge = 0;
    for(int i=0; i<myClub.nJogadores; i++){
      averageAge += Jogador(index: my.jogadores[i]).age;
    }
    averageAge = averageAge / myClub.nJogadores;
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    myClub = Club(index: My().clubID);
    my = My();

    return WillPopScope(//IF GO BACK TO PREVIOUS PAGE
      onWillPop: () async{
        return true;
      },
      child: Scaffold(

          resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
          body:  Stack(
              children: [

                Images().getWallpaper(),

                Column(
                  children: [

                    const SizedBox(height: 30),

                    Row(
                      children: [
                        //Escudo da Equipe
                        Image.asset(Images().getMyEscudo(),height: 80,width: 80),

                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Saldo: \$'+my.money.toStringAsFixed(2)+'mi', style: EstiloTextoBranco.text22),
                              Text('Overall: '+myClub.getOverall().toStringAsFixed(2), style: EstiloTextoBranco.text16),
                              Text('Média Idade: '+averageAge.toStringAsFixed(2), style: EstiloTextoBranco.text16),
                            ],
                          ),
                        ),

                        //MUDAR ESQUEMA TATICO
                        customButtonContinue(
                            title: my.esquemaTatico,
                            function: (){
                              EsquemaTatico().changeMyEsquema();
                                setState(() {});
                              }
                            ),

                      ],
                    ),

                    //Widget do campo
                    fieldWidget(),



                    const       SizedBox(height: 4),
                    Container(
                      width: _width,
                      color: AppColors().greyTransparent,
                        child: const Text('RESERVAS:', style: EstiloTextoBranco.text22)
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
                            return
                              dragPlayer<0
                                  ?  draggable(my.jogadores[index])
                                  : draggableTarget(my.jogadores[index]);
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
                            return
                              dragPlayer<0
                                  ?  draggable(my.jogadores[index])
                                  : draggableTarget(my.jogadores[index]);
                          }
                      ),
                    ),

                    //FILTRAR POR TÓPICOS
                    Padding(
                      padding: const EdgeInsets.only(top:4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          button(title: 'OVR', function: (){setState(() {});show = 'OVR';}),
                          button(title: 'Idade', function: (){setState(() {});show = 'Idade';}),
                          button(title: 'Jogos', function: (){setState(() {});show = 'Jogos';}),
                          button(title: 'Gols', function: (){setState(() {});show = 'Gols';}),
                          button(title: 'Assists.', function: (){setState(() {});show = 'Assists';}),
                          button(title: 'Ver Mais', function: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => const MyTeamAllInfo()));
                          }),
                        ],
                      ),
                    ),

                  ],
                ),

            //BOTAO DE VOLTAR
            returnButton(context),

              ]
          ),
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
        funcSetState: (){setState(() {});}
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  button({required String title, required Function()? function}) {
    return InkWell(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(
              Radius.circular(10.0) //                 <--- border radius here
          ),
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
        },
    );
  }


Widget fieldWidget(){
    if(My().esquemaTatico == EsquemaTatico().e442) return fieldGameplay442();
    if(My().esquemaTatico == EsquemaTatico().e433) return fieldGameplay433();
    if(My().esquemaTatico == EsquemaTatico().e343) return fieldGameplay343();
    if(My().esquemaTatico == EsquemaTatico().e451) return fieldGameplay451();

    return Container();
}


Widget playerWidgetOVR(int playerIndex){
    Jogador player = Jogador(index: playerIndex);

    String name = player.name;
    String position = player.position;
    double imageSize = 50;
    double healthBar = 1;

    String circleShow = player.overallDynamic.toStringAsFixed(0);
    if(show == 'Jogos'){circleShow = player.matchsLeague.toStringAsFixed(0);}
    else if(show == 'Gols'){circleShow = player.goalsLeague.toStringAsFixed(0);}
    else if(show == 'Assists'){circleShow = player.assistsLeague.toStringAsFixed(0);}
    else if(show == 'Idade'){circleShow = player.age.toStringAsFixed(0);}

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
              height: imageSize-5,
              width: imageSize,
              child: Stack(
                children: [

                  //Uniforme
                  (player.injury >0 || player.redCard >0)
                      ? Opacity(
                        opacity: 0.4,
                        child: Image.asset(Images().getMyUniform())
                      )
                      : Image.asset(Images().getMyUniform()),

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

  Widget fieldGameplay433(){
    return fieldSizeWidget(
          Column(
            children: [
              //ATACANTES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  playerWidget(my.jogadores[8]),
                  playerWidget(my.jogadores[9]),
                  playerWidget(my.jogadores[10]),
                ],
              ),
              //MEIAS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  playerWidget(my.jogadores[7]),
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
          ),
    );

  }
  Widget fieldGameplay343(){
    return fieldSizeWidget(
          Column(
            children: [
              //ATACANTES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  playerWidget(my.jogadores[8]),
                  playerWidget(my.jogadores[9]),
                  playerWidget(my.jogadores[10]),
                ],
              ),
              //MEIAS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  playerWidget(my.jogadores[7]),
                  playerWidget(my.jogadores[6]),
                ],
              ),
              //VOLANTES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  playerWidget(my.jogadores[5]),
                  playerWidget(my.jogadores[4]),
                ],
              ),
              //ZAGUEIROS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  playerWidget(my.jogadores[1]),
                  playerWidget(my.jogadores[2]),
                  playerWidget(my.jogadores[3]),
                ],
              ),

              //GOLEIRO
              playerWidget(my.jogadores[0]),

            ],
          ),
    );

  }
  Widget fieldGameplay451(){
    return fieldSizeWidget(
          Column(
            children: [
              //ATACANTES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  playerWidget(my.jogadores[10]),
                ],
              ),
              //MEIAS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  playerWidget(my.jogadores[7]),
                  playerWidget(my.jogadores[8]),
                  playerWidget(my.jogadores[9]),
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
          ),
    );

  }

  Widget playerWidget(int playerID){
    return dragPlayer<0 ? draggable(playerID): draggableTarget(playerID);
  }

}