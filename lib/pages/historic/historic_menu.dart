import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/historic/international/international_historic.dart';
import 'package:fifa/pages/historic/leagues_historic.dart';
import 'package:fifa/pages/historic/mundial.dart';
import 'package:fifa/pages/historic/my_players_historic.dart';
import 'package:fifa/pages/historic/players_historic.dart';
import 'package:fifa/pages/historic/real_classification.dart';
import 'package:fifa/pages/historic/year_resume/year_resume.dart';
import 'package:fifa/pages/map/choose_continent_page.dart';
import 'package:fifa/pages/map/map_exploration.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
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

              backButtonText(context, 'Menu Histórico', true),
              const SizedBox(height: 8),

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
                                  (){Navigator.push(context,MaterialPageRoute(builder: (context) => HistoricLeague(chosenLeagueName: My().getLeagueName())));
                              }
                          ),
                          box(
                              'Internacional',
                              Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().championsLeague),height: imageSize,),
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
                                  (){
                                if(ano>anoInicial){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => const PlayersHistoric()));
                                }else{
                                  customToast('Sem dados. Jogue 1 temporada completa');
                                }
                              }
                          ),
                          box(
                              'Mundial',
                              Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().mundial),height: imageSize,),
                                  (){Navigator.push(context,MaterialPageRoute(builder: (context) => const TableMundial()));
                              }
                          ),

                        ],
                      ),

                      //TESTE
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          box(
                              'Meus Elencos',
                              Image.asset('assets/icons/generic_user.png',height: imageSize,),
                                  (){Navigator.push(context,MaterialPageRoute(builder: (context) => MyPlayersHistoric(year: ano)));
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
                                  (){Navigator.push(context,MaterialPageRoute(builder: (context) => const ChooseContinentPage()));}
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          box(
                              'Tabela Real',
                              Icon(Icons.line_weight,color: Colors.white, size: imageSize),
                                  (){
                                navigatorPush(context, RealClassificationPage(chosenCountryName: ClubDetails().getCountry(My().clubName)));
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
      child: PressableButton(
        onTap: (){
          function();
        },
        child: Container(
          height: 100,
          width: Sized(context).width*0.45,
          decoration: BoxDecoration(
            color: AppColors().greyTransparent,
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(
              width: 1.0,
              color: AppColors().green,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              centralWidget,
              Text(text,textAlign:TextAlign.center,style: EstiloTextoBranco.negrito16),
            ],
          ),
        ),
      ),
    );
}
}
