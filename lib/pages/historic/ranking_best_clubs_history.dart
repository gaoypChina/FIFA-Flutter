import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/page_controller/club_profile/data_graphics.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class RankingBestClubsHistory extends StatefulWidget {
  const RankingBestClubsHistory({Key? key}) : super(key: key);

  @override
  State<RankingBestClubsHistory> createState() =>
      _RankingBestClubsHistoryState();
}

class _RankingBestClubsHistoryState extends State<RankingBestClubsHistory> {

  List clubsPoints = []; //criado no init
  List copyClubsName = [];
  final ScrollController _scrollController = ScrollController();

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    organize();
    super.initState();
  }
  organize() async{

    try{
      for(int i=0; i<globalRankingClubs[ano]!.length; i++) {
        clubsPoints.add(globalRankingClubs[ano]![i]);
        copyClubsName.add(clubsAllNameList[i]);
      }
    }catch(e){
      organizarRanking();
    }
    order();
    setState(() {});
  }

  organizarRanking() {
    //REORGANIZA ORDEM
    globalRankingClubs[ano] = [];
    int ending = 10;
      for(int i=0; i<ending; i++) {
        setState(() {});
        customToast('${(100*i/ending).toStringAsFixed(1)}%');
        try {
          Club clubClass = Club(index: i,hasPlayers: true,clubDetails: false);
          DataGraphics data = DataGraphics();
          data.getData(clubClass);
          clubsPoints.add(data.pointsTotal);
          copyClubsName.add(clubClass.name);
          globalRankingClubs[ano]!.add(data.pointsTotal);
        }catch(e){
          //print('clube tem jogadores mas nao existe no jogo');
        }
      }
  }
  order(){
    for(int i=0; i<clubsPoints.length-1; i++) {
      for(int k=i+1; k<clubsPoints.length; k++) {
        if(clubsPoints[k] > clubsPoints[i]){
          late double auxiliarDouble;
          late String auxiliarString;
          auxiliarDouble = clubsPoints[i];clubsPoints[i] = clubsPoints[k]; clubsPoints[k] = auxiliarDouble;
          auxiliarString = copyClubsName[i];copyClubsName[i] = copyClubsName[k]; copyClubsName[k] = auxiliarString;
        }
      }
    }
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
              backButtonText(context, 'Melhores clubes da história'),
              title(),
              Expanded(
                  child: DraggableScrollbar.semicircle(
                    alwaysVisibleScrollThumb: true,
                    controller: _scrollController,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                        controller: _scrollController,
                        itemCount: copyClubsName.length,
                        itemBuilder: (c, i) => row(i)
                    ),
                  )
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
    return Container( 
      padding: const EdgeInsets.all(4),
      child:  Row(
      children: const [
        SizedBox(width: 35),
        Text('Club', style: EstiloTextoBranco.negrito16),
        Spacer(),
        Text('Pts', style: EstiloTextoBranco.negrito16),
        SizedBox(width: 8),
      ],
    )
    );
  }
  Widget row(int i) {
    int clubID = clubsAllNameList.indexOf(copyClubsName[i]);

    //clubes da minha liga
    List listClubsID = League(index: My().campeonatoID).getAllClubsIDList();
    //Cor de Fundo
    Color colorBackground = Colors.transparent;
    if(clubID==My().clubID){
      colorBackground = Colors.redAccent;
    }
    else if(listClubsID.contains(clubID)){
      colorBackground = Colors.blue;
    }

    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: clubID)));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(width:30,child: Text((i+1).toString() + 'º ', style: EstiloTextoBranco.text14)),
            Image.asset(Images().getEscudo(copyClubsName[i]), height: 30, width: 30),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                  color: colorBackground,
                  padding: const EdgeInsets.all(4.0),
                  child: Text(copyClubsName[i], style: EstiloTextoBranco.text16)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0,right: 22),
              child: Text(clubsPoints[i].toString(),style: EstiloTextoBranco.text14),
            ),
          ],
        ),
      ),
    );
  }
}
