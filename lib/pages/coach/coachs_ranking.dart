import 'package:fifa/classes/image_class.dart';
import 'package:fifa/page_controller/coach/coach_ranking_controller.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class CoachRanking extends StatefulWidget {
  const CoachRanking({Key? key}) : super(key: key);

  @override
  State<CoachRanking> createState() => _CoachRankingState();
}

class _CoachRankingState extends State<CoachRanking> {

  CoachRankingController controller = CoachRankingController();
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),
          Column(
            children: [
              backButtonText(context,'Melhores treinadores'),
              title(),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                    itemCount: 10,
                    itemBuilder: (c,i)=> row(i)
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
  Widget title(){
    return Row(
        children: [
          const SizedBox(width: 40),
          Text(Translation(context).text.name,style: EstiloTextoBranco.negrito16),
          const Spacer(),
          Text(Translation(context).text.points,style: EstiloTextoBranco.negrito16),
          const SizedBox(width: 8),
        ],
    );
  }

  Widget row(int i){
    controller.getData(i);
    return Container(
        margin: const EdgeInsets.all(4),
        child: Row(
      children: [
        SizedBox(
          width: 35,
          child: Text((i+1).toString()+'º',style: EstiloTextoBranco.text16),
        ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.name,style: EstiloTextoBranco.negrito16),
              Row(
                children: [
                  Text(controller.simulationYear.toString(),style: EstiloTextoBranco.text16),
                  Image.asset(Images().getEscudo(controller.clubName),height:20,width: 20,),
                  ],
              )
            ],
          ),
        const Spacer(),
        Column(
          children: [
            Text(controller.points.toString(),style: EstiloTextoBranco.negrito16),
            Text(controller.date,style: EstiloTextoBranco.text12),
          ],
        )
      ],
    )
    );
}

}
