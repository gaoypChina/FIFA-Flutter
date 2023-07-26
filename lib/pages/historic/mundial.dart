import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/mundial.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/historic_champions/internationals.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/background_image/backimage_international_league.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:flutter/material.dart';

class TableMundial extends StatefulWidget {
  const TableMundial({Key? key}) : super(key: key);

  @override
  State<TableMundial> createState() => _TableMundialState();
}

class _TableMundialState extends State<TableMundial> {

  Map<double, dynamic> results = mapInternationals[LeagueOfficialNames().mundial]!;
  MundialFinal dataFinal = MundialFinal();

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    onInit();
    super.initState();
  }
  onInit(){
    for(int year=anoInicial;year<ano;year++){
      dataFinal.getResults(year);
      Confronto confronto = dataFinal.confronto;
      if(confronto.winnerName == confronto.clubName2){
        confronto.invertTeams();
      }
      results[double.parse(year.toString())] = [confronto.clubName1,confronto.clubName2];
    }
    List keysOrdered = results.keys.toList();
    keysOrdered.sort((b, a) => a.compareTo(b));
    Map<double, List<dynamic>> resultsNovo = {};
    for (var year in keysOrdered) {
      resultsNovo[year] = results[year]!;
    }
    results = resultsNovo;
    setState((){});

  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

          backgroundMundial(),

          Column(
            children: [
              backButtonText(context,'Mundial'),

                  ano-1 >= anoInicial ? row(ano-1) : Container(),

                  Expanded(
                      child: ShaderMask(
                        shaderCallback: (Rect rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.purple, Colors.transparent, Colors.transparent, Colors.purple],
                            stops: [0.0, 0.05, 0.95, 1.0], // 10% purple, 80% transparent, 10% purple
                          ).createShader(rect);
                        },
                        blendMode: BlendMode.dstOut,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 12),
                            itemCount: results.length,
                            itemBuilder: (c, i) => finals((results.keys.first.toInt() - i))
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
  Widget finals(int year){
    try{
      List<String> yearData = results[(year).toDouble()]!;
      String clubName1 = yearData[0];
      String clubName2 = yearData[1];

      return Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
          margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: AppColors().greyTransparent,
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(year.toString(),textAlign:TextAlign.center,style: EstiloTextoBranco.negrito18),
          const SizedBox(width: 16),

          funcFlagsList(ClubDetails().getCountry(clubName1), 15, 25),
          const SizedBox(width: 4),
          Images().getEscudoWidget(clubName1,40,40),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('X',textAlign:TextAlign.center,style: EstiloTextoBranco.text14),
          ),

          Images().getEscudoWidget(clubName2,40,40),
          const SizedBox(width: 4),
          funcFlagsList(ClubDetails().getCountry(clubName2), 15, 25),
        ],
      )
      );
    }catch(e){
      return Container();
    }
  }

  Widget row(int year){
    MundialFinal data = MundialFinal();
    data.getResults(year);
    String teamNameA = data.confronto.clubName1;
    String teamNameB = data.confronto.clubName2;
    int golsA = data.confronto.goal1;
    int golsB = data.confronto.goal2;

    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        color: AppColors().greyTransparent,
      ),
      child: Row(
        children: [

          Flexible(
              flex: 3,
              child: Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().mundial), height: 80, width: 80)),

          Flexible(
            flex: 7,
            child: Column(
              children: [
                Text(year.toString(),textAlign:TextAlign.end,style: EstiloTextoBranco.negrito22),
                Row(
                  children: [

                    //TIME A
                    Column(
                      children: [
                        Row(
                          children: [
                            Images().getEscudoWidget(teamNameA,50,50),
                            Images().getUniformWidget(teamNameA,50,50)
                          ],
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 8),
                            color: teamNameA == My().clubName ? Colors.green : Colors.transparent,
                            child: Text(teamNameA,textAlign:TextAlign.end,style: EstiloTextoBranco.text14)),
                      ],
                    ),


                    golsA >= 0
                        ? Text(' '+ golsA.toString()+'x'+golsB.toString()+' ',style: EstiloTextoBranco.text22)
                        : const Text('X',textAlign:TextAlign.center,style: EstiloTextoBranco.text22),

                    //TIME B
                    Column(
                      children: [
                        Row(
                          children: [
                            Images().getEscudoWidget(teamNameB,50,50),
                            Images().getUniformWidget(teamNameB,50,50),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          color: teamNameB == My().clubName ? Colors.green : Colors.transparent,
                          child: Text(teamNameB,style: EstiloTextoBranco.text14),
                        ),
                      ],
                    ),


                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
