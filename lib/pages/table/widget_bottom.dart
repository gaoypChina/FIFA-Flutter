import 'package:fifa/pages/table/table_international.dart';
import 'package:fifa/pages/table/table_international_scorers.dart';
import 'package:fifa/pages/table/table_mata_mata.dart';
import 'package:fifa/pages/table/table_matchs.dart';
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
            leagueInternational == LeagueOfficialNames().championsLeague ? GestureDetector(
                onTap: (){
                  functionSetState(LeagueOfficialNames().libertadores);
                },
                child: Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().championsLeague), width: 50,height: 50)
            ): GestureDetector(
                onTap: (){
                  functionSetState(LeagueOfficialNames().championsLeague);
                },
                child: Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().libertadores),width: 50,height: 50)
            ),


            GestureDetector(
                onTap: (){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TableInternational(leagueInternational: leagueInternational)));
                },
                child: Container(
                  color: actualPage == WidgetBottomInternational().classificacao ? AppColors().primary : Colors.transparent,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(WidgetBottomInternational().getTranslation(context, WidgetBottomInternational().classificacao),style: EstiloTextoPreto.text16),
                ),
            ),
            GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TableMatchs(leagueInternational: leagueInternational)));
                },
                child: Container(
                  color: actualPage == WidgetBottomInternational().partidas ? AppColors().primary : Colors.transparent,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(WidgetBottomInternational().getTranslation(context, WidgetBottomInternational().partidas),style: EstiloTextoPreto.text16),
                ),
            ),
            GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TableMataMata(leagueInternational: leagueInternational)));
                },
                child: Container(
                  color: actualPage == WidgetBottomInternational().matamata ? AppColors().primary : Colors.transparent,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(WidgetBottomInternational().getTranslation(context, WidgetBottomInternational().matamata),style: EstiloTextoPreto.text16),
                ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TableInternationalScorers(leagueInternational: leagueInternational)));
              },
              child: Container(
                color: actualPage == WidgetBottomInternational().artilheiros ? AppColors().primary : Colors.transparent,
                padding: const EdgeInsets.all(8.0),
                child: Text(WidgetBottomInternational().getTranslation(context, WidgetBottomInternational().artilheiros),style: EstiloTextoPreto.text16),
              ),
            ),
          ],
        ),
      ),
    );
}