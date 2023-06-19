import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/pages/cups/tabs/cup_brackets.dart';
import 'package:fifa/pages/cups/tabs/cup_matchs.dart';
import 'package:fifa/pages/cups/tabs/cup_statistics.dart';
import 'package:fifa/widgets/league_selection_row.dart';
import 'package:fifa/theme/colors.dart';
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
  late String chosenLeagueName;

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
    chosenLeagueName = leaguesMap[My().leagueID]!.name;
  }

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    String cupName = getCup(chosenLeagueName);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [

            Images().getWallpaper(),

            Column(
              children: [

                backButtonText(context,'Cup', true),

                Container(
                  color: appBarMyClubColor(),
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: AppColors().green,
                    tabs: const [
                      Tab(text: 'Partidas'),
                      Tab(text: 'Brackets'),
                      Tab(text: 'Jogadores'),
                    ],
                  ),
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

                LeagueSelectionRow(
                    chosenLeagueName: chosenLeagueName,
                    leaguesListRealIndex: leaguesListRealIndex,
                    onTap: (String leagueName){
                      chosenLeagueName = leagueName;
                      setState(() {});
                    }
                ),

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


}
