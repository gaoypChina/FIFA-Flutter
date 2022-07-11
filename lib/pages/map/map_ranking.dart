import 'package:fifa/classes/image_class.dart';
import 'package:fifa/database/local_database/shared_preferences.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class MapRanking extends StatefulWidget {
  const MapRanking({Key? key}) : super(key: key);

  @override
  State<MapRanking> createState() => _MapRankingState();
}

class _MapRankingState extends State<MapRanking> {

  late List listRanking = [];

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    getRanking();
    super.initState();
  }
  getRanking() async{
    listRanking = (await SharedPreferenceHelper().getMapRanking())!;
    listRanking.sort();
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

              Expanded(
                child: ListView.builder(
                  itemCount: listRanking.length,
                    itemBuilder: (c,i)=> listRow(i)),
              )
 
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
    return Container(
      height: 50,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text((i+1).toString()+'º',style: EstiloTextoBranco.text16,),
          const Spacer(),
          Text(listRanking[i].toString()+'s',style: EstiloTextoBranco.negrito18,),
        ],
      ),
    );
  }


}
