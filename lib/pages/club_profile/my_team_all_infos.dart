import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/popup/popup_player_info.dart';
import 'package:fifa/theme/background/background_age.dart';
import 'package:fifa/theme/background/background_overall.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

class AllInfoClub extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final Club club;
  const AllInfoClub({Key? key, required this.club}) : super(key: key);
  @override
  _AllInfoClubState createState() => _AllInfoClubState();
}

class _AllInfoClubState extends State<AllInfoClub> {

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
                            : selection==2 ? tableWidget2()
                            : tableWidget3(),
                      ),
                    ),
                  ),


                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap:(){
                          selection--;
                          if(selection<0)selection=3;
                          setState(() {});
                        },
                          child: Image.asset('assets/icons/button_left.png',height: buttonSize,width: buttonSize),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                          onTap:(){
                            selection++;
                            if(selection>=4)selection=0;
                            setState(() {});
                          },
                          child: Image.asset('assets/icons/button_right.png',height: buttonSize,width: buttonSize),
                      ),
                    ],
                  ),

                  const SizedBox(height: 80),


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
        1: FractionColumnWidth(.45),
        4: FractionColumnWidth(.18),
      },
      children: [

        const TableRow(
      children: [
        Text(''),
        Text('NOME', style: EstiloTextoBranco.text16),
        Text('IDA', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        Text('OVR', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        Text('\$', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        Text(''),
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
        1: FractionColumnWidth(.45),
        2: FractionColumnWidth(.1),
        3: FractionColumnWidth(.1),
        4: FractionColumnWidth(.1),
      },
      children: [

        const TableRow(
            children: [
              Text(''),
              Text('NOME', style: EstiloTextoBranco.text16),
              Text('J', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text('G', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text('A', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text(''),
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
        1: FractionColumnWidth(.45),
        2: FractionColumnWidth(.1),
        3: FractionColumnWidth(.1),
        4: FractionColumnWidth(.1),
      },
      children: [
        const       TableRow(
            children: [
              Text(''),
              Text('NOME', style: EstiloTextoBranco.text16),
              Text('+', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text('Ama', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text('Ver', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text(''),
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
        1: FractionColumnWidth(.45),
        2: FractionColumnWidth(.1),
        3: FractionColumnWidth(.1),
        4: FractionColumnWidth(.1),
      },
      children: [

        const TableRow(
            children: [
              Text(''),
              Text('NOME', style: EstiloTextoBranco.text16),
              Text('J*', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text('G*', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text('A*', textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              Text(''),
            ]),

        for(int i=0; i<widget.club.jogadores.length; i++)
          playersRow3(i,widget.club.jogadores[i])
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
    if(selection==2){
      return playersRow2(row,playerIndex);
    }

    return TableRow(
      decoration: BoxDecoration(
        color: background,
      ),
      children: [
        Text(player.position, style: EstiloTextoBranco.text16),
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
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const Text(''),
        ),
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
        Text(player.position, style: EstiloTextoBranco.text16),
        playerNameWidget(player),
        Text(player.matchsLeague.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        Text(player.goalsLeague.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        Text(player.assistsLeague.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.text14),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const Text(''),
        ),
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
        Text(player.position, style: EstiloTextoBranco.text16),
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
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const Text(''),
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
        Text(player.position, style: EstiloTextoBranco.text16),
        playerNameWidget(player),
        Text(player.matchsCarrer.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        Text(player.goalsCarrer.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        Text(player.assistsCarrer.toString(), textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const Text(''),
        ),
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
            funcSetState: (){setState(() {});}
            );
      },
      child: SizedBox(
          width: 170,
          child: Text(player.name, style: TextStyle(
            color: nameColor,
            fontFamily: 'Roboto',
            fontSize: 16,
          ))
      ),
    );
  }
}