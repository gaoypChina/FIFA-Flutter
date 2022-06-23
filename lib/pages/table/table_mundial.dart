import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/mundial.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/historic_champions.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/background/background_international_league.dart';
import 'package:flutter/material.dart';

class TableMundial extends StatefulWidget {
  const TableMundial({Key? key}) : super(key: key);

  @override
  State<TableMundial> createState() => _TableMundialState();
}

class _TableMundialState extends State<TableMundial> {

  Map<double,dynamic> results = mapChampions(LeagueOfficialNames().mundial);

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
    return Scaffold(
      body: Stack(
        children: [

          backgroundMundial(),

          Column(
            children: [
              const SizedBox(height: 32),
              Image.asset(FIFAImages().mundialLogo(), height: 50, width: 50),
              Text(Translation(context).text.finale,
                  style: EstiloTextoBranco.negrito22),
              row(),

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
                            reverse: true,
                            itemBuilder: (c, i) => finals(i + anoInicial - 62)
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
        children: [
          Text(year.toString()+': ',textAlign:TextAlign.center,style: EstiloTextoBranco.text14),

          funcFlagsList(club1.nationality, 15, 25),
          const SizedBox(width: 4),
          Image.asset(Images().getEscudo(club1.name),height: 40,width: 40),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('X',textAlign:TextAlign.center,style: EstiloTextoBranco.text14),
          ),

          Image.asset(Images().getEscudo(club2.name),height: 40,width: 40),
          const SizedBox(width: 4),
          funcFlagsList(club2.nationality, 15, 25),
        ],
      )
      );
    }catch(e){
      return Container();
    }
  }

  Widget row(){
    MundialFinal data = MundialFinal();

    //print(data.clubName1);
    //print('GOL: ${data.goal1} x ${data.goal2}');
    String teamNameA = data.clubName1;
    String teamNameB = data.clubName2;
    int golsA = data.goal1;
    int golsB = data.goal2;

    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
                color: teamNameA == My().clubName ? Colors.green : Colors.transparent,
                child: Text(teamNameA,textAlign:TextAlign.end,style: EstiloTextoBranco.text14)),
            //Escudo
            Image.asset(Images().getEscudo(teamNameA),height: 20,width: 20),

            golsA >= 0
                ? Text(' '+ golsA.toString()+'x'+golsB.toString()+' ',style: EstiloTextoBranco.text14)
                : const Text('X',textAlign:TextAlign.center,style: EstiloTextoBranco.text14),
            //Escudo
            Image.asset(Images().getEscudo(teamNameB),height: 20,width: 20),

            Container(
              color: teamNameB == My().clubName ? Colors.green : Colors.transparent,
              child: Text(teamNameB,style: EstiloTextoBranco.text14),
            ),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images().getUniform(teamNameA),height: 50,width: 50),
            Image.asset(Images().getUniform(teamNameB),height: 50,width: 50),
          ],
        )
      ],
    );
  }


}
