import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/pages/cups/cup_historic.dart';
import 'package:fifa/pages/cups/cup_matchs.dart';
import 'package:fifa/pages/cups/cup_statistics.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class CupMain extends StatefulWidget {
  const CupMain({Key? key}) : super(key: key);

  @override
  State<CupMain> createState() => _CupMainState();
}

class _CupMainState extends State<CupMain> with TickerProviderStateMixin{


  late TabController _tabController;
  Map leaguesMap = {};
  int choosenLeagueIndex = 1;

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    onInit();
    super.initState();
  }
  onInit(){
    //GET LEAGUES CLASSES
    for(int i=0;i<leaguesListRealIndex.length;i++){
      int leagueID = leaguesListRealIndex[i];
      leaguesMap[leagueID] = League(index: leaguesListRealIndex[i]);
    }
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [

            Images().getWallpaper(),

            Column(
              children: [

                backButtonText(context,'Cup'),

                TabBar(
                  controller: _tabController,
                  indicatorColor: AppColors().primary,
                  tabs: [
                    const Tab(text: 'Partidas'),
                    const Tab(text: 'Jogadores'),
                    Tab(text: Translation(context).text.historic),
                  ],
                ),

                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      cupPhaseWidget(),
                      cupStatistics(),
                      cupHistoric(context),
                    ],
                  ),
                ),

                ////////////////////////////////////
                //SELECT LEAGUE
                selectLeagueWidget(leaguesMap)

              ],
            ),


          ],
        ),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

  Widget selectLeagueWidget(Map leaguesMap){
    return              SizedBox(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for(int i=0;i<leaguesListRealIndex.length;i++)
              leagueRow(leaguesMap[leaguesListRealIndex[i]])
          ],
        ),
      ),
    );
  }
  Widget leagueRow(League league){
    return GestureDetector(
      onTap: (){
        choosenLeagueIndex = league.index;
        setState((){});
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        color: choosenLeagueIndex == league.index ? Colors.redAccent: Colors.white54,
        child: Image.asset(FIFAImages().campeonatoLogo(league.name),height: 50,width: 50,),
      ),
    );
  }

}
