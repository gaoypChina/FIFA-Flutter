import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/data_graphics.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/pages/club_profile/all_infos_club.dart';
import 'package:fifa/pages/club_profile/all_infos_club_not_playable.dart';
import 'package:fifa/pages/club_profile/tabs/club_calendar.dart';
import 'package:fifa/pages/club_profile/compare.dart';
import 'package:fifa/pages/club_profile/tabs/field_static.dart';
import 'package:fifa/pages/club_profile/tabs/geral.dart';
import 'package:fifa/pages/club_profile/tabs/graphics.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/stars.dart';
import 'package:flutter/material.dart';

class ClubProfile extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final int clubID;
  const ClubProfile({Key? key, required this.clubID}) : super(key: key);
  @override
  _ClubProfileState createState() => _ClubProfileState();
}

class _ClubProfileState extends State<ClubProfile> with TickerProviderStateMixin {


  late Club clubClass;
  late TabController _tabController;
  DataGraphics dataGraphics = DataGraphics();

  ///////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
    clubClass = Club(index: widget.clubID);
    dataGraphics.getData(clubClass);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    clubClass = Club(index: widget.clubID);

    return DefaultTabController(
      length: 5,
      child: Scaffold(

          body:  Stack(
              children: [

                Images().getWallpaper(),
                
                Column(
                  children: [

                    //APPBAR
                    Container(
                      color: clubClass.colors.primaryColor.withOpacity(0.3),
                      child: Row(
                        children: [
                          backButtonText(context, clubClass.name),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top:20.0),
                            child: IconButton(onPressed: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfileNotPlayable(clubName:clubClass.name)));
                            }, icon: const Icon(Icons.outbond_rounded,color: Colors.white,size: 32,)),
                          )
                        ],
                      ),
                    ),

                    //HEADER
                    Container(
                      color: clubClass.colors.primaryColor.withOpacity(0.3),
                      child: Row(
                        children: [
                          //Escudo da Equipe
                          Images().getEscudoWidget(clubClass.name,70,70),

                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  children: [
                                    Text(clubClass.getOverall().toStringAsFixed(2), style: EstiloTextoBranco.negrito22),
                                    const SizedBox(width: 4),
                                    const Text('Valor:',style: EstiloTextoBranco.text12),
                                    Text(' \$' + clubClass.getClubValue().toStringAsFixed(2),style: EstiloTextoBranco.negrito14),
                                  ],
                                ),
                                starsWidgetFromOverall(clubClass.getOverall()),compare(),
                              ],
                            ),
                          ),

                          Column(
                            children: [

                              funcFlagsList(clubClass.nationality, 20, 30),

                              //CLASSIFICAÇÃO ATUAL
                              Stack(
                                children: [
                                  Opacity(opacity:0.3,child: Image.asset(FIFAImages().campeonatoLogo(clubClass.leagueName),height: 50,width: 50)),
                                  Container(
                                      width:50,height:50,
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(dataGraphics.currentPosition.toString() + 'º',textAlign:TextAlign.center,style: EstiloTextoBranco.negrito22)),
                                ],
                              ),
                            ],
                          ),


                          const SizedBox(width: 8),

                        ],
                      ),
                    ),

                    Container(
                      height: 30,
                      color: clubClass.colors.primaryColor.withOpacity(0.3),
                      child: TabBar(
                        isScrollable: true,
                        controller: _tabController,
                        unselectedLabelColor: Colors.white54,
                        labelColor: clubClass.colors.secondColor,
                        indicatorColor: clubClass.colors.secondColor,
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
                        controller: _tabController,
                        children: [
                          StaticField(clubID: widget.clubID,hasReserves: true,),
                          AllInfosClub(club: clubClass, notifyParent: notifyParent),
                          ClubGraphics(club: clubClass),
                          ClubCalendar(club: clubClass),
                          ClubGeralInfosPage(club: clubClass),
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

  Widget compare(){
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => Compare(club: clubClass)));
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors().greyTransparent,
            border: Border.all(color: AppColors().green, width: 1),
          ),
          padding: const EdgeInsets.all(4.0),
          child: const Text('Comparar',style: EstiloTextoBranco.text16),
        ),
      ),
    );
  }

  notifyParent(){
    setState(() {});
  }

}