import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/functions/order_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/historic_champions/internationals.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class StatisticsLeague extends StatefulWidget {
  final League league;
  const StatisticsLeague({Key? key,required this.league}) : super(key: key);

  @override
  State<StatisticsLeague> createState() => _StatisticsLeagueState();
}

class _StatisticsLeagueState extends State<StatisticsLeague> {

  Map<double,dynamic> results = mapInternationals[LeagueOfficialNames().mundial];

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

          Column(
            children: [
              backButtonText(context,'Statistics League'),
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

              Column(
                children: const [
                  Text('Premiação',style: EstiloTextoBranco.negrito18),
                  Text('Campeão: \$27.7',style: EstiloTextoBranco.text16),
                  Text('Vitória: \$3.0',style: EstiloTextoBranco.text16),
                  Text('Empate: \$1.0',style: EstiloTextoBranco.text16),
                  Text('Derrota: \$0.75',style: EstiloTextoBranco.text16),
                ],
              )

            ],
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
      height: 200,
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
                  for(int i=0;i<70 && i<leaguePlayers.length;i++)
                    playerRow(i+1,Jogador(index: leaguePlayers[i]),i)
                ],
              ),
            ),
          ),
        ],
      ),
    );
}
Widget playerRow(int position, Jogador player,int number){
    return Row(
      children: [
        SizedBox(width:20,child: Text(position.toString()+'º',style: EstiloTextoBranco.text12)),
        Images().getEscudoWidget(player.clubName,25,25),
        Text(player.name,style: EstiloTextoBranco.text14),
        const Spacer(),
        Text(player.goalsLeague.toString(),style: EstiloTextoBranco.negrito14),
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