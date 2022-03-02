import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/Jogador.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/my_team_all_infos.dart';
import 'package:fifa/popup/popup_player_info.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/button_continue.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/widgets/button_return.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../classes/my.dart';
import '../values/images.dart';

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

                Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill,),

                Column(
                  children: [

                    const SizedBox(height: 30),

                    Row(
                      children: [
                        //Escudo da Equipe
                        Image.asset('assets/clubs/${FIFAImages().imageLogo(my.clubName)}.png',height: 80,width: 80),

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
                              if(globalMyEsquemaTatico=='4-4-2'){globalMyEsquemaTatico = '4-3-3';}
                              else if(globalMyEsquemaTatico=='4-3-3'){globalMyEsquemaTatico = '3-4-3';}
                              else if(globalMyEsquemaTatico=='3-4-3'){globalMyEsquemaTatico = '4-5-1';}
                              else if(globalMyEsquemaTatico=='4-5-1'){globalMyEsquemaTatico = '4-4-2';}
                                setState(() {});
                            }
                            ),

                      ],
                    ),

                    //Widget do campo
                    fieldWidget(my.clubName),



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
                          itemCount:  myClub.nJogadores>11 ? 7 : 0,
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
          int playerIDData = int.parse(data.toString());
          int finalPosition1 = globalMyJogadores.indexOf(playerIDData);
          int finalPosition2 = globalMyJogadores.indexOf(playerTargetID);
          //Troca Jogadores
          globalMyJogadores[finalPosition1] = playerTargetID;globalMyJogadores[finalPosition2] = playerIDData;
          setState(() {});
        },
    );
  }


Widget fieldWidget(String clubName){
    if(My().esquemaTatico == '4-4-2') return fieldGameplay442();
    if(My().esquemaTatico == '4-3-3') return fieldGameplay433();
    if(My().esquemaTatico == '3-4-3') return fieldGameplay343();
    if(My().esquemaTatico == '4-5-1') return fieldGameplay451();

    return Container();
}


Widget playerWidgetOVR(int playerIndex){
    Jogador player = Jogador(index: playerIndex);

    String name = player.name;
    String position = player.position;
    double imageSize = 50;

    String circleShow = player.overall.toStringAsFixed(0);
    if(show == 'Jogos'){circleShow = player.matchs.toStringAsFixed(0);}
    else if(show == 'Gols'){circleShow = player.goals.toStringAsFixed(0);}
    else if(show == 'Assists'){circleShow = player.assists.toStringAsFixed(0);}
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
                        child: Image.asset('assets/clubs/${FIFAImages().imageLogo(My().clubName)}1.png')
                      )
                      : Image.asset('assets/clubs/${FIFAImages().imageLogo(My().clubName)}1.png'),

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
    return SizedBox(
      height: 360,
      child: Stack(
        children: [

          //Campo
          Image.asset('assets/icons/campo metade.png',height:double.infinity,width:double.infinity,fit:BoxFit.fill),

          Column(
            children: [
              //ATACANTES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[9]): draggableTarget(my.jogadores[9]),
                  dragPlayer<0 ? draggable(my.jogadores[10]): draggableTarget(my.jogadores[10]),
                ],
              ),
              //MEIAS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[7]): draggableTarget(my.jogadores[7]),
                  dragPlayer<0 ? draggable(my.jogadores[8]): draggableTarget(my.jogadores[8]),
                ],
              ),
              //VOLANTES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[5]): draggableTarget(my.jogadores[5]),
                  dragPlayer<0 ? draggable(my.jogadores[6]): draggableTarget(my.jogadores[6]),
                ],
              ),
              //ZAGUEIROS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[1]): draggableTarget(my.jogadores[1]),
                  dragPlayer<0 ? draggable(my.jogadores[2]): draggableTarget(my.jogadores[2]),
                  dragPlayer<0 ? draggable(my.jogadores[3]): draggableTarget(my.jogadores[3]),
                  dragPlayer<0 ? draggable(my.jogadores[4]): draggableTarget(my.jogadores[4]),
                ],
              ),

              //GOLEIRO
              dragPlayer<0 ? draggable(my.jogadores[0]): draggableTarget(my.jogadores[0]),

            ],
          ),
        ],
      ),
    );

  }

  Widget fieldGameplay433(){
    return SizedBox(
      height: 360,
      child: Stack(
        children: [

          //Campo
          Image.asset('assets/icons/campo metade.png',height:double.infinity,width:double.infinity,fit:BoxFit.fill),

          Column(
            children: [
              //ATACANTES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[8]): draggableTarget(my.jogadores[10]),
                  dragPlayer<0 ? draggable(my.jogadores[9]): draggableTarget(my.jogadores[9]),
                  dragPlayer<0 ? draggable(my.jogadores[10]): draggableTarget(my.jogadores[8]),
                ],
              ),
              //MEIAS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[7]): draggableTarget(my.jogadores[7]),
                ],
              ),
              //VOLANTES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[5]): draggableTarget(my.jogadores[6]),
                  dragPlayer<0 ? draggable(my.jogadores[6]): draggableTarget(my.jogadores[5]),
                ],
              ),
              //ZAGUEIROS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[1]): draggableTarget(my.jogadores[4]),
                  dragPlayer<0 ? draggable(my.jogadores[2]): draggableTarget(my.jogadores[3]),
                  dragPlayer<0 ? draggable(my.jogadores[3]): draggableTarget(my.jogadores[2]),
                  dragPlayer<0 ? draggable(my.jogadores[4]): draggableTarget(my.jogadores[1]),
                ],
              ),

              //GOLEIRO
              dragPlayer<0 ? draggable(my.jogadores[0]): draggableTarget(my.jogadores[0]),

            ],
          ),
        ],
      ),
    );

  }
  Widget fieldGameplay343(){
    return SizedBox(
      height: 360,
      child: Stack(
        children: [

          //Campo
          Image.asset('assets/icons/campo metade.png',height:double.infinity,width:double.infinity,fit:BoxFit.fill),

          Column(
            children: [
              //ATACANTES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[10]): draggableTarget(my.jogadores[10]),
                  dragPlayer<0 ? draggable(my.jogadores[9]): draggableTarget(my.jogadores[9]),
                  dragPlayer<0 ? draggable(my.jogadores[8]): draggableTarget(my.jogadores[8]),
                ],
              ),
              //MEIAS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[7]): draggableTarget(my.jogadores[7]),
                  dragPlayer<0 ? draggable(my.jogadores[6]): draggableTarget(my.jogadores[6]),
                ],
              ),
              //VOLANTES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[5]): draggableTarget(my.jogadores[5]),
                  dragPlayer<0 ? draggable(my.jogadores[4]): draggableTarget(my.jogadores[4]),
                ],
              ),
              //ZAGUEIROS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[3]): draggableTarget(my.jogadores[3]),
                  dragPlayer<0 ? draggable(my.jogadores[2]): draggableTarget(my.jogadores[2]),
                  dragPlayer<0 ? draggable(my.jogadores[1]): draggableTarget(my.jogadores[1]),
                ],
              ),

              //GOLEIRO
              dragPlayer<0 ? draggable(my.jogadores[0]): draggableTarget(my.jogadores[0]),

            ],
          ),
        ],
      ),
    );

  }
  Widget fieldGameplay451(){
    return SizedBox(
      height: 360,
      child: Stack(
        children: [

          //Campo
          Image.asset('assets/icons/campo metade.png',height:double.infinity,width:double.infinity,fit:BoxFit.fill),

          Column(
            children: [
              //ATACANTES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[10]): draggableTarget(my.jogadores[10]),
                ],
              ),
              //MEIAS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[9]): draggableTarget(my.jogadores[9]),
                  dragPlayer<0 ? draggable(my.jogadores[8]): draggableTarget(my.jogadores[8]),
                  dragPlayer<0 ? draggable(my.jogadores[7]): draggableTarget(my.jogadores[7]),
                ],
              ),
              //VOLANTES
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[6]): draggableTarget(my.jogadores[6]),
                  dragPlayer<0 ? draggable(my.jogadores[5]): draggableTarget(my.jogadores[5]),
                ],
              ),
              //ZAGUEIROS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dragPlayer<0 ? draggable(my.jogadores[4]): draggableTarget(my.jogadores[4]),
                  dragPlayer<0 ? draggable(my.jogadores[3]): draggableTarget(my.jogadores[3]),
                  dragPlayer<0 ? draggable(my.jogadores[2]): draggableTarget(my.jogadores[2]),
                  dragPlayer<0 ? draggable(my.jogadores[1]): draggableTarget(my.jogadores[1]),
                ],
              ),

              //GOLEIRO
              dragPlayer<0 ? draggable(my.jogadores[0]): draggableTarget(my.jogadores[0]),

            ],
          ),
        ],
      ),
    );

  }
}