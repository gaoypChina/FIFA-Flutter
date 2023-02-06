import 'package:fifa/pages/table_international/table_international.dart';
import 'package:fifa/pages/table_international/table_international_scorers.dart';
import 'package:fifa/pages/table_international/table_mata_mata.dart';
import 'package:fifa/pages/table_international/table_matchs.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

class WidgetBottomInternational{
  String classificacao = 'Classificação';
  String partidas = 'Partidas';
  String matamata = 'Mata-Mata';
  String artilheiros = 'Artilheiros';

  getTranslation(BuildContext context, String word){
    if(word == 'Classificação'){word = Translation(context).text.classification;}
    if(word == 'Partidas'){word = Translation(context).text.matchs;}
    if(word == 'Mata-Mata'){word = Translation(context).text.knockoutStage;}
    if(word == 'Artilheiros'){word = Translation(context).text.topScorers;}
    return word;
  }
}
Widget customWidgetBottomBar (BuildContext context,String actualPage, String leagueInternational,Function(String leagueInternational) functionSetState){
  return                     //BOTTOM BAR
    Container(
      color: AppColors().grey1,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const SizedBox(width: 8),
            //LIBERTADORES OU CHAMPIONS LEAGUE
            leagueInternational == LeagueOfficialNames().championsLeague
                ? GestureDetector(
                onTap: (){
                  functionSetState(LeagueOfficialNames().libertadores);
                },
                child: Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().championsLeague), width: 50,height: 50)
            ) : leagueInternational == LeagueOfficialNames().libertadores
                ? GestureDetector(
                onTap: (){
                  functionSetState(LeagueOfficialNames().europaLeagueOficial);
                },
                child: Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().libertadores), width: 50,height: 50)
            ): leagueInternational == LeagueOfficialNames().europaLeagueOficial
                ? GestureDetector(
                onTap: (){
                  functionSetState(LeagueOfficialNames().copaSulAmericana);
                },
                child: Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().europaLeagueOficial), width: 50,height: 50)
            ) : GestureDetector(
                onTap: (){
                  functionSetState(LeagueOfficialNames().championsLeague);
                },
                child: Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().copaSulAmericana), width: 50,height: 50)
            ),

            bottomButton(context, actualPage, WidgetBottomInternational().classificacao, TableInternational(leagueInternational: leagueInternational)),
            bottomButton(context, actualPage, WidgetBottomInternational().partidas, TableMatchs(leagueInternational: leagueInternational)),
            bottomButton(context, actualPage, WidgetBottomInternational().matamata, TableMataMata(leagueInternational: leagueInternational)),
            bottomButton(context, actualPage, WidgetBottomInternational().artilheiros, TableInternationalScorers(leagueInternational: leagueInternational)),

          ],
        ),
      ),
    );
}

Widget bottomButton(BuildContext context,String actualPage,String word, Widget page){
  return GestureDetector(
    onTap: (){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => page));
    },
    child: Container(
      color: actualPage == word ? AppColors().primary : Colors.transparent,
      padding: const EdgeInsets.all(8.0),
      child: Text(WidgetBottomInternational().getTranslation(context, word),style: EstiloTextoPreto.text16),
    ),
  );
}