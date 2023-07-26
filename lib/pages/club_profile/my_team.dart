import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/club_profile/all_infos_club.dart';
import 'package:fifa/pages/club_profile/all_infos_club_not_playable.dart';
import 'package:fifa/pages/club_profile/compare.dart';
import 'package:fifa/pages/club_profile/tabs/club_calendar.dart';
import 'package:fifa/pages/club_profile/tabs/field_draggable.dart';
import 'package:fifa/pages/club_profile/tabs/geral.dart';
import 'package:fifa/pages/club_profile/tabs/graphics.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/button_border_green.dart';
import 'package:fifa/widgets/stars.dart';
import 'package:flutter/material.dart';

import '../../classes/my.dart';

class MyTeam extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const MyTeam({Key? key}) : super(key: key);
  @override
  _MyTeamState createState() => _MyTeamState();
}

class _MyTeamState extends State<MyTeam> {

  Club myClub = Club(index: My().clubID);
  My my = My();

  String show = 'OVR';
  late double averageAge;

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    my = My();
    myClub = Club(index: my.clubID);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
          body:  Stack(
              children: [

                Images().getWallpaper(),

                Column(
                  children: [

                    //APPBAR
                    appBar(),

                    header(),

                    Container(
                      height: 30,
                      color: myClub.colors.primaryColor.withOpacity(0.3),
                      child: TabBar(
                        unselectedLabelColor: Colors.white54,
                        labelColor: myClub.colors.secondColor,
                        indicatorColor: myClub.colors.secondColor,
                        labelStyle: EstiloRajdhani.tabbar,
                        tabs: [
                          Tab(text: Translation(context).text.cast),
                          Tab(text: Translation(context).text.allInfos),
                          Tab(text: Translation(context).text.historic),
                          Tab(text: Translation(context).text.calendar),
                          const Tab(text: "Geral"),
                        ],
                      ),
                    ),


                    Expanded(
                      child: TabBarView(
                        children: [
                          FieldDraggable(notifyParent: notifyParent),
                          AllInfosClub(notifyParent: notifyParent, club: myClub),
                          ClubGraphics(club: myClub),
                          ClubCalendar(club: myClub),
                          ClubGeralInfosPage(club: myClub),
                        ],
                      ),
                    ),


                  ],
                ),

              ]
          ),
      ),
    );
  }

  Widget appBar(){
    return Container(
      color: myClub.colors.primaryColor.withOpacity(0.3),
      child: Row(
        children: [

          backButtonText(context, myClub.name),

          //OPEN CLUB PROFILE 2
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: IconButton(onPressed: (){
              navigatorPush(context, ClubProfileNotPlayable(clubName: myClub.name));
            }, icon: const Icon(Icons.outbond_outlined,color: Colors.white,size: 32,)),
          ),

        ],
      ),
    );
  }

  Widget header(){
    return                     //HEADER
      Container(
        color: myClub.colors.primaryColor.withOpacity(0.3),
        child: Row(
          children: [
            //Escudo da Equipe
            Images().getMyEscudo(size: 70),

            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(myClub.getOverall().toStringAsFixed(2), style: EstiloTextoBranco.negrito22),
                      const SizedBox(width: 4),
                      const Text('Valor:',style: EstiloTextoBranco.text12),
                      Text(' \$' + myClub.getClubValue().toStringAsFixed(2),style: EstiloTextoBranco.negrito14),
                    ],
                  ),
                  starsWidgetFromOverall(myClub.getOverall()),

                ],
              ),
            ),

            ButtonBorderGreen4(
                onTap: (){
                  navigatorPush(context, Compare(club: myClub));
                },
                child: const Text("Comparar", style: EstiloTextoBranco.text16)
            ),

          ],
        ),
      );
  }

  notifyParent(){
    setState(() {});
  }
}
