import 'package:fifa/classes/match/confronto.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/mundial.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:flutter/material.dart';

Widget notPlayMundial(BuildContext context){

  return SingleChildScrollView(
    child: Column(
      children: [
        Image.asset(FIFAImages().mundialLogo(),height: 50,width: 50),
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

    String teamNameA = data.club1.name;
    String teamNameB = data.club2.name;
    double imageSize = 25;

    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
                color: teamNameA == myclass.clubName ? Colors.green : Colors.transparent,
                child: Text(teamNameA,textAlign:TextAlign.end,style: EstiloTextoBranco.text14)),
            //Escudo
            Images().getEscudoWidget(teamNameA,imageSize,imageSize),

            //confronto.goal1 >= 0
            //    ? Text(' '+ confronto.goal1.toString()+'x'+confronto.goal2.toString()+' ',style: EstiloTextoBranco.text14)
            //    : const Text('X',textAlign:TextAlign.center,style: EstiloTextoBranco.text14),
            //Escudo
            Images().getEscudoWidget(teamNameB,imageSize,imageSize),

            Container(
              color: teamNameB == myclass.clubName ? Colors.green : Colors.transparent,
              child: Text(teamNameB,style: EstiloTextoBranco.text14),
            ),

          ],
        ),
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


