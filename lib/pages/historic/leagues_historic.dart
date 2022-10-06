import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/historic.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/club_profile/all_infos_club_not_playable.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

import '../../values/historic_champions/historic_champions.dart';

class HistoricLeague extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final int choosenLeagueIndex;
  const HistoricLeague({Key? key, required this.choosenLeagueIndex}) : super(key: key);
  @override
  _HistoricLeagueState createState() => _HistoricLeagueState();
}

class _HistoricLeagueState extends State<HistoricLeague> {
  late Map<double,dynamic> results;
  late int choosenLeagueIndex;
  late String choosenLeagueName;
  int nTeamsSelected = 1;
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    choosenLeagueIndex = widget.choosenLeagueIndex;
    choosenLeagueName = League(index: choosenLeagueIndex).getName();
    super.initState();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    results = mapChampions(choosenLeagueName);

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

              nTeamsSelected == 1 ? Column(
                children: [
                  for(int i = 1960; i<anoInicial;i+=10)
                    Row(
                      children: [
                        Text(i.toString(),style: EstiloTextoBranco.text14,),
                        rowChampions(i),
                        Text((i+9).toString(),style: EstiloTextoBranco.text14,),
                      ],
                    )
                ],
              ) : Container(),

              //TABELA
              Expanded(
                child: nTeamsSelected>2 ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [

                      for(int year=ano-1;year>=anoInicial;year--)
                        yearRow(year),

                      for(int year=ano-1;year>ano-65;year--)
                        yearRowPast(year),
                    ],
                  ),
                ) : SingleChildScrollView(
                  child: Column(
                    children: [

                      for(int year=ano-1;year>=anoInicial;year--)
                        yearRow(year),

                      for(int year=ano-1;year>ano-65;year--)
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
                        leagueSelectionRow(i),
                    for(String leagueName in LeagueOfficialNames().getAllLeagueNames())
                      leagueHistoric(leagueName)
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

    League league = League(index: choosenLeagueIndex);
    results = mapChampions(league.name);
    if(league.nClubs < nTeamsSelected){
      nRows = league.nClubs;
    }

    return Column(
      children: [
        Text(year.toString(),style: EstiloTextoBranco.negrito16),

        for(int i=0;i<nRows;i++)
          validacaoSimulation(year,i),

      ],
    );
  }
  Widget validacaoSimulation(int year, int position){
    List classification = HistoricFunctions().funcHistoricListAll(year, choosenLeagueName);
    int clubID = classification[position];

    Club club = Club(index: clubID);
    return classificationRow(position, club.name);
  }

  //////////////////////////////////////////
  //HISTORICOS PASSADOS
  Widget yearRowPast(int ano){
    return Center(
      child: Column(
        children: [
          for(int position=0;position<nTeamsSelected;position++)
            validacao(position, ano),
        ],
      ),
    );
  }
  Widget validacao(int position, int ano){
    try {
      List yearData = results[ano.toDouble()];
      String clubName = yearData[position];
      if(position==0){
        return Column(
          children: [
            Text(ano.toString(),style: EstiloTextoBranco.negrito16),
            classificationRow(position,clubName),
          ],
        );
      }
      return classificationRow(position,clubName);
    }catch(e){
      return Container();
    }
  }

  ////////////////////////////////////////////////////////////////////////////
  Widget classificationRow(int position,String clubName){
    return GestureDetector(
      onTap: (){
        clickClub(clubName);
      },
      child: Row(
        children: [
          position+1<10
              ? Text('  ${(position+1).toString()}º ',style: EstiloTextoBranco.text14)
              : Text('${(position+1).toString()}º ',style: EstiloTextoBranco.text14),
          Images().getEscudoWidget(clubName,24,24),
          SizedBox(width:80,child: Text(clubName,maxLines:1,overflow:TextOverflow.ellipsis,style: EstiloTextoBranco.text10)),
        ],
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////
  Widget leagueSelectionRow(int i){
    int leagueID = leaguesListRealIndex[i];
    String leagueName = League(index: leagueID).getName();

    return GestureDetector(
      onTap: (){
        choosenLeagueIndex = leagueID;
        choosenLeagueName = leagueName;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        color: choosenLeagueName == leagueName ? Colors.redAccent: Colors.white54,
        child: Image.asset(FIFAImages().campeonatoLogo(leagueName),height: 50,width: 50,),
      ),
    );
  }


  rowChampions(int year){
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for(int i=0;i<10;i++)
            rowChampionsImage(year+i)
        ],
      ),
    );
  }
  rowChampionsImage(int year){
    try{
      List yearData = results[year.toDouble()];
      String clubName = yearData[0];
      return SizedBox(width:24, child: Images().getEscudoWidget(clubName,24,24));
    }catch(e){
      return Container(width: 24);
    }
  }


  Widget leagueHistoric(String leagueName) {
    return GestureDetector(
      onTap: (){
        choosenLeagueName = leagueName;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 9),
        color: choosenLeagueName == leagueName ? Colors.redAccent: Colors.white54,
        child: funcFlagsList(getCountryFromLeague(leagueName), 35, 50),
      ),
    );
  }

  ////////////////////////////////////////////////////////////////////////////
  clickClub(String clubName){
    //if(clubsAllNameList.contains(clubName)){
    //  int clubID = clubsAllNameList.indexOf(clubName);
    //  Navigator.push(context, MaterialPageRoute(builder: (context) => ClubProfile(clubID: clubID)));
    //}else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => ClubProfileNotPlayable(clubName: clubName)));
    //}
  }

}
