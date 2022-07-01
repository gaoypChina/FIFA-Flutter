import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/functions/func_number_clubs_total.dart';
import 'package:fifa/page_controller/ranking_clubs_control.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import '../widgets/loader.dart';
import 'club_profile/club_profile.dart';

class RankingClubs extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const RankingClubs({Key? key}) : super(key: key);
  @override
  _RankingClubsState createState() => _RankingClubsState();
}

class _RankingClubsState extends State<RankingClubs> with TickerProviderStateMixin  {

  int numberClubsTotal = funcNumberClubsTotal();
  My myClub = My();
  RankingClubsControl rankingClubs = RankingClubsControl();
  late TabController _tabController;
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
    rankingClubs.organizeRanking();
    rankingClubs.organizeMyNationalRanking();
    rankingClubs.organizeMyContinentalRanking();

    _tabController = TabController(vsync: this, length: 3);
    isLoaded=true;
    setState(() {});
  }
  @override
  void dispose() {
    //Cancelar o timer do envio de email
    _scrollController.dispose();
    _tabController.dispose();
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

              isLoaded ? DefaultTabController(
                length: 3,
                child: Column(
                  children: [

                    backButtonText(context, 'Ranking'),
                    SizedBox(
                      height: 30,
                      child: TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(text: Translation(context).text.rankingGlobalClubs),
                          Tab(text: Translation(context).text.rankingContinentalClubs),
                          Tab(text: Translation(context).text.rankingNationalClubs),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          listRanking(rankingClubs.copyClubsName),
                          listRanking(rankingClubs.copyClubsNameContinental),
                          listRanking(rankingClubs.copyClubsNameNational),
                        ],
                      ),
                    ),



                  ],
                ),
              ) : loader(),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget listRanking(List listClubs){
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black],
          stops: [0.97, 1.0], // 10% purple, 80% transparent, 10% purple
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: DraggableScrollbar.semicircle(
        alwaysVisibleScrollThumb: true,
        controller: _scrollController,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            controller: _scrollController,
            itemCount: listClubs.length,
            itemBuilder: (c,i) => rowClub(i, listClubs[i])
        ),
      ),
    );
  }

Widget rowClub(int ranking, String clubName){

    int realClubIndex = clubsAllNameList.indexOf(clubName);
    Club club = Club(index: realClubIndex);
    double overall = club.getOverall();

    //Cor de Fundo
    Color colorBackground = Colors.transparent;
    List listClubsID = League(index: myClub.campeonatoID).getAllClubsIDList();

    if(listClubsID.contains(club.index)){
      colorBackground = Colors.blue;
    }
    if(club.index==myClub.clubID){
      colorBackground = Colors.redAccent;
    }

    return GestureDetector(
      onTap:(){
        Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: club.index)));
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
            funcFlagsList(club.nationality, 15, 22),
            Image.asset(Images().getEscudo(club.name),height: 32,width: 32),
            Expanded(
              child: Container(
                color: colorBackground,
                  padding: const EdgeInsets.all(4),
                  child: Text(club.name,style: EstiloTextoBranco.text20)
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