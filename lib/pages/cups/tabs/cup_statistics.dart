import 'package:fifa/classes/cup_classification.dart';
import 'package:fifa/classes/functions/order_list.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/widgets/popup/popup_player_info.dart';
import 'package:flutter/material.dart';

class filterPlayersTitle{
  String artilheiros = "Artilheiros";
  String assists = "Assistências";
  String bestPlayer = "Melhor Jogador";
  String cleanSheets = "Clean Sheets";
}


class CupStatistics extends StatefulWidget {
  final String cupName;
  const CupStatistics({Key? key, required this.cupName}) : super(key: key);

  @override
  State<CupStatistics> createState() => _CupStatisticsState();
}

class _CupStatisticsState extends State<CupStatistics> {

  String typeSelected = filterPlayersTitle().artilheiros;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [

          const SizedBox(height: 6),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                buttonSelection(filterPlayersTitle().artilheiros),
                buttonSelection(filterPlayersTitle().assists),
                buttonSelection(filterPlayersTitle().bestPlayer),
                buttonSelection(filterPlayersTitle().cleanSheets),
              ],
            ),
          ),
          const SizedBox(height: 6),

          statisticsBox(typeSelected),
        ],
    );
  }

  List filterPlayers(String title){
    String categoryKey = "";
    if(title == filterPlayersTitle().artilheiros){
      categoryKey = CupClassification().keyPlayerGoals;
    }else if(title == filterPlayersTitle().assists){
      categoryKey = CupClassification().keyPlayerAssists;
    }else if(title == filterPlayersTitle().cleanSheets){
      categoryKey = CupClassification().keyPlayerCleanSheets;
    }else{
      categoryKey = title;
    }

    List allClubsCup = [];
    allClubsCup += globalCup[widget.cupName]![CupClassification().keyClassificados];
    allClubsCup += globalCup[widget.cupName]![CupClassification().keyPrePhase];

    List copyVariableList = [];
    List cupPlayers = [];

    for(int index=0; index<globalJogadoresClubIndex.length; index++){
      String playerClubName = clubsAllNameList[globalJogadoresClubIndex[index]];
      if(allClubsCup.contains(playerClubName)) {
        if(title == filterPlayersTitle().bestPlayer){
          double points = (globalCupPlayers[CupClassification().keyPlayerGoals]![index]*3 + globalCupPlayers[CupClassification().keyPlayerAssists]![index]).toDouble();
          points = points/ (globalCupPlayers[CupClassification().keyPlayerMatchs]![index]+1);
          copyVariableList.add(points);
          cupPlayers.add(index);
        }else if(title == filterPlayersTitle().cleanSheets){
          if(globalJogadoresPosition[index] == "GOL"){
            copyVariableList.add(globalCupPlayers[categoryKey]![index]);
            cupPlayers.add(index);
          }
        }else{
          copyVariableList.add(globalCupPlayers[categoryKey]![index]);
          cupPlayers.add(index);
        }
      }
    }

    //lista EM ORDEM
    cupPlayers = Order().listDecrescente(listA: copyVariableList, listB: cupPlayers, length: cupPlayers.length)[1];
    return cupPlayers;
  }

  Widget statisticsBox(String title){

    List cupPlayers = filterPlayers(title);

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
                    for(int i=0;i<100 && i<cupPlayers.length;i++)
                      rowPlayer(Jogador(index: cupPlayers[i]), i+1, title),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget rowPlayer(Jogador player, int result, String title){
    return GestureDetector(
      onTap: (){
        popUpOkShowPlayerInfos(context: context, playerID: player.index, funcSetState: (){});
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            SizedBox(width: 35,child: Text(result.toString()+"- ",style: EstiloTextoBranco.text14)),
            Images().getEscudoWidget(player.clubName,25,25),
            //Images().getPlayerPictureWidget(player, 35, 35),
            title == filterPlayersTitle().artilheiros ? SizedBox(width: 30,child: Text(player.goalsCup.toString(),textAlign: TextAlign.center,style: EstiloTextoBranco.negrito16)) : Container(),
            title == filterPlayersTitle().assists ? SizedBox(width: 30,child: Text(player.assistsCup.toString(),textAlign: TextAlign.center,style: EstiloTextoBranco.negrito16)) : Container(),
            title == filterPlayersTitle().cleanSheets ? SizedBox(width: 30,child: Text(player.cleanSheetsCup.toString(),textAlign: TextAlign.center,style: EstiloTextoBranco.negrito16)) : Container(),
            title == filterPlayersTitle().bestPlayer ? SizedBox(width: 40,child: Text(player.gradeCup.toStringAsFixed(1),textAlign: TextAlign.center,style: EstiloTextoBranco.negrito16)) : Container(),

            positionContainer(player.position,size: 30,style: EstiloTextoPreto.text12),
            SizedBox(width:180,child: Text(player.name,style: EstiloTextoBranco.text16)),
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
}


