import 'package:fifa/classes/image_class.dart';
import 'package:fifa/page_controller/map/map_ranking_controller.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class MapRanking extends StatefulWidget {
  const MapRanking({Key? key}) : super(key: key);

  @override
  State<MapRanking> createState() => _MapRankingState();
}

class _MapRankingState extends State<MapRanking> {

  MapRankingController mapRankingController = MapRankingController();
  bool loaded = false;
////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    getRanking();
    super.initState();
  }
  getRanking() async{
    await mapRankingController.getStoredDataList();
    loaded=true;
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
          Images().getWallpaper(),

          Column(
            children: [
              backButtonText(context, 'Ranking'),

              loaded
                  ? Expanded(
                child: ListView.builder(
                  itemCount: mapRankingController.savedListSeparated.length,
                    itemBuilder: (c,i)=> listRow(i)),
              ): Container(),
 
            ],
          ),
        ],
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget listRow(int i){
    mapRankingController.listToClass(mapRankingController.savedListSeparated[i]);
    return Container(
      height: 80,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text((i+1).toString()+'º  ',style: EstiloTextoBranco.text16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Acertos: "+mapRankingController.mapRankingIndividual.nCorrect.toString(),style: EstiloTextoBranco.text16,),
              Text("Tempo: "+mapRankingController.mapRankingIndividual.milis.toString()+'s ',style: EstiloTextoBranco.text16,),
              Text("Dificuldade: "+mapRankingController.mapRankingIndividual.difficulty.toString(),style: EstiloTextoBranco.text16,),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Text(mapRankingController.mapRankingIndividual.score.toString()+'pts ',style: EstiloTextoBranco.negrito18,),
              Text(mapRankingController.mapRankingIndividual.date+' ',style: EstiloTextoBranco.text14,),

            ],
          ),
        ],
      ),
    );
  }


}
