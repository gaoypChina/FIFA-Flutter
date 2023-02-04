import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/esquemas_taticos.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/pages/club_profile/all_infos_club.dart';
import 'package:fifa/pages/club_profile/all_infos_club_not_playable.dart';
import 'package:fifa/pages/club_profile/tabs/field_draggable.dart';
import 'package:fifa/pages/club_profile/tabs/graphics.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:fifa/widgets/button/button_continue.dart';
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
    doThisOnLaunch();
    super.initState();
  }
  doThisOnLaunch() {
    setAverageAge();
    setState(() {});
  }
  setAverageAge(){
    averageAge = 0;
    for(int i=0; i<my.jogadores.length; i++){
      averageAge += Jogador(index: my.jogadores[i]).age;
    }
    averageAge = averageAge / myClub.nJogadores;
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    myClub = Club(index: My().clubID);
    my = My();

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body:  Stack(
              children: [

                Images().getWallpaper(),

                Column(
                  children: [

                    //APPBAR
                    Container(
                      color: myClub.colors.primaryColor.withOpacity(0.3),
                      child: Row(
                        children: [
                          backButtonText(context, myClub.name),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top:20.0),
                            child: IconButton(onPressed: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfileNotPlayable(clubName: myClub.name)));
                            }, icon: const Icon(Icons.outbond_rounded,color: Colors.white,size: 32,)),
                          ),
                        ],
                      ),
                    ),

                    //HEADER
                    Container(
                      color: myClub.colors.primaryColor.withOpacity(0.3),
                      child: Row(
                        children: [
                          //Escudo da Equipe
                          Images().getMyEscudo(size: 80),

                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                starsWidgetFromOverall(myClub.getOverall()),
                                Text('${Translation(context).text.overall}: '+myClub.getOverall().toStringAsFixed(2), style: EstiloTextoBranco.negrito16),
                                Text('${Translation(context).text.avgAge}: '+averageAge.toStringAsFixed(2), style: EstiloTextoBranco.text14),
                                Text('${Translation(context).text.player}: '+myClub.nJogadores.toString(), style: EstiloTextoBranco.text14),
                              ],
                            ),
                          ),

                          Column(
                            children: [
                              //MUDAR ESQUEMA TATICO
                              customButtonContinue(
                                  title: my.esquemaTatico,
                                  function: (){
                                    EsquemaTatico().changeMyEsquema();
                                    setState(() {});
                                  }
                              ),
                            ],
                          ),



                        ],
                      ),
                    ),

                    Container(
                      height: 30,
                      color: myClub.colors.primaryColor.withOpacity(0.3),
                      child: TabBar(
                        unselectedLabelColor: Colors.white54,
                        labelColor: myClub.colors.secondColor,
                        indicatorColor: myClub.colors.secondColor,
                        tabs: [
                          Tab(text: Translation(context).text.cast),
                          Tab(text: Translation(context).text.allInfos),
                          Tab(text: Translation(context).text.historic),
                        ],
                      ),
                    ),


                    Expanded(
                      child: TabBarView(
                        children: [
                          FieldDraggable(notifyParent: notifyParent),
                          AllInfosClub(notifyParent: notifyParent, club: myClub),
                          ClubGraphics(club: myClub),
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

  notifyParent(){
    setState(() {});
  }
}