import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/background/background_overall.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

import '../global_variables.dart';

String _sell = 'Vender';
String _buy = 'Comprar';
String action = '';

Future popUpOkShowPlayerInfos({required BuildContext context, required int playerID, required Function funcSetState}) async{

  Jogador jogador = Jogador(index: playerID);
  isBuyOrSell(jogador);

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
                Expanded(child: Text(jogador.name,style: EstiloTextoPreto.text22)),
                //Escudo da Equipe
                Image.asset('assets/clubs/${FIFAImages().imageLogo(jogador.clubName)}.png',height: 40,width: 40),
              ],
            ),
            content:Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    boxInfo('Overall',jogador.overall.toString(), colorOverallBackground(jogador.overall)),
                    boxInfo('Posição',jogador.position),
                    boxInfo('Idade',jogador.age.toString(),ageColor(jogador.age)),
                  ],
                ),
                Row(
                  children: [
                    boxInfo('Jogos Total',jogador.matchsCarrer.toString()),
                    boxInfo('Gols Total',jogador.goalsCarrer.toString()),
                    boxInfo('Assis. Total',jogador.assistsCarrer.toString()),
                  ],
                ),
                Row(
                  children: [
                    boxInfo('Jogos Liga',jogador.matchsLeague.toString()),
                    boxInfo('Gols Liga',jogador.goalsLeague.toString()),
                    boxInfo('Assis. Liga',jogador.assistsLeague.toString()),
                  ],
                ),
                Row(
                  children: [
                    boxInfo('Lesão',jogador.injury.toString()),
                    boxInfo('Amarelos',jogador.yellowCard.toString()),
                    boxInfo('Vermelhos',jogador.redCard.toString()),
                  ],
                ),


                Text('Meu Saldo: \$'+My().money.toStringAsFixed(2)),
                Text('Valor: \$'+jogador.price.toStringAsFixed(2),
                    style: (globalMyMoney>jogador.price) ? EstiloTextoVerde.text14 : EstiloTextoVermelho.text14),

              ],
            ),
            actions: <Widget>[
              TextButton(
                  child: const Text("Cancelar",style: EstiloTextoPreto.text16,),
                  onPressed: (){
                    Navigator.of(context).pop();
                  }
              ),
              TextButton(
                  child: Text(action,style: EstiloTextoPreto.text16,),
                  onPressed: (){
                    onTap(jogador);
                    funcSetState(); //set state no menu
                    setState(() {});
                    jogador = Jogador(index: playerID);
                    isBuyOrSell(jogador);
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
    height: 55,
    width: 85,
    color: backgroundColor,
    margin: const EdgeInsets.all(8),
    padding: const EdgeInsets.all(8),
    child: Column(
      children: [
        Text(title, style: EstiloTextoPreto.text12),
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
ageColor(int age){
  Color colorBackground = Colors.green;
  if(age < 20){colorBackground = Colors.blue;}
  else if(age <= 25){colorBackground = Colors.blue.shade200;}
  else if(age <= 30){colorBackground = Colors.red.shade50;}
  else if(age <= 35){colorBackground = Colors.red.shade200;}
  else if(age <= 40){colorBackground = Colors.red.shade400;}
  else{colorBackground = Colors.red;}
  return colorBackground;
}
isBuyOrSell(Jogador jogador){
  if(jogador.clubID == My().clubID){
    action = _sell;
  }else{
    action = _buy;
  }
}
onTap(Jogador jogador){
  if(action == _sell){
    onTapSell(jogador);
  }else{
    onTapBuy(jogador);
  }
}
onTapSell(Jogador jogador){
  //TODO arrumar o clube que compra o jogador
  if(globalMyJogadores.length>18) {
    int destinyClub = Random().nextInt(200);
    globalMyMoney += jogador.price;
    globalJogadoresClubIndex[jogador.index] = destinyClub;
    globalMyJogadores.remove(jogador.index);
    customToast('Jogador vendido para '+Club(index: destinyClub).name);
  }else{
    customToast('Você não tem jogadores suficientes para poder vender');
  }
}
onTapBuy(Jogador jogador){
  if(globalMyJogadores.length<32) {
    if (globalMyMoney > jogador.price) {
      globalMyMoney -= jogador.price;
      globalJogadoresClubIndex[jogador.index] = My().clubID;
      globalMyJogadores.add(jogador.index);
      customToast('Jogador comprado');
    } else {
      customToast('Sem dinheiro disponível');
    }
  }else{
    customToast('Compra não realizada:\nLimite de jogadores atingido(32)');
  }
}

