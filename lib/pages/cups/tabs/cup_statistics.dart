import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

class CupStatistics extends StatefulWidget {
  const CupStatistics({Key? key}) : super(key: key);

  @override
  State<CupStatistics> createState() => _CupStatisticsState();
}

class _CupStatisticsState extends State<CupStatistics> {

  String typeSelected = "Artilheiros";

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [

          const SizedBox(height: 6),
          Row(
            children: [
              buttonSelection("Artilheiros"),
              buttonSelection("Assistências"),
              buttonSelection("Melhor Jogador"),
            ],
          ),
          const SizedBox(height: 6),

          statisticsBox(typeSelected),
        ],
    );
  }

  Widget statisticsBox(String title){
    return Flexible(
      child: Container(
        color: AppColors().greyTransparent,
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.all(4),
        child: Column(
          children: [
            Text(title,style: EstiloTextoBranco.negrito18),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for(int i=1;i<=50;i++)
                      rowPlayer(Jogador(index: i*37), i),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget rowPlayer(Jogador player, int result){
    return Row(
      children: [
        SizedBox(width: 35,child: Text(result.toString()+"- ",style: EstiloTextoBranco.text14)),
        Images().getEscudoWidget(player.clubName,25,25),
        const SizedBox(width: 5),
        SizedBox(width: 30,child: Text(result.toString(),style: EstiloTextoBranco.negrito16)),
        SizedBox(width:180,child: Text(player.name,style: EstiloTextoBranco.text14)),
      ],
    );
  }

  Widget buttonSelection(String title){
    return GestureDetector(
      onTap: (){
        typeSelected = title;
        setState((){});
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: AppColors().greyTransparent,
          border: Border.all(
            color: typeSelected == title ? Colors.white : AppColors().greyTransparent,
            width: 1.0,
          ),
        ),
        child: Text(title, style: EstiloTextoBranco.text16),
      ),
    );
  }
}


