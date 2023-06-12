import 'package:fifa/classes/dict_keys/player_stats_keys.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/international.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/functions/order_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/background_image/backimage_international_league.dart';
import 'package:fifa/widgets/player_templates/row_player_stats.dart';
import 'package:flutter/material.dart';

class TableInternationalScorers extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final String leagueInternational;
  const TableInternationalScorers({Key? key, required this.leagueInternational}) : super(key: key);
  @override
  _TableInternationalScorersState createState() => _TableInternationalScorersState();
}

class _TableInternationalScorersState extends State<TableInternationalScorers> {

  String typeSelected = FilterPlayersTitle().artilheiros;
  String leagueInternational = '';
  int rodadaShow = semanasGruposInternacionais.contains(semana)
      ? semanasGruposInternacionais.indexOf(semana)+1
      : semana > semanasGruposInternacionais.last
      ? 6 : 1;
  List<int> topScorersID = [];
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

    leagueInternational = widget.leagueInternational;

    return Scaffold(

      body:  Stack(
          children: [

            backgroundInternationalLeague(leagueInternational),

            Column(
                children: [

                  selectType(),
                  //TABELA
                  Expanded(
                    child: Container(
                        color: AppColors().greyTransparent,
                        height: Sized(context).height*0.9,
                        width: Sized(context).width*0.92,
                        child: Column(
                          children: [

                            Text(typeSelected,style: EstiloTextoBranco.negrito18),

                            Expanded(
                                child: SingleChildScrollView(
                                    child: tableWidget()
                                )
                            ),
                          ],
                        )
                    ),
                  ),


                ]),

          ]),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget selectType(){
    return Container(
      height: 30,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (String type in FilterPlayersTitle().getList())
              buttonSelection(type)
          ],
        ),
      ),
    );
  }
  Widget buttonSelection(String title){
    return GestureDetector(
      onTap: (){
        typeSelected = title;
        setState((){});
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: AppColors().greyTransparent,
          border: Border.all(
            color: typeSelected == title ? Colors.white : AppColors().greyTransparent,
            width: 1.0,
          ),
        ),
        child: Text(title, style: EstiloTextoBranco.text16),
      ),
    );
  }
  String playerStats(String title, Jogador player){
    String value = "";
    if(title == FilterPlayersTitle().bestPlayer){ value =  player.gradeInt.toStringAsFixed(1);}
    if(title == FilterPlayersTitle().artilheiros){ value =  player.goalsInternational.toString();}
    if(title == FilterPlayersTitle().assists){ value =  player.assistsInternational.toString();}
    if(title == FilterPlayersTitle().cleanSheets){ value =  player.cleanSheetsInternational.toString();}
    return value;
  }

  Widget tableWidget() {
    List listPlayers = filterPlayers(typeSelected);

    return Column(
      children: [
        for(int i=0; i < 100 && i < listPlayers.length; i++)
          rowPlayer(context, Jogador(index: listPlayers[i]), i+1, playerStats(typeSelected, Jogador(index: listPlayers[i]))),
      ],
    );
  }


////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////
  // listOfTopScorers(){
  //   topScorersID = [];
  //   List<int> topScorersGoals = [];
  //   for(int index=0; index<globalJogadoresIndex.length; index++){
  //     if (globalJogadoresInternationalGoals[index]>0) {
  //       int clubID = Jogador(index: index).clubID;
  //       if(Club(index: clubID).internationalLeagueName == leagueInternational){
  //         topScorersID.add(index);
//         topScorersGoals.add(globalJogadoresInternationalGoals[index]);
//       }
//     }
  //   }
    //ARTILHEIROS/lista EM ORDEM
//   topScorersID = Order().listDecrescente(listA: topScorersGoals, listB: topScorersID, length: topScorersID.length)[1];
  //  }

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

    List allClubsPlayingID = International(widget.leagueInternational).clubIDs;

    List copyVariableList = [];
    List players = [];

    for(int index=0; index < globalJogadoresName.length; index++){
      int clubID = globalJogadoresClubIndex[index];
      if(allClubsPlayingID.contains(clubID)) {
        if(title == FilterPlayersTitle().bestPlayer){
          double points = (globalInternationalPlayers[PlayerStatsKeys().keyPlayerGoals]![index]*2
              + globalInternationalPlayers[PlayerStatsKeys().keyPlayerAssists]![index]
              + globalInternationalPlayers[PlayerStatsKeys().keyPlayerCleanSheets]![index]*1.5
          ).toDouble();
          points = points / (globalInternationalPlayers[PlayerStatsKeys().keyPlayerMatchs]![index]+1);
          copyVariableList.add(points);
          players.add(index);
        }else if(title == FilterPlayersTitle().cleanSheets){
          if(globalJogadoresPosition[index] == "GOL"){
            copyVariableList.add(globalInternationalPlayers[categoryKey]![index]);
            players.add(index);
          }
        }else{
          copyVariableList.add(globalInternationalPlayers[categoryKey]![index]);
          players.add(index);
        }
      }
    }

    //lista EM ORDEM
    players = Order().listDecrescente(listA: copyVariableList, listB: players, length: players.length)[1];
    return players;
  }

}