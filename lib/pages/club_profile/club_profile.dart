import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/club_profile/field_static.dart';
import 'package:fifa/pages/club_profile/graphics.dart';
import 'package:fifa/pages/club_profile/all_infos_club.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button_return.dart';
import 'package:fifa/theme/textstyle.dart';
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

  ///////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
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

    return DefaultTabController(
      length: 3,
      child: Scaffold(

          body:  Stack(
              children: [

                Images().getWallpaper(),
                
                Column(
                  children: [

                    const SizedBox(height: 30),

                    Row(
                      children: [
                        //Escudo da Equipe
                        Image.asset(Images().getEscudo(clubClass.name),height: 80,width: 80),

                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${Translation(context).text.overall}: '+clubClass.getOverall().toStringAsFixed(2), style: EstiloTextoBranco.text16),
                              Text('${Translation(context).text.avgAge}: '+clubClass.getAverageAge().toStringAsFixed(2), style: EstiloTextoBranco.text16),
                            ],
                          ),
                        ),

                        Image.asset(Images().getStadium(clubClass.name),height: 80,width: 100),
                        const SizedBox(width: 8),

                      ],
                    ),

                    SizedBox(
                      height: 30,
                      child: TabBar(
                        controller: _tabController,
                        tabs: [
                          Tab(text: Translation(context).text.cast),
                          Tab(text: Translation(context).text.historic),
                          Tab(text: Translation(context).text.allInfos),
                        ],
                      ),
                    ),

                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          StaticField(clubID: widget.clubID),
                          ClubGraphics(club: clubClass),
                          AllInfosClub(club: clubClass,notifyParent: (){},),
                        ],
                      ),
                    ),
                    


                  ],
                ),

                //BOTAO DE VOLTAR
                returnButton(context),

              ]
          ),
      ),
    );
  }



}