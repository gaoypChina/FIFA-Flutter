import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/dificuldade.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';

Widget wHomeHeader(BuildContext context, My myClass){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [

      //Escudo
      Images().getMyEscudo(size: 90),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width:180,child: Text(myClass.clubName,textAlign: TextAlign.center,style: EstiloTextoBranco.negrito22)),
          Text('${Translation(context).text.year}: '+ ano.toString() + ' ${Translation(context).text.week}: '+ semana.toString(),style: EstiloTextoBranco.negrito16),
          const SizedBox(height: 8),
          Text('${Translation(context).text.money}: \$'+ myClass.money.toStringAsFixed(2)+'mi',style: EstiloTextoBranco.text14),
          Text('${Translation(context).text.clubOverall}: ' + Club(index: myClass.clubID).getOverall().toStringAsFixed(2),style: EstiloTextoBranco.text14),
          Text('${Translation(context).text.clubValue}: \$' + myClass.getClubValue().toStringAsFixed(2)+'mi',style: EstiloTextoBranco.text14),
          Text('${Translation(context).text.difficulty}: '+DificuldadeClass().getNameTranslated(context),style: EstiloTextoBranco.text14),
        ],
      ),

      //UNIFORME
      Images().getMyUniform(height: 100,width: 100),

    ],
  );
}