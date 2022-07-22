import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/historic.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
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
  int nTeamsSelected = 2;
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    league = League(index: choosenLeagueIndex);

    return Scaffold(
        body:  Container(
          decoration: Images().getWallpaperContainerDecoration(),
          child: Column(
            children: [

              backButtonText(context, Translation(context).text.leagueHistoric),

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
                child: nTeamsSelected>2 ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [

                      for(int year=ano-1;year>=anoInicial;year--)
                        yearRow(year),

                      for(int year=ano-1;year>ano-60;year--)
                        yearRowPast(year),
                    ],
                  ),
                ) : SingleChildScrollView(
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


            ],
          ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
      crossAxisAlignment: CrossAxisAlignment.start,
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

            Text(ano.toString(),style: EstiloTextoBranco.negrito16),
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

   return GestureDetector(
     onTap: (){
       if(clubsAllNameList.contains(clubName)){
         int clubID = clubsAllNameList.indexOf(clubName);
         Navigator.push(context, MaterialPageRoute(builder: (context) => ClubProfile(clubID: clubID)));
       }
     },
     child: Row(
       children: [
         position+1<10
             ? Text('  ${(position+1).toString()}º ',style: EstiloTextoBranco.text14)
             : Text('${(position+1).toString()}º ',style: EstiloTextoBranco.text14),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Images().getEscudoWidget(clubName,24,24),
             Container(width:100,child: Text(clubName,maxLines:1,overflow:TextOverflow.ellipsis,style: EstiloTextoBranco.text10)),
           ],
         ),
       ],
     ),
   );
  }
  Widget leagueSelectionRow(int i){
    int leagueID = leaguesListRealIndex[i];
    String leagueName = League(index: leagueID).getName();

    return GestureDetector(
      onTap: (){
        choosenLeagueIndex = leagueID;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        color: choosenLeagueIndex == leagueID ? Colors.redAccent: Colors.white54,
        child: Image.asset(FIFAImages().campeonatoLogo(leagueName),height: 50,width: 50,),
      ),
    );
  }

}
