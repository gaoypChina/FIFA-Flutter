import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:flutter/material.dart';

import 'controller/leagues_config_controller.dart';

class LeaguesConfiguration extends StatefulWidget {
  const LeaguesConfiguration({Key? key}) : super(key: key);

  @override
  State<LeaguesConfiguration> createState() => _LeaguesConfigurationState();
}

class _LeaguesConfigurationState extends State<LeaguesConfiguration> {

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
  }
  createTab(){
    setState(() {});
  }
  @override
  void dispose() {
    super.dispose();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: Images().getWallpaperContainerDecoration(),
        child: Column(
          children: [
            backButtonText(context, 'Trocar', true),

            Expanded(
              child: Column(
                children: [

                  nationalInfos("Premier League"),
                  interInfos(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget nationalInfos(String leagueName){

    List clubs = League(index: leaguesIndexFromName[leagueName]).allClubsName;
    LeagueConfigIndividual leagueInfos = LeagueConfigIndividual(leagueName);

    return Container(
      decoration: BoxDecoration(
        color: AppColors().greyTransparent,
      ),
      child: Column(
        children: [

          Text(leagueName,style: EstiloTextoBranco.negrito20),
          Images().getLeagueLogo(leagueName, 50, 50),
          for (int i=0;i<clubs.length;i++)
            Images().getEscudoWidget(clubs[i], 25, 25),

          const Text("Teams", style: EstiloTextoBranco.negrito16),
          Row(
            children: [
              IconButton(
                onPressed: (){setState((){});},
                icon: const Icon(Icons.arrow_left,color: Colors.white),
              ),
              Text(leagueInfos.nTeams.toString(),style: EstiloTextoBranco.negrito16),
              IconButton(
                onPressed: (){setState((){});},
                icon: const Icon(Icons.arrow_right,color: Colors.white),
              ),
            ],
          ),
          const Text("Relegated", style: EstiloTextoBranco.negrito16),
          Row(
            children: [
              IconButton(
                onPressed: (){setState((){});},
                icon: const Icon(Icons.arrow_left,color: Colors.white),
              ),
              Text(leagueInfos.nRelegated.toString(),style: EstiloTextoBranco.negrito16),
              IconButton(
                onPressed: (){setState((){});},
                icon: const Icon(Icons.arrow_right,color: Colors.white),
              ),
            ],
          ),

          Text(leagueInfos.nInternationalClassified.toString(),style: EstiloTextoBranco.negrito16),
          Image.asset(FIFAImages().campeonatoLogo(leagueInfos.internationalLeague),width: 30,height: 30)

        ],
      ),
    );
  }

  Widget interInfos(){
    return Container();
  }

}
