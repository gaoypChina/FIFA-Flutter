import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/pages/historic/international_historic.dart';
import 'package:fifa/pages/historic/leagues_historic.dart';
import 'package:fifa/pages/historic/my_players_historic.dart';
import 'package:fifa/pages/historic/players_historic.dart';
import 'package:fifa/pages/historic/ranking_best_clubs_history.dart';
import 'package:fifa/pages/historic/mundial.dart';
import 'package:fifa/pages/historic/year_resume.dart';
import 'package:fifa/pages/map/map_exploration.dart';
import 'package:fifa/pages/map/map_list_all_clubs.dart';
import 'package:fifa/pages/simulacao/after_play.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
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
    double imageSize = 50;
    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Column(
            children: [
              backButtonText(context,'Menu Histórico'),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          box(
                              'Nacional',
                              Image.asset(FIFAImages().campeonatoLogo(My().campeonatoName),height: imageSize,),
                                  (){Navigator.push(context,MaterialPageRoute(builder: (context) => HistoricLeague(choosenLeagueIndex: My().campeonatoID)));
                              }
                          ),
                          box(
                              'Internacional',
                              Image.asset(FIFAImages().campeonatoInternacionalLogo(LeagueOfficialNames().championsLeague),height: imageSize,),
                                  (){Navigator.push(context,MaterialPageRoute(builder: (context) => const InternationalHistoric()));
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
                              Image.asset('assets/icons/generic_user.png',height: imageSize,),
                                  (){Navigator.push(context,MaterialPageRoute(builder: (context) => const PlayersHistoric()));
                              }
                          ),
                          box(
                              'Mundial',
                              Image.asset('assets/league_logos/mundial.png',height: imageSize,),
                                  (){Navigator.push(context,MaterialPageRoute(builder: (context) => const TableMundial()));
                              }
                          ),

                        ],
                      ),

                      //3ªfileira
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          box(
                              'Meus Elencos',
                              Image.asset('assets/icons/generic_user.png',height: imageSize,),
                                  (){Navigator.push(context,MaterialPageRoute(builder: (context) => const MyPlayersHistoric()));
                              }
                          ),
                          box(
                              'Melhores clubes da história',
                              Image.asset('assets/clubs/generic.png',height: imageSize,),
                                  (){Navigator.push(context,MaterialPageRoute(builder: (context) => const RankingBestClubsHistory()));
                              }
                          ),

                        ],
                      ),

                      //TESTE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          box(
                              'Post Match',
                              Icon(Icons.sports_volleyball_outlined,color: Colors.white, size: imageSize),
                                  (){Navigator.push(context,MaterialPageRoute(builder: (context) => const AfterPlay()));
                              }
                          ),
                          box(
                              'Resumo do ano',
                              Icon(Icons.summarize,color: Colors.white, size: imageSize),
                                  (){Navigator.push(context,MaterialPageRoute(builder: (context) => const YearResume()));
                              }
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          box(
                              'Mapa',
                              Icon(Icons.map,color: Colors.white, size: imageSize),
                                  (){Navigator.push(context,MaterialPageRoute(builder: (context) => const MapExploration()));
                              }
                          ),
                          box(
                              'Lista de Clubes',
                              Icon(Icons.list_alt,color: Colors.white, size: imageSize),
                                  (){Navigator.push(context,MaterialPageRoute(builder: (context) => const MapListAllClubs()));
                              }
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
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
    return Container(
      margin: const EdgeInsets.all(4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            function();
          },
          child: Container(
            height: 100,
            width: Sized(context).width*0.45,
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
                Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.text16),
              ],
            ),
          ),
        ),
      ),
    );
}
}
