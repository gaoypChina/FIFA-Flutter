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

    String teamNameA = data.club1.name;
    String teamNameB = data.club2.name;

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

            data.goal1 >= 0
                ? Text(' '+ data.goal1.toString()+'x'+data.goal2.toString()+' ',style: EstiloTextoBranco.text14)
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
            Images().getUniformWidget(teamNameA,50,50),
            Images().getUniformWidget(teamNameB,50,50),
          ],
        )
      ],
    );
  }


