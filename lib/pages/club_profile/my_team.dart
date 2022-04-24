import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/geral/esquemas_taticos.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/jogador.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/club_profile/field_draggable.dart';
import 'package:fifa/pages/club_profile/field_static.dart';
import 'package:fifa/pages/club_profile/graphics.dart';
import 'package:fifa/pages/club_profile/my_team_all_infos.dart';
import 'package:fifa/popup/popup_player_info.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/widgets/button/button_return.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/field_size.dart';
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
    double _width = MediaQuery.of(context).size.width;
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
                              Text('Saldo: \$'+my.money.toStringAsFixed(2)+'mi', style: EstiloTextoBranco.text22),
                              Text('Overall: '+myClub.getOverall().toStringAsFixed(2), style: EstiloTextoBranco.text16),
                              Text('Média Idade: '+averageAge.toStringAsFixed(2), style: EstiloTextoBranco.text16),
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

                    const SizedBox(
                      height: 30,
                      child: TabBar(
                        tabs: [
                          Tab(text: 'Elenco',),
                          Tab(text: 'Histórico'),
                          Tab(text: 'Classificação'),
                        ],
                      ),
                    ),


                    Expanded(
                      child: TabBarView(
                        children: [
                          const FieldDraggable(),
                          ClubGraphics(club: myClub),
                          AllInfoClub(club: myClub),
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