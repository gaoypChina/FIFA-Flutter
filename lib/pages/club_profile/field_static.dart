import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/popup/popup_player_info.dart';
import 'package:fifa/theme/background/background_position.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/field_size.dart';
import 'package:flutter/material.dart';

import '../../theme/textstyle.dart';

class StaticField extends StatefulWidget {
  final int clubID;
  const StaticField({Key? key, required this.clubID}) : super(key: key);
  @override
  State<StaticField> createState() => _StaticFieldState();
}

class _StaticFieldState extends State<StaticField> {

  late Club clubClass;
  String show = 'OVR';
  List jogadoresOrganizados = [];

  @override
  Widget build(BuildContext context) {

    clubClass = Club(index: widget.clubID);
    jogadoresOrganizados = clubClass.escalacao;

    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),
          Column(
            children: [

              //Widget do campo
              fieldGameplay442(),

              const       SizedBox(height: 4),
              Container(
                  width: Sized(context).width,
                  color: AppColors().greyTransparent,
                  child: Text('${Translation(context).text.substitutes}:', style: EstiloTextoBranco.text22)
              ),

              Container(
                height: 90,
                color: AppColors().greyTransparent,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:  clubClass.nJogadores>11 ? clubClass.nJogadores> 18 ? 7 : clubClass.nJogadores -11 : 0,
                    itemBuilder: (BuildContext context, int index) {
                      index = index+11;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: playerWidgetOVR(jogadoresOrganizados[index]),
                      );
                    }
                ),
              ),

              Container(
                height: 90,
                color: AppColors().greyTransparent,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: clubClass.nJogadores>18 ? clubClass.nJogadores-18 : 0,
                    itemBuilder: (BuildContext context, int index) {
                      index = index+18;
                      return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: playerWidgetOVR(jogadoresOrganizados[index]));
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
                    button(title: Translation(context).text.age, function: (){setState(() {});show = 'Idade';}),
                    button(title: Translation(context).text.matchs, function: (){setState(() {});show = 'Jogos';}),
                    button(title: Translation(context).text.goals, function: (){setState(() {});show = 'Gols';}),
                    button(title: Translation(context).text.assists, function: (){setState(() {});show = 'Assists';}),
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////
  comprarJogador(Jogador player){
    popUpOkShowPlayerInfos(
      context: context,
      playerID: player.index,
      funcSetState: (){setState(() {});},
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


  Widget playerWidgetOVR(int playerIndex){
    Jogador player = Jogador(index: playerIndex);

    int positionNumber = jogadoresOrganizados.indexOf(player.index);
    player.isPlayerInRightPosition(positionNumber);

    String name = player.name;
    String position = player.position;
    double imageSize = 57;

    String circleShow = player.overallDynamic.toStringAsFixed(0);
    if(show == 'Jogos'){circleShow = player.matchsLeague.toStringAsFixed(0);}
    else if(show == 'Gols'){circleShow = player.goalsLeague.toStringAsFixed(0);}
    else if(show == 'Assists'){circleShow = player.assistsLeague.toStringAsFixed(0);}
    else if(show == 'Idade'){circleShow = player.age.toStringAsFixed(0);}

    return GestureDetector(
      onTap:(){
        //PLAYER INFOS
        comprarJogador(player);
      },
      onDoubleTap: (){
        comprarJogador(player);
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
                        child: Image.asset(Images().getUniform(player.clubName))
                    )
                        : globalHasInternet ? Image.network(player.imageUrl) : Image.asset(Images().getUniform(player.clubName)),
                  ),

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
                    child: positionContainer(position),
                  ),

                ],
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


  Widget fieldGameplay442(){
    List jogadoresTitulares = jogadoresOrganizados;
    return fieldSizeWidget(
      Column(
        children: [
          //ATACANTES
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              playerWidgetOVR(jogadoresTitulares[9]),
              playerWidgetOVR(jogadoresTitulares[10]),
            ],
          ),
          //MEIAS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              playerWidgetOVR(jogadoresTitulares[7]),
              playerWidgetOVR(jogadoresTitulares[8]),
            ],
          ),
          //VOLANTES
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              playerWidgetOVR(jogadoresTitulares[5]),
              playerWidgetOVR(jogadoresTitulares[6]),
            ],
          ),
          //ZAGUEIROS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              playerWidgetOVR(jogadoresTitulares[1]),
              playerWidgetOVR(jogadoresTitulares[2]),
              playerWidgetOVR(jogadoresTitulares[3]),
              playerWidgetOVR(jogadoresTitulares[4]),
            ],
          ),

          //GOLEIRO
          playerWidgetOVR(jogadoresTitulares[0]),

        ],
      ),
    );
  }

}
