import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/mundial.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';

Widget notPlayMundial(BuildContext context){

  return SingleChildScrollView(
    child: Column(
      children: [
        const SizedBox(height: 16),
        Image.asset(FIFAImages().campeonatoLogo(LeagueOfficialNames().mundial),height: 50,width: 50),
        const SizedBox(height: 8),
        Text(Translation(context).text.finale, style: EstiloTextoBranco.negrito22),
        row(My()),
      ],
    ),
  );
}

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget row(My myclass){

    MundialFinal data = MundialFinal();
    data.getClubs();

    String teamNameA = data.confronto.clubName1;
    String teamNameB = data.confronto.clubName2;
    double imageSize = 36;

    return  Column(
      children: [

        const SizedBox(height: 16),

        Row(
          children: [

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      color: teamNameA == myclass.clubName ? Colors.green : Colors.transparent,
                      child: Text(teamNameA,textAlign:TextAlign.end,style: EstiloTextoBranco.text14)),
                  const SizedBox(width: 8),
                  Images().getEscudoWidget(teamNameA,imageSize,imageSize),
                ],
              ),
            ),
            //Escudo

            const SizedBox(width: 16),

            //Escudo
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Images().getEscudoWidget(teamNameB,imageSize,imageSize),
                  const SizedBox(width: 8),

                  Container(
                  color: teamNameB == myclass.clubName ? Colors.green : Colors.transparent,
                    child: Text(teamNameB,style: EstiloTextoBranco.text14)
                  ),
                ],
              ),
            ),


          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Images().getUniformWidget(teamNameA,100,100),
            Images().getUniformWidget(teamNameB,100,100),
          ],
        )
      ],
    );
  }


