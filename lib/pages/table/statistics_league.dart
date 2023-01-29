import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/functions/order_list.dart';
import 'package:fifa/classes/player_basic.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

class StatisticsLeague extends StatefulWidget {
  final League league;
  const StatisticsLeague({Key? key,required this.league}) : super(key: key);

  @override
  State<StatisticsLeague> createState() => _StatisticsLeagueState();
}

class _StatisticsLeagueState extends State<StatisticsLeague> {

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          Images().getWallpaper(),

          Expanded(
              child: Column(
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    box('Gols',0),
                    box('Assistências',0),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    box('Cartões Amarelos',1),
                    box('Cartões Vermelhos',2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    box('Nota média',0),
                    box('Clean Sheets',0),
                  ],
                ),
                ],
              ),
          ),

        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget box(String title, int goalOrYellowOrRed){
    List leaguePlayers = organizarVariavelLeague(widget.league,  goalOrYellowOrRed);
    return Container(
      height: 180,
      width: (Sized(context).width/2)-20,
      color: AppColors().greyTransparent,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          Text(title,style: EstiloTextoBranco.negrito18),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(int i=0;i<20 && i<leaguePlayers.length;i++)
                    playerRow(i+1,leaguePlayers[i],i)
                ],
              ),
            ),
          ),
        ],
      ),
    );
}
Widget playerRow(int position, int playerID,int number){
  PlayerBasicInfo player = PlayerBasicInfo();
  player.get(playerID);
    return Row(
      children: [
        SizedBox(width:20,child: Text(position.toString()+'º',style: EstiloTextoBranco.text12)),
        Images().getEscudoWidget(player.clubName,25,25),
        Text(player.name,style: EstiloTextoBranco.text14),
        const Spacer(),
        Text(player.overall.toString(),style: EstiloTextoBranco.negrito14),
      ],
    );
}
}

List organizarVariavelLeague(League league, int goalOrYellowOrRed) {
  //Oraganiza em ordem lista de artilheiros, cartoes amarelos ou cartoes amarelos
  //Mostra no Widget de League Results

  List global = [];
  if(goalOrYellowOrRed==0){global = globalJogadoresLeagueGoals;}
  if(goalOrYellowOrRed==1){global = globalJogadoresYellowCard;}
  if(goalOrYellowOrRed==2){global = globalJogadoresRedCard;}

  List copyVariableList = [];
  List leaguePlayers = [];

  List clubsInLeague = league.getClassification();
  for(int index=0; index<globalJogadoresClubIndex.length; index++){
    if(clubsInLeague.contains(globalJogadoresClubIndex[index])){
      try {// Na 1ªrodada pode dar pau, pq a lista nao foi criada
        if (global[index] >= 0) {
          copyVariableList.add(global[index]);
          leaguePlayers.add(index);
        }
      }catch(e){
        print('Error GlobalFunctions().organizarVariavelLeague: '+e.toString());
      }
    }
  }
  //ARTILHEIROS/lista EM ORDEM
  leaguePlayers = Order().listDecrescente(listA: copyVariableList, listB: leaguePlayers, length: leaguePlayers.length)[1];

  return leaguePlayers;
}