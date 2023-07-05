import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/pages/negotiation/negotiation_class.dart';
import 'package:fifa/pages/negotiation/negotiation_offer.dart';
import 'package:fifa/theme/background_color/background_position.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
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
              backButtonText(context,'Negotiation', true),
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i=0; i < playersIDs.length; i++)
                          negotiationRow(Jogador(index: playersIDs[i]), i),
                      ],
                    ),
                  )
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

Widget negotiationRow(Jogador player, int startNegotiationWeek){
    String status = Negotiation().getStatus(player.index);
    int playerID = player.index;

    String type = Negotiation().getType(playerID);

    Map mapType = {
      Negotiation().typeBuy: Colors.lightBlue,
      Negotiation().typeSell: Colors.red,
      Negotiation().typeRent: Colors.orange,
    };

    Map mapStatus = {
      Negotiation().negotiating: Colors.lightBlue,
      Negotiation().accepted: Colors.green,
      Negotiation().rejected: Colors.orange,
      Negotiation().cancelled: Colors.red,
    };

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors().greyTransparent,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: PressableButton(
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
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              Stack(
                children: [
                  //IMAGE
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ClubDetails().getColors(player.clubName).secondColor, width: 2.0),
                      color: ClubDetails().getColors(player.clubName).primaryColor,
                    ),
                    child: ClipOval(
                        child: Images().getPlayerPictureWidget(player,60,60)
                    ),
                  ),
                  //OVR
                  Text(player.overall.toString(), style: EstiloTextoBranco.negrito22),
                  //POSITION
                  Padding(
                    padding: const EdgeInsets.only(top:50,left:35),
                    child: positionContainer(player.position)
                  )
                ],
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(player.name, overflow: TextOverflow.fade, style: EstiloTextoBranco.negrito16)),

                      ],
                    ),

                    Row(
                      children: [
                        Column(
                          children: [
                            Text("Valor: \$"+player.price.toStringAsFixed(3)+'mi',style: EstiloTextoBranco.text10),
                            Text("Salário: \$"+player.salaryK.toStringAsFixed(3)+'k',style: EstiloTextoBranco.text10),
                          ],
                        ),
                        const Icon(Icons.compare_arrows, color: Colors.white, size: 30),
                        Column(
                          children: [
                            Text("\$"+Negotiation().getPrice(playerID).toStringAsFixed(3)+'mi',style: EstiloTextoBranco.text12),
                            Text("\$"+Negotiation().getSalary(playerID).toStringAsFixed(3)+'k',style: EstiloTextoBranco.text12),
                          ],
                        ),
                        const SizedBox(width: 8),
                        Images().getEscudoWidget(Negotiation().getClubName(playerID)),
                        const SizedBox(width: 8),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(5)),
                              color: mapType[type],
                            ),
                            child: Text(type,style: EstiloTextoBranco.text16)
                        ),
                      ],
                    ),
                  ],
                ),
              ),




            ],
          ),
        ),
      ),
    );
}

}
