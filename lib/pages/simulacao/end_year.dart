import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/end_year_updates/update_data_year.dart';
import 'package:fifa/classes/expectativa.dart';
import 'package:fifa/classes/functions/name.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/mata_mata/mata_mata_class.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/mundial.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/coach/change_club.dart';
import 'package:fifa/pages/table_international/main_tabs.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/decoration/black_decoration.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/bottom_sheet/bottom_sheet_league_classification.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/widgets/loader.dart';
import 'package:flutter/material.dart';

import '../menu/c_menu.dart';

class EndYear extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const EndYear({Key? key}) : super(key: key);
  @override
  _EndYearState createState() => _EndYearState();
}

class _EndYearState extends State<EndYear> {

  My my = My();
  late League myLeague = League(index: my.leagueID);
  bool loading = false;
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Stack(
            children: [

              Images().getWallpaper(),

              !loading ? Column(
                children: [

                  const SizedBox(height: 30),


                  //TABELA
                  //tabelaClassificacaoWidget(context,myLeague),

                  //Escudo
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(4),
                    decoration: blackDecoration(),
                    child: Column(
                      children: [

                        Text('${Translation(context).text.endOfYear}: ' + ano.toString(),style: EstiloTextoBranco.text30),

                        const SizedBox(height: 10),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Images().getMyEscudo(size: 90),

                            Column(
                              children: [
                                expectativa(),
                                performance(),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),

                  champions(),

                  //VOLTAR
                  customButtonContinue(
                      title: Translation(context).text.next,
                      function: () {
                        onContinueButton();
                      }
                  ),

                ],
              ) : loader(),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget expectativa(){
    return Row(
      children: [

        //EXPECTATIVA
        Column(
          children: [
            Text('${Translation(context).text.expectation}:',style: EstiloTextoBranco.text14),
            Text(my.getLastYearExpectativa().toString()+'º',style: EstiloTextoBranco.text30),
          ],
        ),

        const Icon(Icons.arrow_right,size:40,color:Colors.white),

        //CLASSIFICAÇÃO FINAL
        Column(
          children: [
            Text(Translation(context).text.classification,style: EstiloTextoBranco.text14),
            Text(Classification(leagueIndex: my.leagueID).getClubPosition(my.clubID).toString()+'º',style: EstiloTextoBranco.text30),
          ],
        ),

      ],
    );
}

Widget performance(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          const Text('Performance',style: EstiloTextoBranco.text16),
          expectationBar(),
      ],
    );
}

  Widget expectationBar(){
    int actualPosition = Classification(leagueIndex: my.leagueID).getClubPosition(my.clubID);
    int expectativaPosition = Expectativa(my).expectativaNacional;
    double value = 0.65 + 0.0786*(expectativaPosition-actualPosition); //MADE-UP FORMULA

    return SizedBox(
      width: 200,
      child: LinearProgressIndicator(
        minHeight: 10,
        value: value,
        color: value>=0.65 ? Colors.teal : value > 0.45 ? Colors.yellow : Colors.red,
        backgroundColor: Colors.grey,
      ),
    );
  }
Widget champions(){
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(4),
          decoration: blackDecoration(),
          child: Column(
            children: [
              const Text('Campeões',style: EstiloTextoBranco.negrito22,),
              Wrap(
                children: [
                  for(int leagueID in leaguesListRealIndex)
                    leagueChampion(leagueID)
                ],
              ),
              const SizedBox(height: 12),
              finale(LeagueOfficialNames().championsLeague),
              finale(LeagueOfficialNames().libertadores),
              finale(LeagueOfficialNames().europaLeagueOficial),
              finale(LeagueOfficialNames().copaSulAmericana),
              const SizedBox(height: 12),
              mundial(),
            ],
          ),
        ),
      ),
    );
}
Widget leagueChampion(int leagueID){
  List classificationIndexes = Classification(leagueIndex: leagueID).classificationClubsIndexes;
  int championID = classificationIndexes.first;
  Club clubChampion = Club(index: championID);
    return
        //Image.asset(FIFAImages().campeonatoLogo(Club(index: championID).leagueName),height:40,width: 40,),
        GestureDetector(
            onTap:(){
              List names = [];
              for (int clubID in classificationIndexes) {
                names.add(Club(index: clubID).name);
              }
              bottomSheetShowLeagueClassification(context, names, clubChampion.leagueName);
        },child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Images().getEscudoWidget(clubChampion.name,40,40),
        )
        );
}
Widget mundial(){
  MundialFinal mundial = MundialFinal();
  mundial.getResults(ano);
    return         Column(
      children: [
        const Text('Mundial',style: EstiloTextoBranco.negrito22),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().mundial),height: 35,width:35,),
            Images().getEscudoWidget(mundial.confronto.clubName1,35,35),
            const SizedBox(width: 8),
            Text(mundial.confronto.goal1.toString(),style: EstiloTextoBranco.text16),
            const Text('x',style: EstiloTextoBranco.text14),
            Text(mundial.confronto.goal2.toString(),style: EstiloTextoBranco.text16),
            const SizedBox(width: 8),
            Images().getEscudoWidget(mundial.confronto.clubName2,35,35),
          ],
        ),
      ],
    );
}

Widget finale(String internationalLeagueName){

  MataMata data = MataMata();
  Confronto confronto = data.getData(internationalLeagueName, Name().finale, 1, 0);

  return GestureDetector(
    onTap: (){
      Navigator.push(context,MaterialPageRoute(builder: (context) => TableInternational(leagueInternational: internationalLeagueName)));
    },
    child: Column(
      children: [
        Text(internationalLeagueName,style: EstiloTextoBranco.negrito22),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(FIFAImages().campeonatoLogo(internationalLeagueName),height: 35,width:35,),
            Images().getEscudoWidget(confronto.clubName1,30,30),
            const Text('x',style: EstiloTextoBranco.text14),
            Images().getEscudoWidget(confronto.clubName2,30,30)
          ],
        ),
      ],
    ),
  );
}
////////////////////////////////////////////////////////////////////////////
//                               FUNCTIONS                                //
////////////////////////////////////////////////////////////////////////////
onContinueButton() async{
  customToast(Translation(context).text.loadingNewSeason);
  loading = true;

  bool keepCoach = Expectativa(My()).hadGoodPerformance();

  setState(() {});
  //AWAIT Só pra dar o set state antes e mostrar a pagina carregando
  await Future.delayed(const Duration(milliseconds: 10), () {});
  funcUpdateDataAfterSeason();

  if(keepCoach){
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Menu()));
  }else{
    customToast('Você foi demitido. Escolha um novo clube');
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const ChangeClub()));
  }

}


}
