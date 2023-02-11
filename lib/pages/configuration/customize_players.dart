import 'dart:async';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/esquemas_taticos.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/player_basic.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/configuration/customize_club.dart';
import 'package:fifa/widgets/popup/popup_create_player.dart';
import 'package:fifa/widgets/popup/popup_edit_nationality.dart';
import 'package:fifa/widgets/popup/popup_ok_cancel.dart';
import 'package:fifa/widgets/popup/popup_save_all_data.dart';
import 'package:fifa/widgets/popup/popup_transfer_player_club.dart';
import 'package:fifa/widgets/popup/poup_edit.dart';
import 'package:fifa/theme/background_color/background_age.dart';
import 'package:fifa/theme/background_color/background_overall.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:fifa/widgets/button/button_design.dart';
import 'package:fifa/widgets/number_player_position.dart';
import 'package:flutter/material.dart';

import '../../classes/jogador.dart';

class CustomizePlayers extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final int clubID;
  const CustomizePlayers({Key? key, required this.clubID}) : super(key: key);
  @override
  _CustomizePlayersState createState() => _CustomizePlayersState();
}

class _CustomizePlayersState extends State<CustomizePlayers> {

  TextEditingController textEditingController = TextEditingController();

  List listAll = [];
  List listShow = [];
  late int choosenPlayerID;
  late Club club;

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    club = Club(index: widget.clubID);
    double escudoSize = 80;

    return Scaffold(
        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [
              Images().getWallpaper(),
              backButtonText(context,Translation(context).text.customizePlayers),

              Column(
                children: [

                  const SizedBox(height: 80),

                  //LOGO DO CLUBE
                  Row(
                    children: [
                      GestureDetector(
                          onTap:(){
                          },
                          child: Images().getEscudoWidget(club.name,escudoSize,escudoSize),
                      ),
                      const SizedBox(width: 8),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(
                            width: Sized(context).width - escudoSize-10,
                            child: Row(
                              children: [

                                Column(
                                  children: [
                                    Text(club.name,style: EstiloTextoBranco.negrito22),
                                    //N Jogadores
                                    Text('${Translation(context).text.player}: ${club.jogadores.length.toString()}',style: EstiloTextoBranco.text16),
                                  ],
                                ),

                                const Spacer(),
                                buttonDesign(
                                    title: 'Edit Club',
                                    function: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomizeClub(clubName: club.name)));
                                    }),
                              ],
                            ),
                          ),

                          //CUSTOMIZE
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              buttonDesign(
                                  title: Translation(context).text.save,
                                  function: (){
                                    //Salva os dados
                                    popUpSaveAllData(context: context);
                                    //Navigator.pop(context);
                                  }),

                              buttonDesign(
                                  title: Translation(context).text.createPlayer,
                                  function: (){
                                    setState(() {});
                                    popUpCreatePlayer(
                                        context: context,
                                        club: club,
                                        function: (){
                                          setState(() {});
                                        }
                                    );
                                  }
                              ),

                              buttonDesign(
                                  title: EsquemaTatico().e442,
                                  function: (){

                                  }),

                            ],
                          ),

                        ],
                      ),

                    ],
                  ),

                  //Jogadores por posição
                  playersPerPosition(club),

                  const SizedBox(height: 4),
                  //SHOW TABLE PLAYERS TITLE
                  Container(
                    color: AppColors().greyTransparent,
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        Text(Translation(context).text.pos3,style: EstiloTextoBranco.text16),
                        const SizedBox(width: 90),
                        SizedBox(width:170,
                            child: Text(Translation(context).text.name.toUpperCase(),style: EstiloTextoBranco.text16)
                        ),
                        Text(Translation(context).text.age3,style: EstiloTextoBranco.text16),
                        const SizedBox(width: 5),
                        Text(Translation(context).text.ovr3,style: EstiloTextoBranco.text16),
                      ],
                    ),
                  ),

                  //SHOW TABLE PLAYERS CONTENT
                  Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        color: AppColors().greyTransparent,
                        child: SingleChildScrollView(
                          child: Table(
                            columnWidths: const {
                              0: FractionColumnWidth(.09),
                              1: FractionColumnWidth(.1),
                              2: FractionColumnWidth(.08),
                              3: FractionColumnWidth(.5),
                              6: FractionColumnWidth(.07),
                              7: FractionColumnWidth(.001),//container to create vertical spacing
                            },
                            children: [
                              for(int i=0;i<club.nJogadores;i++)
                                playersRow(i),
                            ],
                          ),
                        ),
                      ),
                  ),

                ],
              )

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

TableRow playersRow(int i){

      int playerID = club.jogadores[i];
      Jogador player = Jogador(index: playerID);

    return TableRow(
      children: [

        //POSIÇÃO
        InkWell(
            onTap:(){
              choosenPlayerID = playerID;
              popupText(Translation(context).text.changePosition,player.position,'Position');
            },
            child: positionContainer(player.position),
        ),

        //CLUB
        InkWell(
            onTap:(){
              PopupConfig popupConfig = PopupConfig();
              popupConfig.choosenPlayerID = playerID;
              popUpChangePlayerClub(originalContext: context, popupConfig: popupConfig );

              Timer.periodic(const Duration(milliseconds: 100), (timer) {
                if (popupConfig.popupClosed) {
                  setState((){});
                  timer.cancel();
                }
              });

            },
            child: Images().getEscudoWidget(player.clubName,30,30)),

        //NATIONALITY
        InkWell(
            onTap:(){
              choosenPlayerID = playerID;
              popUpEditNationality(
                  context: context,
                  player: player,
                  function: (){
                    setState(() {});
              });
            },
            child: funcFlagsList(player.nationality, 20, 30),
        ),

        //NOME
        Container(
          margin: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            onTap:(){
              choosenPlayerID = playerID;
              popupText(Translation(context).text.changePlayersName,player.name,'Name');
            },
            child: SizedBox(
                width: 200,
                child: Text(player.name,style: EstiloTextoBranco.text16)
            ),
          ),
        ),

        //IDADE
        Container(
          width: 22,
          color: colorAgeBackground(player.age),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: InkWell(
              onTap:(){
                choosenPlayerID = playerID;
                popupNumber(player.age,'Idade');

              },
              child: Center(child: Text(player.age.toStringAsFixed(0),style: EstiloTextoPreto.text16))),
        ),

        //OVERALL
        Container(
          width: 22,
          color: colorOverallBackground(player.overall),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: InkWell(
              onTap:(){
                choosenPlayerID = playerID;
                popupNumber(globalJogadoresOverall[playerID],'Overall');
              },
              child: Center(child: Text(player.overall.toStringAsFixed(0),style: EstiloTextoPreto.text16))),
        ),

        //DELETE
        InkWell(
          onTap:(){
            popUpOkCancel(
                context: context,
                title: Translation(context).text.deletePlayer+'?',
                content: '',
                function: (){
                  PlayerBasicInfo playerBasic = PlayerBasicInfo();
                  playerBasic.deletePlayerFromDatabase(player.index);
                  setState(() {});
                }
            );
          },
          child: const Center(child: Icon(Icons.close,color: Colors.red),),
        ),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
      ],
    );

  }


popupText(String title,String variableString, String whichData){

  popupEdit(
      context: context,
      title: title,
      variable: variableString,
      isStringType: true,
      maxNcharacters: 22,
      functionOK: (value){
         if(whichData=='Position' && positions[EsquemaTatico().e442].containsKey(value)) {
            globalJogadoresPosition[choosenPlayerID] = value;
         }else if(whichData=='Position' && !positions[EsquemaTatico().e442].containsKey(value)){
            customToast(Translation(context).text.invalidPosition);
          }

        if(whichData=='Name') globalJogadoresName[choosenPlayerID] = value;

            setState(() {});

      }
  );
}
popupNumber(dynamic number, String whichData){
    popupEdit(
        context: context,
        title: Translation(context).text.newValueTo+' '+whichData,
        variable: number,
        isStringType: true,
        maxNcharacters: 22,
        functionOK: (valueStr){
          int value = int.parse(valueStr);
          if(whichData=='Idade' && value<45 && value>=16) globalJogadoresAge[choosenPlayerID] = value;
          if(whichData=='Overall' && value<100 && value>40) globalJogadoresOverall[choosenPlayerID] = value;
          setState(() {});
        }
    );
  }




}