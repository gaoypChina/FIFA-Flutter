import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/data_graphics.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/pages/club_profile/all_infos_club.dart';
import 'package:fifa/pages/club_profile/all_infos_club_not_playable.dart';
import 'package:fifa/pages/club_profile/club_calendar.dart';
import 'package:fifa/pages/club_profile/compare.dart';
import 'package:fifa/pages/club_profile/field_static.dart';
import 'package:fifa/pages/club_profile/graphics.dart';
import 'package:fifa/theme/decoration/black_decoration.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/widgets/back_button.dart';
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
    _tabController = TabController(vsync: this, length: 4);
    super.initState();
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
    dataGraphics.getData(clubClass);

    return DefaultTabController(
      length: 4,
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
                          Images().getEscudoWidget(clubClass.name,80,80),

                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                starsWidgetFromOverall(clubClass.getOverall()),
                                Text('${Translation(context).text.overall}: '+clubClass.getOverall().toStringAsFixed(2), style: EstiloTextoBranco.negrito16),
                                Text('${Translation(context).text.avgAge}: '+clubClass.getAverageAge().toStringAsFixed(2), style: EstiloTextoBranco.text14),
                                Text('${Translation(context).text.player}: '+clubClass.nJogadores.toString(), style: EstiloTextoBranco.text14),
                                compare(),
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
                        controller: _tabController,
                        unselectedLabelColor: Colors.white54,
                        labelColor: clubClass.colors.secondColor,
                        indicatorColor: clubClass.colors.secondColor,
                        tabs: [
                          Tab(text: Translation(context).text.cast),
                          Tab(text: Translation(context).text.allInfos),
                          Tab(text: Translation(context).text.historic),
                          Tab(text: Translation(context).text.calendar),
                        ],
                      ),
                    ),

                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          StaticField(clubID: widget.clubID,hasReserves: true,),
                          AllInfosClub(club: clubClass,notifyParent: (){}),
                          ClubGraphics(club: clubClass),
                          ClubCalendar(club: clubClass),
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
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => Compare(club: clubClass)));
      },
      child: Container(
        decoration: blackDecoration(),
        padding: const EdgeInsets.all(4.0),
        child: const Text('Comparar',style: EstiloTextoBranco.text16),
      ),
    );
  }

}