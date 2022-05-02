import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/esquemas_taticos.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/pages/club_profile/field_draggable.dart';
import 'package:fifa/pages/club_profile/graphics.dart';
import 'package:fifa/pages/club_profile/all_infos_club.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/widgets/button/button_return.dart';
import 'package:fifa/theme/textstyle.dart';
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
    for(int i=0; i<myClub.nJogadores; i++){
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

                    const SizedBox(height: 30),
                    Row(
                      children: [
                        //Escudo da Equipe
                        Image.asset(Images().getMyEscudo(),height: 80,width: 80),

                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${Translation(context).text.money}: \$'+my.money.toStringAsFixed(2)+'mi', style: EstiloTextoBranco.text22),
                              Text('${Translation(context).text.overall}: '+myClub.getOverall().toStringAsFixed(2), style: EstiloTextoBranco.text16),
                              Text('${Translation(context).text.avgAge}: '+averageAge.toStringAsFixed(2), style: EstiloTextoBranco.text16),
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

                    SizedBox(
                      height: 30,
                      child: TabBar(
                        tabs: [
                          Tab(text: Translation(context).text.cast),
                          Tab(text: Translation(context).text.historic),
                          Tab(text: Translation(context).text.allInfos),
                        ],
                      ),
                    ),


                    Expanded(
                      child: TabBarView(
                        children: [
                          FieldDraggable(notifyParent: notifyParent),
                          ClubGraphics(club: myClub),
                          AllInfosClub(notifyParent: notifyParent, club: myClub),
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

  notifyParent(){
    setState(() {});
  }
}