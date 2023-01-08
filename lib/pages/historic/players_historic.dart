import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/historic/top_players_ovr.dart';
import 'package:fifa/classes/historic/top_scorers.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/club_profile/field_static.dart';
import 'package:fifa/theme/background/background_overall.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:fifa/widgets/button/dropdown_button.dart';
import 'package:flutter/material.dart';

class PlayersHistoric extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const PlayersHistoric({Key? key}) : super(key: key);
  @override
  _PlayersHistoricState createState() => _PlayersHistoricState();
}

class _PlayersHistoricState extends State<PlayersHistoric> {

  List<String> possibleYears = [];
  String selectedYearStr = (ano-1).toString();
  int selectedYear = ano-1;
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    initialSelectedYear();
    super.initState();
  }
  initialSelectedYear(){
    possibleYears = [];
    for(int year=anoInicial;year<ano;year++){
      possibleYears.add(year.toString());
      selectedYearStr = possibleYears.last;
    }
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    Map topScorersMap = TopScorers().getDataYear(selectedYear);
    selectedYear = int.parse(selectedYearStr);

    return Scaffold(
        body:  Container(
          decoration: Images().getWallpaperContainerDecoration(),
          width: Sized(context).width,
          child: Column(
            children: [
              backButtonText(context, Translation(context).text.playersHistoric),

              const SizedBox(height: 8),

              dropDownButton(
                  selectedYearStr: selectedYearStr,
                  possibleYears: possibleYears,
                  setStateFunc: (value){
                    selectedYearStr = value.toString();
                    setState(() {});
                  }),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(Translation(context).text.topScorers,style: EstiloTextoBranco.negrito18),
                  Text(Translation(context).text.bestPlayers,style: EstiloTextoBranco.negrito18),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                for(int position=0;position<25 && position< topScorersMap.values.length;position++)
                                  yearRowTopScorersRow(position),
                              ],
                            ),

                            Column(
                              children: [
                                for(int position=0;position<25 && position< topScorersMap.values.length;position++)
                                  yearRowBestPlayersRow(position),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              const Text('Seleção do ano',style: EstiloTextoBranco.negrito18),
              const SizedBox(
                  height: 342,
                  child: StaticField(clubID: 13,hasReserves: false),
              ),



            ],
          ),
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget myPlayersHistoricRow(int index){
    int ano = index + anoInicial;
    int position = -1;
    String clubName = '';
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(ano.toString()+': '+position.toString()+'º - '+clubName,style: EstiloTextoBranco.text14),
      Images().getEscudoWidget(clubName,15,15),
    ],
  );
}

////////////////////////////////////////////////////
  Widget yearRowTopScorersRow(int position){
    TopScorers topScorers = TopScorers();
    topScorers.getInPosition(selectedYear, position);
    return             Row(
      children: [
        //Artilheiros
        SizedBox(width:25,child:Text('${(position+1).toString()}-',style: EstiloTextoBranco.text14)),
        Images().getEscudoWidget(topScorers.clubName,20,20),
        SizedBox(
          width:120,
          child: Text(topScorers.playerName,style: EstiloTextoBranco.text14),
        ),
        Text(topScorers.playerGoals.toString(),style: EstiloTextoBranco.text14),
        const SizedBox(width: 15),

      ],
    );
  }

Widget yearRowBestPlayersRow(int position){
  TopPlayersOVR topPlayersOVR = TopPlayersOVR();
  topPlayersOVR.getInPosition(selectedYear, position);
  return Row(
    children: [
      //MELHORES JOGADORES DO MUNDO
      SizedBox(width:25,child: Text('${(position+1).toString()}-',style: EstiloTextoBranco.text14)),
      Container(
          color: colorOverallBackground(topPlayersOVR.playerOVR),
          padding: const EdgeInsets.all(2),
          child: Text(topPlayersOVR.playerOVR.toString(),style: EstiloTextoPreto.text14)
      ),
      Images().getEscudoWidget(topPlayersOVR.clubName,20,20),
      SizedBox(
        width:120,
        child: Text(topPlayersOVR.playerName,style: EstiloTextoBranco.text14),
      ),

    ],
  );
}
}