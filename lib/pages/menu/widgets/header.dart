import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/functions/dificuldade.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/classes/semana.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';

Widget wHomeHeader(BuildContext context, My myClass, Club myClub){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [

      //Escudo
      Images().getMyEscudo(size: 90),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width:180,child: Text(myClass.clubName,textAlign: TextAlign.center,style: EstiloRajdhani.bold22)),
          Text('${Translation(context).text.year}: ${Semana(semana).realDate}',style: EstiloTextoBranco.text12),
          Text('${Translation(context).text.week}: '+ semana.toString(),style: EstiloTextoBranco.text12),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.monetization_on_outlined, color: Colors.white, size: 16),
                      Text(Translation(context).text.money,style: EstiloRajdhani.medium),
                    ],
                  ),
                  Text('\$'+ myClass.money.toStringAsFixed(2)+'mi',style: EstiloRajdhani.listtitle),
                ],
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.white, size: 16),
                      Text(Translation(context).text.ovr3,style: EstiloRajdhani.medium),
                    ],
                  ),
                  Text(Club(index: myClass.clubID).getOverall().toStringAsFixed(2), style: EstiloRajdhani.listtitle),
                ],
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.leaderboard_outlined, color: Colors.white, size: 16),
                      Text(Translation(context).text.difficulty,style: EstiloRajdhani.medium),
                    ],
                  ),
                  Text(DificuldadeClass().getNameTranslated(context), style: EstiloRajdhani.listtitle),
                ],
              ),
            ],
          ),

        ],
      ),

      //UNIFORME
      Images().getMyUniform(height: 100,width: 100),

    ],
  );
}