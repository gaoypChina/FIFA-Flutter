import 'package:fifa/pages/table/table_international.dart';
import 'package:fifa/pages/table/table_international_scorers.dart';
import 'package:fifa/pages/table/table_mata_mata.dart';
import 'package:fifa/pages/table/table_matchs.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

class WidgetBottomInternational{
  String classificacao = 'Classificação';
  String partidas = 'Partidas';
  String matamata = 'Mata-Mata';
  String artilheiros = 'Artilheiros';
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
                child: Image.asset(FIFAImages().campeonatoInternacionalLogo(LeagueOfficialNames().championsLeague),width: 60,height: 60)
            ): GestureDetector(
                onTap: (){
                  functionSetState(LeagueOfficialNames().championsLeague);
                },
                child: Image.asset(FIFAImages().campeonatoInternacionalLogo(LeagueOfficialNames().libertadores),width: 60,height: 60)
            ),


            GestureDetector(
                onTap: (){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TableInternational(leagueInternational: leagueInternational)));
                },
                child: Container(
                  color: actualPage == WidgetBottomInternational().classificacao ? Colors.black26 : Colors.transparent,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(WidgetBottomInternational().classificacao,style: EstiloTextoPreto.text16),
                ),
            ),
            GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TableMatchs(leagueInternational: leagueInternational)));
                },
                child: Container(
                  color: actualPage == WidgetBottomInternational().partidas ? Colors.black26 : Colors.transparent,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(WidgetBottomInternational().partidas,style: EstiloTextoPreto.text16),
                ),
            ),
            GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TableMataMata(leagueInternational: leagueInternational)));
                },
                child: Container(
                  color: actualPage == WidgetBottomInternational().matamata ? Colors.black26 : Colors.transparent,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(WidgetBottomInternational().matamata,style: EstiloTextoPreto.text16),
                ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => TableInternationalScorers(leagueInternational: leagueInternational)));
              },
              child: Container(
                color: actualPage == WidgetBottomInternational().artilheiros ? Colors.black26 : Colors.transparent,
                padding: const EdgeInsets.all(8.0),
                child: Text(WidgetBottomInternational().artilheiros,style: EstiloTextoPreto.text16),
              ),
            ),
          ],
        ),
      ),
    );
}