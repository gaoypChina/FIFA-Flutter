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
        row(),
      ],
    ),
  );
}

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
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


