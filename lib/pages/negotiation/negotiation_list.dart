import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/negotiation/negotiation_class.dart';
import 'package:fifa/pages/negotiation/negotiation_offer.dart';
import 'package:fifa/theme/background_color/background_overall.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class NegotiationListPage extends StatefulWidget {
  const NegotiationListPage({Key? key}) : super(key: key);

  @override
  State<NegotiationListPage> createState() => _NegotiationListPageState();
}

class _NegotiationListPageState extends State<NegotiationListPage> {


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
    List playersIDs = Negotiation().getPlayers();

    return Scaffold(
      body: Stack(
        children: [

          Images().getWallpaper(),

          Column(
            children: [
              backButtonText(context,'Negotiation'),
              Expanded(child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i=0; i < playersIDs.length; i++)
                      negotiationRow(Jogador(index: playersIDs[i]), i),
                  ],
                ),
              ))

            ],
          ),


        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

Widget negotiationRow(Jogador player, int startNegotiationWeek){
    String status = Negotiation().getStatus(player.index);

    Map mapStatus = {
      Negotiation().negotiating: Colors.lightBlue,
      Negotiation().done: Colors.green,
      Negotiation().cancelled: Colors.red,
    };

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          navigatorPush(context, NegotiationOfferPage(player: player));
        },
        child: Container(
          color: AppColors().greyTransparent,
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              Stack(
                children: [
                  Images().getPlayerPictureWidget(player),
                  Padding(
                    padding: const EdgeInsets.only(top:40,left:25),
                    child: positionContainer(player.position)
                  )
                ],
              ),
              const SizedBox(width: 8),
              ovrContainer(player.overall),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(player.name,overflow: TextOverflow.fade, style: EstiloTextoBranco.negrito16),
                    Text(player.price.toStringAsFixed(2)+'mi',style: EstiloTextoBranco.text14),
                    Text(player.salaryK.toStringAsFixed(2)+'k',style: EstiloTextoBranco.text14),
                  ],
                ),
              ),
              Column(
                children: [
                  const Icon(Icons.compare_arrows, color: Colors.white, size: 30),
                  Text("Week" + startNegotiationWeek.toString(),style: EstiloTextoBranco.text14),
                ],
              ),
              const SizedBox(width: 8),
              Images().getEscudoWidget(player.clubName),
              const SizedBox(width: 8),
              CircleAvatar(backgroundColor: mapStatus[status], radius: 10)
            ],
          ),
        ),
      ),
    );
}

}
