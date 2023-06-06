import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
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

class StaticField extends StatefulWidget {
  final int clubID;
  final bool hasReserves;
  const StaticField({Key? key, required this.clubID, required this.hasReserves}) : super(key: key);
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
          SingleChildScrollView(
            child: Column(
              children: [

                //Widget do campo
                Stack(
                  children: [

                    fieldGameplay442(),

                    //FILTER SELECTION
                    Container(
                      width: 50,
                      padding: const EdgeInsets.only(top:300),
                      child: buttonIcon(
                          widget: const Icon(Icons.filter_alt_rounded, color: Colors.white,),
                          function: (){bottomSheetFilterOptions(context);}
                      ),
                    ),

                  ],
                ),


                widget.hasReserves ? Container(
                  padding: const EdgeInsets.only(top: 4),
                    width: Sized(context).width,
                    color: AppColors().greyTransparent,
                    child: Row(
                      children: [
                        Text('${Translation(context).text.substitutes}:', style: EstiloTextoBranco.negrito18),
                        const Spacer(),
                        Column(
                          children: [
                            Text('${Translation(context).text.avgAge}: ' + clubClass.getAverageAge().toStringAsFixed(2), style: EstiloTextoBranco.text14),
                            Text('${Translation(context).text.player}: ' + clubClass.nJogadores.toString(), style: EstiloTextoBranco.text14),
                          ],
                        ) ],
                    )
                ) : Container(),

                widget.hasReserves ? Container(
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
                ) : Container(),

                widget.hasReserves ? Container(
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
                ) : Container(),

                //ANALISE DO ELENCO
                analiseElenco(context, clubClass),

              ],
            ),
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

  Widget playerWidgetOVR(int playerIndex){
    Jogador player = Jogador(index: playerIndex);

    int positionNumber = jogadoresOrganizados.indexOf(player.index);
    player.isPlayerInRightPosition(positionNumber);

    String name = player.name;
    String position = player.position;
    double imageSize = 57;

    String circleShow = player.overallDynamic.toStringAsFixed(0);
    Color colorBackground = colorOverallBackground(player.overallDynamic);
    if(show == 'Jogos'){circleShow = player.matchsLeague.toStringAsFixed(0);colorBackground = Colors.transparent;}
    else if(show == 'Gols'){circleShow = player.goalsLeague.toStringAsFixed(0);colorBackground = Colors.transparent;}
    else if(show == 'Assists'){circleShow = player.assistsLeague.toStringAsFixed(0);colorBackground = Colors.transparent;}
    else if(show == 'Idade'){
      circleShow = player.age.toStringAsFixed(0);
      colorBackground = colorAgeBackground(player.age);
    }

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

                  //Uniforme/Player Image
                  Center(
                    child: (player.injury >0 || player.redCard >0)
                        ? Opacity(
                        opacity: 0.4,
                        child: Images().getUniformWidget(player.clubName,imageSize-15,imageSize+15),
                    )
                        : globalHasInternet
                          ? Images().getPlayerPictureWidget(player,imageSize-15,imageSize-15)
                          : Images().getUniformWidget(player.clubName,imageSize-15,imageSize+15),
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
