import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/pages/negotiation/negotiation_class.dart';
import 'package:fifa/pages/negotiation/negotiation_offer.dart';
import 'package:fifa/theme/background_color/background_overall.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/button/back_button.dart';
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
    int playerID = player.index;

    Map mapStatus = {
      Negotiation().negotiating: Colors.lightBlue,
      Negotiation().accepted: Colors.green,
      Negotiation().rejected: Colors.orange,
      Negotiation().cancelled: Colors.red,
    };

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          if(Negotiation().isNegotiating(playerID)){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NegotiationOfferPage(player: player))
            ).then((_) => setState(() {}));
          }else{
            showModalBottomSheet(
                  barrierColor: AppColors().greyTransparent,
                  context: context, builder: (c){
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Jogador já negociado",style: EstiloTextoPreto.text16),
                );
                  });
            }
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
                    Text("Valor: \$"+Negotiation().getPrice(playerID).toStringAsFixed(3)+'mi',style: EstiloTextoBranco.text10),
                    Text("Salário: \$"+Negotiation().getSalary(playerID).toStringAsFixed(3)+'k',style: EstiloTextoBranco.text10),
                  ],
                ),
              ),
              Column(
                children: [
                  const Icon(Icons.compare_arrows, color: Colors.white, size: 30),
                  Text("Week" + Negotiation().getWeek(playerID).toString(),style: EstiloTextoBranco.text14),
                ],
              ),
              const SizedBox(width: 8),
              Images().getEscudoWidget(Negotiation().getClubName(playerID)),
              const SizedBox(width: 8),
              CircleAvatar(backgroundColor: mapStatus[status], radius: 10)
            ],
          ),
        ),
      ),
    );
}

}
