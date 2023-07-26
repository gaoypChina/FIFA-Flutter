import 'package:fifa/classes/image_class.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:flutter/material.dart';

import 'controller/leagues_config_controller.dart';

class LeaguesConfiguration extends StatefulWidget {
  const LeaguesConfiguration({Key? key}) : super(key: key);

  @override
  State<LeaguesConfiguration> createState() => _LeaguesConfigurationState();
}

class _LeaguesConfigurationState extends State<LeaguesConfiguration> with TickerProviderStateMixin  {

  LeagueConfigController controller = LeagueConfigController();
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    createTab();
    super.initState();
  }
  createTab(){
    controller.tabController = TabController(vsync: this, length: 2);
    setState(() {});
  }
  @override
  void dispose() {
    //Cancelar o timer do envio de email
    controller.tabController.dispose();
    super.dispose();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Container(
          decoration: Images().getWallpaperContainerDecoration(),
          child: Column(
            children: [
              backButtonText(context, 'Trocar', true),

              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 35,
                      color: appBarMyClubColor(),
                      child: TabBar(
                        controller: controller.tabController,
                        indicatorColor: AppColors().green,
                        labelStyle: EstiloRajdhani.tabbar,
                        tabs: const [
                          Tab(text: 'nºtimes/nº rebaixados'),
                          Tab(text: 'Internacional'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TabBarView(
                          controller: controller.tabController,
                          children: [
                            leagues(),
                            leaguesInternational(),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget leagues(){
    return
        Column(
          children: [

            const Text('Nº Times    Nº Clubes rebaixados',style: EstiloTextoBranco.negrito16),
            Expanded(
              child: ListView.builder(
                  itemCount: controller.leagueNames.length,
                  itemBuilder: (c,i)=>leagueRow(i),
    ),
            ),
          ],
        );
  }
Widget leagueRow(int i){
  LeagueConfigIndividual leagueInfos = controller.getData(controller.leagueNames[i]);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Image.asset(FIFAImages().campeonatoLogo(leagueInfos.leagueName),width: 50,height: 50),

        IconButton(
          onPressed: (){leagueInfos.decreaseNTeams();setState((){});},
          icon: const Icon(Icons.arrow_left,color: Colors.white),
        ),
        Text(leagueInfos.nTeams.toString(),style: EstiloTextoBranco.negrito16),
        IconButton(
          onPressed: (){leagueInfos.increaseNTeams();setState((){});},
          icon: const Icon(Icons.arrow_right,color: Colors.white),
        ),

        IconButton(
          onPressed: (){leagueInfos.decreaseRelegated();setState((){});},
          icon: const Icon(Icons.arrow_left,color: Colors.white),
        ),
        Text(leagueInfos.nRelegated.toString(),style: EstiloTextoBranco.negrito16),
        IconButton(
          onPressed: (){leagueInfos.increaseRelegated();setState((){});},
          icon: const Icon(Icons.arrow_right,color: Colors.white),
        ),
        leagueInfos.nRelegated>0
            ? Image.asset(FIFAImages().campeonatoLogo(leagueInfos.relegatedLeagueName),width: 30,height: 30)
            : addRelegationLeague(),
      ],
    ),
  );
}

  leaguesInternational(){
    return Expanded(
      child: ListView.builder(
        itemCount: controller.leagueNames.length,
        itemBuilder: (c,i)=>leagueRowInternational(i),
      ),
    );
  }
  Widget leagueRowInternational(int i){
    LeagueConfigIndividual leagueInfos = controller.getData(controller.leagueNames[i]);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(FIFAImages().campeonatoLogo(leagueInfos.leagueName),width: 50,height: 50),

          IconButton(
            onPressed: (){setState((){});},
            icon: const Icon(Icons.arrow_left,color: Colors.white),
          ),
          Text(leagueInfos.nInternationalClassified.toString(),style: EstiloTextoBranco.negrito16),
          IconButton(
            onPressed: (){setState((){});},
            icon: const Icon(Icons.arrow_right,color: Colors.white),
          ),
          Image.asset(FIFAImages().campeonatoLogo(leagueInfos.internationalLeague),width: 30,height: 30)
        ],
      ),
    );
  }

  Widget addRelegationLeague(){
    return GestureDetector(
      onTap: (){
        customToast('Qual será a 2ª divisão?');
      },
      child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors().greyTransparent,
          ),
          child: const Icon(Icons.add,color: Colors.white)
      ),
    );
  }
}
