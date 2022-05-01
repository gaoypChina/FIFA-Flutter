import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/historic.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/historic/players_historic.dart';
import 'package:fifa/pages/historic/international_historic.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:flutter/material.dart';

import '../../values/historic_champions.dart';

class HistoricLeague extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const HistoricLeague({Key? key}) : super(key: key);
  @override
  _HistoricLeagueState createState() => _HistoricLeagueState();
}

class _HistoricLeagueState extends State<HistoricLeague> {

  int choosenLeagueIndex = My().campeonatoID;
  late League league;
  int nTeamsSelected = 4;
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    league = League(index: choosenLeagueIndex);

    return Scaffold(

        body:  Stack(
            children: [

              Images().getWallpaper(),

              Column(
                children: [

                  const SizedBox(height: 40),
                  Text(Translation(context).text.leagueHistoric,style: EstiloTextoBranco.text22),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        selectButton('1º', 1),
                        selectButton('G-2', 2),
                        selectButton('G-4', 4),
                        selectButton('G-10', 10),
                        selectButton(Translation(context).text.all, 20),
                      ],
                    ),
                  ),

                  //TABELA
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          for(int year=ano-1;year>=anoInicial;year--)
                            yearRow(year),

                          for(int year=ano-1;year>ano-60;year--)
                            yearRowPast(year),
                        ],
                      ),
                    ),
                  ),

                  ////////////////////////////////////
                  //SELECT LEAGUE
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                          for(int i=0;i<leaguesListRealIndex.length;i++)
                            leagueSelectionRow(i)
                      ],
                    ),
                  ),

                  //VOLTAR
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child:  customButtonContinue(
                        title: Translation(context).text.next,
                        function: (){
                          if(ano>anoInicial){
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const InternationalHistoric()));
                          }else{
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const PlayersHistoric()));
                          }
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

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget selectButton(String text,int nteams){
    return Column(
      children: [
        Text(text,style: EstiloTextoBranco.text16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              nTeamsSelected = nteams;
              setState(() {});
            },
            child: nTeamsSelected == nteams
                ? const Icon(Icons.radio_button_checked,color: Colors.white, size: 28)
                : const Icon(Icons.radio_button_off,color: Colors.white, size: 28),
          ),
        ),
      ],
    );
  }

  Widget yearRow(int year){
    int nRows = nTeamsSelected;
    if(league.nClubs < nTeamsSelected){
      nRows = league.nClubs;
    }
    return Column(
      children: [
        Text(year.toString(),style: EstiloTextoBranco.text16),

        for(int i=0;i<nRows;i++)
          classificationRow(year,i),

      ],
    );
  }
  Widget classificationRow(int year, int position){
    List classification = HistoricFunctions().funcHistoricListAll(year, league.name);
    int clubID = classification[position];

    Club club = Club(index: clubID);
    return Row(
      children: [
        position+1<10
            ? Text('  ${(position+1).toString()}- ',style: EstiloTextoBranco.text14)
            : Text('${(position+1).toString()}- ',style: EstiloTextoBranco.text14),
        Image.asset(Images().getEscudo(club.name),height: 20,width: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(club.name,style: EstiloTextoBranco.text14),
        ),
      ],
    );
  }

  //////////////////////////////////////////
  //HISTORICOS PASSADOS
  Widget yearRowPast(int ano){
    return Column(
      children: [
        for(int position=0;position<nTeamsSelected;position++)
          validacao(position, ano),
      ],
    );
  }
  Widget validacao(int position, int ano){
    try {
      Map<double,dynamic> results = mapChampions(league.name);
      List yearData = results[ano.toDouble()];
      String clubName = yearData[position];
      if(position == 0){
        return Column(
          children: [

            Text(ano.toString(),style: EstiloTextoBranco.text16),
            classificationPastRow(position,clubName),
          ],
        );
      }
      return classificationPastRow(position,clubName);
    }catch(e){
      return Container();
    }
  }
  Widget classificationPastRow(int position, String clubName){

   return Row(
     children: [
       position+1<10
           ? Text('  ${(position+1).toString()}- ',style: EstiloTextoBranco.text14)
           : Text('${(position+1).toString()}- ',style: EstiloTextoBranco.text14),
       Image.asset('assets/clubs/${FIFAImages().imageLogo(clubName)}.png',height: 20,width: 20),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 4.0),
         child: Text(clubName,style: EstiloTextoBranco.text14),
       ),
     ],
   );
  }
  Widget leagueSelectionRow(int i){
    int leagueID = leaguesListRealIndex[i];

    return GestureDetector(
      onTap: (){
        choosenLeagueIndex = leagueID;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        color: choosenLeagueIndex == leagueID ? Colors.redAccent: Colors.white54,
        child: Image.asset(FIFAImages().campeonatoLogo(leagueID),height: 50,width: 50,),
      ),
    );
  }

}
