import 'dart:math';

import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/historic/historic_my_tranfers.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/negotiation/negotiation_class.dart';
import 'package:fifa/theme/background_color/background_age.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/background_color/color_grade.dart';
import 'package:fifa/theme/background_color/background_moral.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/decoration/black_decoration.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/background_color/background_overall.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';


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
                  
                  Container(
                    margin: const EdgeInsets.all(4),
                    decoration: blackDecoration(),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 110,width: 100,
                          child: Stack(
                            children: [
                              Images().getPlayerPictureWidget(jogador,95,90),
                              Container(alignment: Alignment.bottomRight,child: funcFlagsList(jogador.nationality, 20,30)),
                              Text(jogador.nationality,style: EstiloTextoBranco.text12),
                              Container(alignment: Alignment.bottomLeft,child: positionContainer(jogador.position,size: 60,style: EstiloTextoPreto.text16)),
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
                        Images().getEscudoWidget(jogador.clubName,70,70),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),

                  const SizedBox(height: 6),
                  Container(
                    margin: const EdgeInsets.all(4),
                    padding: const EdgeInsets.all(4),
                    decoration: blackDecoration(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        health(context, jogador),
                        lesoesCartoes(context, jogador),
                        nota(jogador),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 120,
                    margin: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        carrerStats(context,jogador),
                        thisSeasonStats(context,jogador),
                      ],
                    ),
                  ),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors().greyTransparent,
                          ),
                          child: Text(Translation(context).text.cancel,style: EstiloTextoBranco.text16,),
                          onPressed: (){
                            Navigator.of(context).pop();
                          }
                      ),

                      value(context,jogador),

                      TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: AppColors().greyTransparent,
                          ),
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
          const SizedBox(width:50,child: Text('Overall',style: EstiloTextoBranco.text14)),
          const SizedBox(width: 4),
          Container(
            margin: const EdgeInsets.only(right: 4),
              height:sizeIcon,width: sizeIcon,
              color: colorOverallBackground(jogador.overall),
              child: Center(child: Text(jogador.overall.toString(), textAlign:TextAlign.center, style: EstiloTextoPreto.text14)),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          const SizedBox(width:50,child: Text('Idade',style: EstiloTextoBranco.text14)),
          const SizedBox(width: 4),
          Container(
            margin: const EdgeInsets.only(right: 4),
            height:sizeIcon,width: sizeIcon,
            color: colorAgeBackground(jogador.age),
            child: Center(child: Text(jogador.age.toString(), textAlign:TextAlign.center, style: EstiloTextoPreto.text14)),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          const SizedBox(
              width:50,
              child: Text('Moral',style: EstiloTextoBranco.text14)),
          moralContainer(jogador.moral,size: sizeIcon),
        ],
      ),
    ],
  );
}

Widget health(BuildContext context, Jogador jogador){
  return    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text('Saúde', style: EstiloTextoBranco.negrito18),
      //Barra de saúde
      SizedBox(
        width: Sized(context).width*0.4,
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

        const Text('Carreira', style: EstiloTextoBranco.negrito18),
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
    width: Sized(context).width*0.6,
    padding: const EdgeInsets.all(4),
    decoration: blackDecoration(),
    child: Column(
      children: [

        const Text('Essa temporada', style: EstiloTextoBranco.negrito18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text('', style: EstiloTextoBranco.text12),
                Image.asset(FIFAImages().campeonatoLogo(Club(index: jogador.clubID).leagueName),height: 25,width: 25),
                Image.asset(FIFAImages().campeonatoLogo(getCup(Club(index: jogador.clubID).leagueName)),height: 25,width: 25),
                Image.asset(FIFAImages().campeonatoLogo(Club(index: jogador.clubID).internationalLeagueName),height: 25,width: 25),
              ],
            ),
            Column(
              children: [
                const Text('Jogos', style: EstiloTextoBranco.text12),
                Text(jogador.matchsLeague.toString(), style: EstiloTextoBranco.text16),
                Text(jogador.matchsCup.toString(), style: EstiloTextoBranco.text16),
                Text(jogador.matchsInternational.toString(), style: EstiloTextoBranco.text16),
              ],
            ),
            Column(
              children: [
                Image.asset('assets/icons/bola.png',height: 15,width: 15),
                Text(jogador.goalsLeague.toString(), style: EstiloTextoBranco.text16),
                Text(jogador.goalsCup.toString(), style: EstiloTextoBranco.text16),
                Text(jogador.goalsInternational.toString(), style: EstiloTextoBranco.text16),
              ],
            ),
            Column(
              children: [
                Image.asset('assets/icons/assists.png',height: 15,width: 15),
                Text(jogador.assistsLeague.toString(), style: EstiloTextoBranco.text16),
                Text(jogador.assistsCup.toString(), style: EstiloTextoBranco.text16),
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
    margin: const EdgeInsets.all(4),
    child: Container(
      decoration: blackDecoration(),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text('${Translation(context).text.money}: \$'+My().money.toStringAsFixed(2),style: EstiloTextoBranco.text16),
          Text('${Translation(context).text.value}: \$'+jogador.price.toStringAsFixed(2),
              style: (globalMyMoney>jogador.price) ? EstiloTextoVerde.negrito16 : EstiloTextoVinho.negrito16),
        ],
      ),
    ),
  );
}

Widget nota(Jogador jogador){
  return                       Column(
    children: [
      const Text('Nota',style: EstiloTextoBranco.negrito22),
      Container(
          color: colorGradeBackground(jogador.grade),
          padding: const EdgeInsets.all(2),
          child: Text(jogador.grade.toStringAsFixed(1),style: EstiloTextoPreto.negrito20)),
    ],
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
isBuyOrSell(Jogador jogador, ActionTransfer actionTransfer){
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

  Negotiation().saveSellPlayer(jogador);

  //TODO tornar o clube que compra o jogador mais coerente
  if(globalMyJogadores.length>18) {
    int destinyClub = Random().nextInt(200);
    globalMyMoney += jogador.price;
    globalJogadoresClubIndex[jogador.index] = destinyClub;
    globalMyJogadores.remove(jogador.index);
    saveSellBuyPlayerToHistoric(player: jogador,isSell: true,clubID: destinyClub);
    customToast('${Translation(context).text.playerSoldTo} '+Club(index: destinyClub).name);
  }else{
    customToast(Translation(context).text.notEnoughPlayersLeftToSell);
  }
}
onTapBuy(BuildContext context, Jogador jogador){

  Negotiation().saveBuyPlayer(jogador);

  if(globalMyJogadores.length<34) {
    if (globalMyMoney > jogador.price) {
      if(Club(index: jogador.clubID).nJogadores>15){
        globalMyMoney -= jogador.price;
        globalJogadoresClubIndex[jogador.index] = globalMyClubID;
        globalMyJogadores.add(jogador.index);
        saveSellBuyPlayerToHistoric(player: jogador,isSell: false, clubID: jogador.clubID);
        customToast(Translation(context).text.playerBought);
      }else{
        customToast(Translation(context).text.cancelledPurchase+":\n"+Translation(context).text.otherTeamWillHaveNoPlayersLeft+" (34)");
      }
    } else {
      customToast(Translation(context).text.cancelledPurchase+":\n"+Translation(context).text.moneyNotEnough);
    }
  }else{
    customToast('${Translation(context).text.cancelledPurchase}:\n${Translation(context).text.limitNPlayersReached}');
  }
}


saveSellBuyPlayerToHistoric({required Jogador player,required bool isSell, required int clubID}){
  String sellORbuyStr = HistoricMyTransfers().sellKeyword;
  if(isSell == false){
    sellORbuyStr = HistoricMyTransfers().buyKeyword;
  }
  HistoricMyTransfers().checkMapHistoricTranfersNew(sellORbuyStr, player, clubID);
}