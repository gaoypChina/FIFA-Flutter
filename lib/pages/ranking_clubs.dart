import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/func_number_clubs_total.dart';
import 'package:fifa/page_controller/ranking_clubs_control.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/images.dart';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import '../values/images.dart';
import '../values/league_names.dart';
import 'club_profile.dart';

class RankingClubs extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const RankingClubs({Key? key}) : super(key: key);
  @override
  _RankingClubsState createState() => _RankingClubsState();
}

class _RankingClubsState extends State<RankingClubs> {

  int numberClubsTotal = funcNumberClubsTotal();
  My myClub = My();
  RankingClubsControl rankingClubs = RankingClubsControl();
  final ScrollController _scrollController = ScrollController();

  bool isLoaded = false;

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    organizarRanking();
    super.initState();
  }
  organizarRanking(){
    rankingClubs.organizarRanking();

    isLoaded=true;
    setState(() {});
  }
  @override
  void dispose() {
    //Cancelar o timer do envio de email
    _scrollController.dispose();
    super.dispose();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:  Stack(
            children: [

              Images().getWallpaper(),

              isLoaded ? Column(
                children: [

                  const SizedBox(height: 40),
                  const Text('Ranking de Clubes',style: EstiloTextoBranco.text20),
                  const SizedBox(height: 6),

                  Expanded(
                    child: DraggableScrollbar.semicircle(
                      alwaysVisibleScrollThumb: true,
                      controller: _scrollController,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        controller: _scrollController,
                        itemCount: numberClubsTotal,
                          itemBuilder: (c,i) => rowClub(i, rankingClubs.copyClubsName[i])
                      ),
                    ),
                  )


                ],
              ) : const Center(child: CircularProgressIndicator())

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

Widget rowClub(int ranking, String clubName){

    int realClubIndex = clubsAllNameList.indexOf(clubName);
    double overall = rankingClubs.clubsOVR[ranking];

    //Cor de Fundo
    Color colorBackground = Colors.transparent;
    List listClubsID = League(index: myClub.campeonatoID).getAllClubsIDList();

    if(listClubsID.contains(realClubIndex)){
      colorBackground = Colors.blue;
    }
    if(realClubIndex==myClub.clubID){
      colorBackground = Colors.redAccent;
    }

    return GestureDetector(
      onTap:(){
        Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: realClubIndex)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Container(
                width:35,
                padding: const EdgeInsets.only(left: 4.0),
                child: Text((ranking+1).toString()+'º',textAlign:TextAlign.end,style: EstiloTextoBranco.text14)
            ),
            Image.asset('assets/clubs/${FIFAImages().imageLogo(clubName)}.png',height: 30,width: 30),
            Expanded(
              child: Container(
                color: colorBackground,
                  padding: const EdgeInsets.all(4),
                  child: Text(clubName,style: EstiloTextoBranco.text20)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0,right: 28),
              child: Text(overall.toStringAsFixed(2),style: EstiloTextoBranco.text16),
            ),
          ],
        ),
      ),
    );
}

}