import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/theme/background/background_age.dart';
import 'package:fifa/theme/background/background_position.dart';
import 'package:fifa/theme/background/moral_icon.dart';
import 'package:fifa/theme/decoration/black_decoration.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/background/background_overall.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
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

      // retorna um objeto do tipo Dialog
      return showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(4),
              decoration: Images().getWallpaperContainerDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  Row(
                    children: [
                      //Escudo da Equipe
                      SizedBox(
                        height: 80,width: 80,
                        child: Stack(
                          children: [
                            globalHasInternet ? Image.network(jogador.imageUrl,height: 80,width: 80) : Image.asset(Images().getGenericPlayerPicture(),height: 80,width: 80),
                            Container(alignment: Alignment.bottomRight,child: funcFlagsList(jogador.nationality, 20,30)),
                            Text(jogador.nationality,style: EstiloTextoBranco.text12),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                       child: Column(
                        children: [
                          Text(jogador.name,style: EstiloTextoBranco.negrito22),
                          mainStatus(context,jogador),
                        ],
                      )),
                      //Escudo da Equipe
                      Image.asset(Images().getEscudo(jogador.clubName),height: 60,width: 60),
                    ],
                  ),

                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      positionContainer(jogador.position,size: 60,style: EstiloTextoPreto.text16),
                      health(context, jogador),
                      lesoesCartoes(context, jogador),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 100,child: carrerStats(context,jogador)),
                      SizedBox(height: 100,child: thisSeasonStats(context,jogador)),
                    ],
                  ),

                  value(context,jogador),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          child: Text(Translation(context).text.cancel,style: EstiloTextoBranco.text16,),
                          onPressed: (){
                            Navigator.of(context).pop();
                          }
                      ),
                      TextButton(
                          child: Text(actionTransfer.action,style: EstiloTextoBranco.text16,),
                          onPressed: (){
                            onTap(context, jogador,actionTransfer);
                            funcSetState(); //set state no menu
                            //setState(() {});
                            jogador = Jogador(index: playerID);
                            isBuyOrSell(jogador,actionTransfer);
                            Navigator.of(context).pop();
                          }
                      ),
                    ],
                  )

                ],
              ),
            );
        });
}
////////////////////////////////////////////////////////////////////////////
//                             WIDGET                                     //
////////////////////////////////////////////////////////////////////////////

mainStatus(BuildContext context, Jogador jogador){
  double sizeIcon = 25;
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Container(
            margin: const EdgeInsets.only(right: 4),
              height:sizeIcon,width: sizeIcon,
              color: colorOverallBackground(jogador.overall),
              child: Center(child: Text(jogador.overall.toString(), textAlign:TextAlign.center, style: EstiloTextoPreto.text12)),
          ),
          const SizedBox(width:50,child: Text('Overall',style: EstiloTextoBranco.text14)),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Container(
            margin: const EdgeInsets.only(right: 4),
            height:sizeIcon,width: sizeIcon,
            color: colorAgeBackground(jogador.age),
            child: Center(child: Text(jogador.age.toString(), textAlign:TextAlign.center, style: EstiloTextoPreto.text12)),
          ),
          const SizedBox(width:50,child: Text('Idade',style: EstiloTextoBranco.text14)),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          moralContainer(jogador,size: sizeIcon),
          Container(
              width:50,
              margin: const EdgeInsets.only(left: 4),
              child: const Text('Moral',style: EstiloTextoBranco.text14)),
        ],
      ),
    ],
  );
}

Widget health(BuildContext context, Jogador jogador){
  return    Column(
    children: [
      const Text('Saúde', style: EstiloTextoBranco.text20),
      //Barra de saúde
      SizedBox(
        width: Sized(context).width*0.3,
        child: LinearProgressIndicator(
          value: jogador.health,
          color: Colors.teal,
          backgroundColor: Colors.grey,
        ),
      ),
    ],
  );
}
Widget carrerStats(BuildContext context, Jogador jogador){
  return Container(
    width: Sized(context).width*0.35,
    padding: const EdgeInsets.all(4),
    decoration: blackDecoration(),
    child: Column(
      children: [

        const Text('Carreira', style: EstiloTextoBranco.text20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Column(
              children: [
                const Text('Jogos', style: EstiloTextoBranco.text12),
                Text(jogador.matchsCarrer.toString(), style: EstiloTextoBranco.text16),
              ],
            ),
            Column(
              children: [
                Image.asset('assets/icons/bola.png',height: 15,width: 15),
                Text(jogador.goalsCarrer.toString(), style: EstiloTextoBranco.text16),
              ],
            ),
            Column(
              children: [
                Image.asset('assets/icons/assists.png',height: 15,width: 15),
                Text(jogador.assistsCarrer.toString(), style: EstiloTextoBranco.text16),
              ],
            ),
          ],
        ),

      ],
    ),
  );
}

Widget thisSeasonStats(BuildContext context, Jogador jogador){
  return Container(
    width: Sized(context).width*0.5,
    padding: const EdgeInsets.all(4),
    decoration: blackDecoration(),
    child: Column(
      children: [

        const Text('Essa temporada', style: EstiloTextoBranco.text20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text('', style: EstiloTextoBranco.text12),
                Image.asset(FIFAImages().campeonatoLogo(Club(index: jogador.clubID).leagueName),height: 25,width: 25),
                Image.asset(FIFAImages().campeonatoInternacionalLogo(Club(index: jogador.clubID).internationalLeagueName),height: 25,width: 25),
              ],
            ),
            Column(
              children: [
                const Text('Jogos', style: EstiloTextoBranco.text12),
                Text(jogador.matchsLeague.toString(), style: EstiloTextoBranco.text16),
                Text(jogador.matchsInternational.toString(), style: EstiloTextoBranco.text16),
              ],
            ),
            Column(
              children: [
                Image.asset('assets/icons/bola.png',height: 15,width: 15),
                Text(jogador.goalsLeague.toString(), style: EstiloTextoBranco.text16),
                Text(jogador.goalsInternational.toString(), style: EstiloTextoBranco.text16),
              ],
            ),
            Column(
              children: [
                Image.asset('assets/icons/assists.png',height: 15,width: 15),
                Text(jogador.assistsLeague.toString(), style: EstiloTextoBranco.text16),
                Text(jogador.assistsInternational.toString(), style: EstiloTextoBranco.text16),
              ],
            ),
          ],
        ),

      ],
    ),
  );
}
Widget lesoesCartoes(BuildContext context, Jogador jogador){
  return SizedBox(
    width: Sized(context).width*0.3,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
          Column(
            children: [
              Container(
                height: 15,width: 15,color: Colors.white,
                child: const Center(child: Text('+',style: TextStyle(fontSize: 15,color: Colors.red),)),
              ),
              Text(jogador.injury.toString(), style: EstiloTextoBranco.text20),
            ],
          ),
        Column(
          children: [
            Container(height: 15,width: 10,color: Colors.yellow),
            Text(jogador.yellowCard.toString(), style: EstiloTextoBranco.text20),
          ],
        ),
        Column(
          children: [
            Container(height: 15,width: 10,color: Colors.red),
            Text(jogador.redCard.toString(), style: EstiloTextoBranco.text20),
          ],
        ),
      ],
    ),
  );
}
Widget value(BuildContext context,Jogador jogador){
  return Container(
    decoration: blackDecoration(),
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.all(8),
    child: Column(
      children: [
        Text('${Translation(context).text.money}: \$'+My().money.toStringAsFixed(2),style: EstiloTextoBranco.text14),
        Text('${Translation(context).text.value}: \$'+jogador.price.toStringAsFixed(2),
            style: (globalMyMoney>jogador.price) ? EstiloTextoVerde.text14 : EstiloTextoVermelho.text14),
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

