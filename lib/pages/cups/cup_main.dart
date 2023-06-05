import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/pages/cups/tabs/cup_brackets.dart';
import 'package:fifa/pages/cups/tabs/cup_matchs.dart';
import 'package:fifa/pages/cups/tabs/cup_statistics.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:flutter/material.dart';

class CupMain extends StatefulWidget {
  const CupMain({Key? key}) : super(key: key);

  @override
  State<CupMain> createState() => _CupMainState();
}

class _CupMainState extends State<CupMain> with TickerProviderStateMixin{

  late TabController _tabController;
  Map<int, League> leaguesMap = {};
  late int choosenLeagueIndex;

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
    //initial value
    choosenLeagueIndex = leaguesMap[My().leagueID]!.index;
  }

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    String leagueName = leaguesMap[choosenLeagueIndex]!.name;
    String cupName = getCup(leagueName);

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
                    Tab(text: Translation(context).text.historic),
                    const Tab(text: 'Jogadores'),
                  ],
                ),

                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        cupPhaseWidget(context, cupName),
                        cupBrackets(context, cupName),
                        CupStatistics(cupName: cupName),
                      ],
                    ),
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
