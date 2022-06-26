import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/historic/international_historic.dart';
import 'package:fifa/pages/historic/leagues_historic.dart';
import 'package:fifa/pages/historic/my_players_historic.dart';
import 'package:fifa/pages/historic/players_historic.dart';
import 'package:fifa/pages/historic/ranking_best_clubs_history.dart';
import 'package:fifa/pages/table/table_mundial.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class HistoricMenu extends StatefulWidget {
  const HistoricMenu({Key? key}) : super(key: key);

  @override
  State<HistoricMenu> createState() => _HistoricMenuState();
}

class _HistoricMenuState extends State<HistoricMenu> {


////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Column(
            children: [
              backButtonText(context,'Menu Histórico'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  box(
                      'Nacional',
                      Image.asset(FIFAImages().campeonatoLogo(1),height: 50,),
                          (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const HistoricLeague()));
                      }
                  ),
                  box(
                      'Internacional',
                      Image.asset(FIFAImages().campeonatoInternacionalLogo('Champions League'),height: 50,),
                          (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const InternationalHistoric()));
                      }
                  ),

                ],
              ),

              //2ªfileira
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  box(
                      'Jogadores',
                      Image.asset('assets/icons/generic_user.png',height: 50,),
                          (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const PlayersHistoric()));
                      }
                  ),
                  box(
                      'Mundial',
                      Image.asset('assets/league_logos/mundial.png',height: 50,),
                          (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const TableMundial()));
                      }
                  ),

                ],
              ),

              //3ªfileira
              Row(
                children: [
                  box(
                      'Meus Elencos',
                      Image.asset('assets/icons/generic_user.png',height: 50,),
                          (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const MyPlayersHistoric()));
                      }
                  ),
                  box(
                      'Melhores clubes da história',
                      Image.asset('assets/clubs/generic.png',height: 50,),
                          (){
                        Navigator.push(context,MaterialPageRoute(builder: (context) => const RankingBestClubsHistory()));
                      }
                  ),
                ],
              ),

            ],
          ),
        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget box(String text, Widget centralWidget, Function function){
    return InkWell(
      onTap: (){
        function();
      },
      child: Container(
        height: 100,
        width: Sized(context).width*0.45,
        margin: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.all(
              Radius.circular(5.0) //                 <--- border radius here
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            centralWidget,
            Text(text,style: EstiloTextoBranco.text16),
          ],
        ),
      ),
    );
}
}
