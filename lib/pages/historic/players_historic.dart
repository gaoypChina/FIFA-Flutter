import 'package:fifa/classes/historic/top_players_ovr.dart';
import 'package:fifa/classes/historic/top_scorers.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';
import 'leagues_historic.dart';

class PlayersHistoric extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const PlayersHistoric({Key? key}) : super(key: key);
  @override
  _PlayersHistoricState createState() => _PlayersHistoricState();
}

class _PlayersHistoricState extends State<PlayersHistoric> {

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Container(
          decoration: Images().getWallpaperContainerDecoration(),
          child: Column(
            children: [

              const SizedBox(height: 50),

              Text(Translation(context).text.playersHistoric,style: EstiloTextoBranco.text22),
              const SizedBox(height: 8),


              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for(int year=anoInicial;year<ano;year++)
                        yearRowTopScorers(year),
                    ],
                  ),
                ),
              ),

              //VOLTAR
              Padding(
                padding: const EdgeInsets.all(6),
                child:  customButtonContinue(
                    title: Translation(context).text.next,
                    function: (){
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HistoricLeague()));
                    }
                ),
              ),
              //VOLTAR
              Padding(
                  padding: const EdgeInsets.all(6),
                  child:  customButtonContinue(
                      title: Translation(context).text.returnTo,
                      function: (){
                        Navigator.pop(context);
                      }
                  ),
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
      Image.asset(Images().getEscudo(clubName),height: 15,width: 15),
    ],
  );
}

///////////////////////////
  Widget yearRowTopScorers(int year){
    Map topScorersMap = TopScorers().getDataYear(year);
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Column(
        children: [
          Text('${Translation(context).text.topScorers} $year ${Translation(context).text.and} ${Translation(context).text.bestPlayers}',style: EstiloTextoBranco.text14),
          Row(
            children: [
              Column(
                children: [
                  for(int position=0;position<25 && position< topScorersMap.values.length;position++)
                    yearRowTopScorersRow(year,position)
                ],
              ),
              Column(
                children: [
                  for(int position=0;position<25 && position< topScorersMap.values.length;position++)
                    yearRowBestPlayersRow(year,position)
                ],
              ),
            ],
          )

        ],
      ),
    );
  }
  Widget yearRowTopScorersRow(int year, int position){
    TopScorers topScorers = TopScorers();
    topScorers.getInPosition(year, position);
    return             Row(
      children: [
        //Artilheiros
        Text('${(position+1).toString()}-',style: EstiloTextoBranco.text14),
        Image.asset(Images().getEscudo(topScorers.clubName),height: 20,width: 20),
        SizedBox(
          width:130,
          child: Text(topScorers.playerName,style: EstiloTextoBranco.text14),
        ),
        Text(topScorers.playerGoals.toString(),style: EstiloTextoBranco.text14),
        const SizedBox(width: 15),

      ],
    );
  }
}
Widget yearRowBestPlayersRow(int year, int position){
  TopPlayersOVR topPlayersOVR = TopPlayersOVR();
  topPlayersOVR.getInPosition(year, position);
  return Row(
    children: [

      //MELHORES JOGADORES DO MUNDO
      Text('${(position+1).toString()}-',style: EstiloTextoBranco.text14),
      Image.asset(Images().getEscudo(topPlayersOVR.clubName),height: 20,width: 20),
      SizedBox(
        width:130,
        child: Text(topPlayersOVR.playerName,style: EstiloTextoBranco.text14),
      ),
      Text(topPlayersOVR.playerOVR.toString(),style: EstiloTextoBranco.text14),
    ],
  );
}