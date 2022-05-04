import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/theme/background/background_age.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/background/background_overall.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

import '../global_variables.dart';

class ActionTransfer{
  String action = '';
  String _sell = '';
  String _buy = '';

  ActionTransfer(BuildContext context){
    _sell = Translation(context).text.sell;
    _buy = Translation(context).text.buy;
  }
}

Future popUpOkShowPlayerInfos({required BuildContext context, required int playerID, required Function funcSetState}) async{

  Jogador jogador = Jogador(index: playerID);
  ActionTransfer actionTransfer = ActionTransfer(context);
  isBuyOrSell(jogador, actionTransfer);


  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return StatefulBuilder(
        builder: (BuildContext context, setState) {
          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 0),
            title: Row(
              children: [
                //Escudo da Equipe
                SizedBox(
                  height: 80,width: 80,
                  child: Stack(
                    children: [
                      globalHasInternet ? Image.network(jogador.imageUrl,height: 80,width: 80) : Image.asset(Images().getGenericPlayerPicture(),height: 80,width: 80),
                      Container(alignment: Alignment.bottomRight,child: funcFlagsList(jogador.nationality, 20,30)),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(child: Text(jogador.name,style: EstiloTextoPreto.text22)),
                //Escudo da Equipe
                Image.asset(Images().getEscudo(jogador.clubName),height: 60,width: 60),
              ],
            ),
            content:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    boxInfo(Translation(context).text.overall,jogador.overall.toString(), colorOverallBackground(jogador.overall)),
                    boxInfo(Translation(context).text.position,jogador.position),
                    boxInfo(Translation(context).text.age,jogador.age.toString(),colorAgeBackground(jogador.age)),
                  ],
                ),
                Row(
                  children: [
                    boxInfo(Translation(context).text.carrerMatchs,jogador.matchsCarrer.toString()),
                    boxInfo(Translation(context).text.carrerGoals,jogador.goalsCarrer.toString()),
                    boxInfo(Translation(context).text.carrerAssists,jogador.assistsCarrer.toString()),
                  ],
                ),
                Row(
                  children: [
                    boxInfo(Translation(context).text.leagueMatchs,jogador.matchsLeague.toString()),
                    boxInfo(Translation(context).text.leagueGoals,jogador.goalsLeague.toString()),
                    boxInfo(Translation(context).text.leagueAssists,jogador.assistsLeague.toString()),
                  ],
                ),
                Row(
                  children: [
                    boxInfo(Translation(context).text.injuryMatchs,jogador.injury.toString()),
                    boxInfo(Translation(context).text.yellowCards,jogador.yellowCard.toString()),
                    boxInfo(Translation(context).text.redCards,jogador.redCard.toString()),
                  ],
                ),


                Text('${Translation(context).text.money}: \$'+My().money.toStringAsFixed(2)),
                Text('${Translation(context).text.value}: \$'+jogador.price.toStringAsFixed(2),
                    style: (globalMyMoney>jogador.price) ? EstiloTextoVerde.text14 : EstiloTextoVermelho.text14),

              ],
            ),
            actions: <Widget>[
              TextButton(
                  child: Text(Translation(context).text.cancel,style: EstiloTextoPreto.text16,),
                  onPressed: (){
                    Navigator.of(context).pop();
                  }
              ),
              TextButton(
                  child: Text(actionTransfer.action,style: EstiloTextoPreto.text16,),
                  onPressed: (){
                    onTap(context, jogador,actionTransfer);
                    funcSetState(); //set state no menu
                    setState(() {});
                    jogador = Jogador(index: playerID);
                    isBuyOrSell(jogador,actionTransfer);
                    Navigator.of(context).pop();
                  }
              ),
            ],
          );
        }
      );
    },
  );
}
////////////////////////////////////////////////////////////////////////////
//                             WIDGET                                     //
////////////////////////////////////////////////////////////////////////////
Widget boxInfo(String title, String number,[Color? backgroundColor]){
  backgroundColor = backgroundColor ?? Colors.black26;

  return Container(
    height: title.length>15 ? 80 : 65,
    width: 100,
    color: backgroundColor,
    margin: const EdgeInsets.all(7),
    padding: const EdgeInsets.all(7),
    child: Column(
      children: [
        Text(title, textAlign:TextAlign.center, style: EstiloTextoPreto.text12),
        const SizedBox(height: 6),
        Text(number, style: EstiloTextoPreto.text20),
      ],
    ),
  );
}
////////////////////////////////////////////////////////////////////////////
//                          FUNCTIONS                                     //
////////////////////////////////////////////////////////////////////////////
playerPositionColor(String position){
  Color colorBackground = Colors.blue;
  if(position == 'GOL'){colorBackground = Colors.green;}
  else if(position == 'LE' || position == 'LD'){colorBackground = Colors.teal;}
  else if(position == 'ZAG'){colorBackground = Colors.blue;}
  else if(position == 'VOL' || position == 'MC'){colorBackground = Colors.orange;}
  else if(position == 'MEI' || position == 'ME' || position == 'MD'){colorBackground = Colors.purpleAccent;}
  else if(position == 'ATA' || position == 'PE' || position == 'PD'){colorBackground = Colors.red;}
  return colorBackground;
}
isBuyOrSell(Jogador jogador,ActionTransfer actionTransfer){
  if(jogador.clubID == My().clubID){
    actionTransfer.action = actionTransfer._sell;
  }else{
    actionTransfer.action = actionTransfer._buy;
  }
}
onTap(BuildContext context, Jogador jogador,ActionTransfer actionTransfer){
  if(actionTransfer.action == actionTransfer._sell){
    onTapSell(context, jogador);
  }else{
    onTapBuy(context, jogador);
  }
}
onTapSell(BuildContext context, Jogador jogador){
  //TODO arrumar o clube que compra o jogador
  if(globalMyJogadores.length>18) {
    int destinyClub = Random().nextInt(200);
    globalMyMoney += jogador.price;
    globalJogadoresClubIndex[jogador.index] = destinyClub;
    globalMyJogadores.remove(jogador.index);
    customToast('${Translation(context).text.playerSoldTo} '+Club(index: destinyClub).name);
  }else{
    customToast(Translation(context).text.notEnoughPlayersLeftToSell);
  }
}
onTapBuy(BuildContext context, Jogador jogador){
  if(globalMyJogadores.length<32) {
    if (globalMyMoney > jogador.price) {
      if(Club(index: jogador.clubID).nJogadores>15){
        globalMyMoney -= jogador.price;
        globalJogadoresClubIndex[jogador.index] = globalMyClubID;
        globalMyJogadores.add(jogador.index);
        customToast(Translation(context).text.playerBought);
      }else{
        customToast(Translation(context).text.cancelledPurchase+":\n"+Translation(context).text.otherTeamWillHaveNoPlayersLeft);
      }
    } else {
      customToast(Translation(context).text.cancelledPurchase+":\n"+Translation(context).text.moneyNotEnough);
    }
  }else{
    customToast('${Translation(context).text.cancelledPurchase}:\n${Translation(context).text.limitNPlayersReached}');
  }
}

