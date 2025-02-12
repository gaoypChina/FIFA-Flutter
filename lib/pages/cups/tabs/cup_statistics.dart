import 'package:fifa/classes/dict_keys/player_stats_keys.dart';
import 'package:fifa/classes/mata_mata/cup_classification.dart';
import 'package:fifa/classes/functions/order_list.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/widgets/button/button_list_row.dart';
import 'package:fifa/widgets/player_templates/row_player_stats.dart';
import 'package:flutter/material.dart';

class CupStatistics extends StatefulWidget {
  final String cupName;
  const CupStatistics({Key? key, required this.cupName}) : super(key: key);

  @override
  State<CupStatistics> createState() => _CupStatisticsState();
}

class _CupStatisticsState extends State<CupStatistics> {

  String typeSelected = FilterPlayersTitle().artilheiros;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [


          statisticsBox(context, typeSelected),

          const SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (String type in FilterPlayersTitle().getList())
                  buttonListRow(
                    type,
                    typeSelected,
                    (String title){
                      typeSelected = title;
                      setState((){});
                    },
                  ),
              ],
            ),
          ),
          const SizedBox(height: 4),
        ],
    );
  }

  List filterPlayers(String title){
    String categoryKey = "";
    if(title == FilterPlayersTitle().artilheiros){
      categoryKey = PlayerStatsKeys().keyPlayerGoals;
    }else if(title == FilterPlayersTitle().assists){
      categoryKey = PlayerStatsKeys().keyPlayerAssists;
    }else if(title == FilterPlayersTitle().cleanSheets){
      categoryKey = PlayerStatsKeys().keyPlayerCleanSheets;
    }else{
      categoryKey = title;
    }

    List allClubsCup = [];
    allClubsCup += globalCup[widget.cupName]![CupClassification().keyClassificados];
    allClubsCup += globalCup[widget.cupName]![CupClassification().keyPrePhase];

    List copyVariableList = [];
    List players = [];

    for(int index=0; index < globalJogadoresName.length; index++){
      String playerClubName = clubsAllNameList[globalJogadoresClubIndex[index]];
      if(allClubsCup.contains(playerClubName)) {
        if(title == FilterPlayersTitle().bestPlayer){
          double points = Jogador(index: index).gradeCup;
          copyVariableList.add(points);
          players.add(index);
        }else if(title == FilterPlayersTitle().cleanSheets){
          if(globalJogadoresPosition[index] == "GOL"){
            copyVariableList.add(globalCupPlayers[categoryKey]![index]);
            players.add(index);
          }
        }else{
          copyVariableList.add(globalCupPlayers[categoryKey]![index]);
          players.add(index);
        }
      }
    }

    //lista EM ORDEM
    players = Order().listDecrescente(listA: copyVariableList, listB: players, length: players.length)[1];
    return players;
  }

  String playerStats(String title, Jogador player){
    String value = "";
    if(title == FilterPlayersTitle().bestPlayer){ value =  player.gradeCup.toStringAsFixed(1);}
    if(title == FilterPlayersTitle().artilheiros){ value =  player.goalsCup.toString();}
    if(title == FilterPlayersTitle().assists){ value =  player.assistsCup.toString();}
    if(title == FilterPlayersTitle().cleanSheets){ value =  player.cleanSheetsCup.toString();}
    return value;
  }
  Widget statisticsBox(BuildContext context, String title){

    List listPlayers = filterPlayers(title);

    return Flexible(
      child: Container(
        color: AppColors().greyTransparent,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.all(4),
        child: Column(
          children: [
            Text(title,style: EstiloTextoBranco.negrito18),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for(int i=0;i < 50 && i < listPlayers.length;i++)
                      rowPlayer(context, Jogador(index: listPlayers[i]), i+1, playerStats(title, Jogador(index: listPlayers[i]))),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}


