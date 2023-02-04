import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/widgets/popup/popup_player_info.dart';
import 'package:fifa/theme/background_color/background_age.dart';
import 'package:fifa/theme/background_color/background_overall.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button_square_selection.dart';
import 'package:flutter/material.dart';

class AllInfosClub extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final Club club;
  final Function() notifyParent;
  const AllInfosClub({Key? key, required this.club, required this.notifyParent}) : super(key: key);
  @override
  _AllInfosClubState createState() => _AllInfosClubState();
}

class _AllInfosClubState extends State<AllInfosClub> {

  double buttonSize = 50;
  int selection = 0;

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

                  Expanded(
                    child: Container(
                      color: AppColors().greyTransparent,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: SingleChildScrollView(
                        child: selection==0
                            ? tableWidget0()
                            : selection==1 ? tableWidget1()
                            : selection==2 ? tableWidget3()
                            : tableWidget2(),
                      ),
                    ),
                  ),


                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      buttonSquareSelection(
                          conditionWhenTrue: selection==0,
                          height: 25, width: 50,
                          function: (){
                            selection = 0;
                            setState(() {});
                          }),
                      buttonSquareSelection(
                          conditionWhenTrue: selection==1,
                          height: 25, width: 50,
                          function: (){
                            selection = 1;
                            setState(() {});
                          }),
                      buttonSquareSelection(
                          conditionWhenTrue: selection==2,
                          height: 25, width: 50,
                          function: (){
                            selection = 2;
                            setState(() {});
                          }),
                    ],
                  ),

                  const SizedBox(height: 10),


                ],
              ),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Table tableWidget0(){
    return Table(
      columnWidths: const {
        0: FractionColumnWidth(.09),
        1: FractionColumnWidth(.09),
        2: FractionColumnWidth(.4),
        3: FractionColumnWidth(.09),
        4: FractionColumnWidth(.09),
        5: FractionColumnWidth(.16),
      },
      children: [

        TableRow(
      children: [
        const Text(''),
        const Text(''),
        Text(Translation(context).text.name, style: EstiloTextoBranco.text16),
        Text(Translation(context).text.age3, textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        Text(Translation(context).text.ovr3, textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        const Text('\$', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        ]),

        for(int i=0; i<widget.club.escalacao.length; i++)
          playersRow0(i,widget.club.escalacao[i])
      ],
    );
  }
  Table tableWidget1(){
    return Table(
      columnWidths: const {
        0: FractionColumnWidth(.09),
        1: FractionColumnWidth(.09),
        2: FractionColumnWidth(.45),
        3: FractionColumnWidth(.1),
        4: FractionColumnWidth(.1),
        5: FractionColumnWidth(.1),
      },
      children: [

        TableRow(
            children: [
              const Text(''),
              const Text(''),
              Text(Translation(context).text.name, style: EstiloTextoBranco.text16),
              Text(Translation(context).text.playedP, textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text(Translation(context).text.goalsG, textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text(Translation(context).text.assistsA, textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
            ]),

        for(int i=0; i<widget.club.escalacao.length; i++)
          playersRow0(i,widget.club.escalacao[i])
      ],
    );
  }
  Table tableWidget2(){
    return Table(
      columnWidths: const {
        0: FractionColumnWidth(.09),
        1: FractionColumnWidth(.09),
        2: FractionColumnWidth(.45),
        3: FractionColumnWidth(.1),
        4: FractionColumnWidth(.1),
        5: FractionColumnWidth(.1),
      },
      children: [
        TableRow(
            children: [
              const Text(''),
              const Text(''),
              Text(Translation(context).text.name, style: EstiloTextoBranco.text16),
              const Text('+', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text(Translation(context).text.yellowCards3, textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text(Translation(context).text.redCards3, textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
            ]),

        for(int i=0; i<widget.club.escalacao.length; i++)
          playersRow0(i,widget.club.escalacao[i])
      ],
    );
  }
  Table tableWidget3(){
    return Table(
      columnWidths: const {
        0: FractionColumnWidth(.09),
        1: FractionColumnWidth(.09),
        2: FractionColumnWidth(.45),
        3: FractionColumnWidth(.1),
        4: FractionColumnWidth(.1),
        5: FractionColumnWidth(.1),
      },
      children: [

        TableRow(
            children: [
              const Text(''),
              const Text(''),
              Text(Translation(context).text.name, style: EstiloTextoBranco.text16),
              Text('${Translation(context).text.playedP}*', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text('${Translation(context).text.goalsG}*', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text('${Translation(context).text.assistsA}*', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
            ]),

        for(int i=0; i<widget.club.escalacao.length; i++)
          playersRow3(i,widget.club.escalacao[i])
      ],
    );
  }
  TableRow playersRow0(int row,int playerIndex){

    Jogador player = Jogador(index: playerIndex);
    Color background = Colors.transparent;
    if(row<11){
      background = Colors.black;
    }

    if(selection==1){
      return playersRow1(row,playerIndex);
    }
    if(selection==3){
      return playersRow2(row,playerIndex);
    }

    return TableRow(
      decoration: BoxDecoration(
        color: background,
      ),
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: positionContainer(player.position)),
        funcFlagsList(player.nationality, 20, 20),
        playerNameWidget(player),
        Container(
            color: colorAgeBackground(player.age),
            padding: const EdgeInsets.all(4),
            child: Text(player.age.toString(), textAlign:TextAlign.center,style: EstiloTextoPreto.text16)),
        Container(
            color: colorOverallBackground(player.overall),
            padding: const EdgeInsets.all(4),
            child: Text(player.overall.toStringAsFixed(0),
                textAlign:TextAlign.center,
                style: EstiloTextoPreto.text16)
        ),
        Text(player.price.toStringAsFixed(2) + 'mi',
            textAlign:TextAlign.center,
            style: EstiloTextoBranco.text14),
      ],
    );
  }


  TableRow playersRow1(int row,int playerIndex){

    Jogador player = Jogador(index: playerIndex);
    Color background = Colors.transparent;
    if(row<11){
      background = Colors.black;
    }

    return TableRow(
      decoration: BoxDecoration(
        color: background,
      ),
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: positionContainer(player.position)),
        funcFlagsList(player.nationality, 20, 20),
        playerNameWidget(player),
        Text(player.matchsLeague.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        Text(player.goalsLeague.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        Text(player.assistsLeague.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
      ],
    );
  }

  TableRow playersRow2(int row,int playerIndex){

    Jogador player = Jogador(index: playerIndex);

    Color background = Colors.transparent;
    if(row<11){
      background = Colors.black;
    }

    return TableRow(
      decoration: BoxDecoration(
        color: background,
      ),
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: positionContainer(player.position)),
        funcFlagsList(player.nationality, 20, 20),
        playerNameWidget(player),
        Text(player.injury.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        Container(
          width: 15,
            color: Colors.yellow,
            child: Text(player.yellowCard.toString(),textAlign:TextAlign.center,style: EstiloTextoPreto.text14)
        ),
        Container(
            width: 15,
          color: Colors.red,
            child: Text(player.redCard.toString(),textAlign:TextAlign.center,style: EstiloTextoPreto.text14)
        ),
      ],
    );
  }

  TableRow playersRow3(int row,int playerIndex){

    Jogador player = Jogador(index: playerIndex);
    Color background = Colors.transparent;
    if(row<11){
      background = Colors.black;
    }

    return TableRow(
      decoration: BoxDecoration(
        color: background,
      ),
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: positionContainer(player.position)),
        funcFlagsList(player.nationality, 20, 20),
        playerNameWidget(player),
        Text(player.matchsCarrer.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        Text(player.goalsCarrer.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        Text(player.assistsCarrer.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
      ],
    );
  }

  Widget playerNameWidget(Jogador player){

    Color nameColor = Colors.white;
    if(player.injury>0 || player.redCard>0 || player.yellowCard==3){
      nameColor = Colors.red;
    }
    return         GestureDetector(
      onTap:(){
        popUpOkShowPlayerInfos(
            context: context,
            playerID: player.index,
            funcSetState: (){
              setState(() {});
              widget.notifyParent();
            }
            );
      },
      child: Container(
          width: 170,
          margin: const EdgeInsets.only(left: 6),
          child: Text(player.name, style: TextStyle(
            color: nameColor,
            fontFamily: 'Roboto',
            fontSize: 16,
          ))
      ),
    );
  }
}