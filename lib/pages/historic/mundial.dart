import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/mundial.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/countries/flags_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/historic_champions/internationals.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:fifa/widgets/background/background_international_league.dart';
import 'package:flutter/material.dart';

class TableMundial extends StatefulWidget {
  const TableMundial({Key? key}) : super(key: key);

  @override
  State<TableMundial> createState() => _TableMundialState();
}

class _TableMundialState extends State<TableMundial> {

  Map<double,dynamic> results = mapInternationals[LeagueOfficialNames().mundial];
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
      results[double.parse(year.toString())] = [confronto.clubName1,confronto.clubName2];
    }
    List keysOrdered = results.keys.toList();
    keysOrdered.sort((b, a) => a.compareTo(b));
    Map<double,dynamic> resultsNovo = {};
    for (var year in keysOrdered) {
      resultsNovo[year] = results[year];
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

                  ano-1>=anoInicial ? row(ano-1) : Container(),

                  Expanded(
                      child: ShaderMask(
                        shaderCallback: (Rect rect) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.purple, Colors.transparent, Colors.transparent, Colors.purple],
                            stops: [0.0, 0.1, 0.95, 1.0], // 10% purple, 80% transparent, 10% purple
                          ).createShader(rect);
                        },
                        blendMode: BlendMode.dstOut,
                        child: ListView.builder(
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
      List yearData = results[(year).toDouble()];
      Club club1 = Club(index: clubsAllNameList.indexOf(yearData[0]));
      Club club2 = Club(index: clubsAllNameList.indexOf(yearData[1]));

      return Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(year.toString()+': ',textAlign:TextAlign.center,style: EstiloTextoBranco.text14),

          funcFlagsList(club1.nationality, 15, 25),
          const SizedBox(width: 4),
          Images().getEscudoWidget(club1.name,40,40),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('X',textAlign:TextAlign.center,style: EstiloTextoBranco.text14),
          ),

          Images().getEscudoWidget(club2.name,40,40),
          const SizedBox(width: 4),
          funcFlagsList(club2.nationality, 15, 25),
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
    Confronto confronto = data.confronto;
    String teamNameA = confronto.clubName1;
    String teamNameB = confronto.clubName2;
    int golsA = confronto.goal1;
    int golsB = confronto.goal2;

    return  Row(
      children: [

        Flexible(
            flex: 3,
            child: Image.asset(FIFAImages().mundialLogo(), height: 80, width: 80)),

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
    );
  }


}
