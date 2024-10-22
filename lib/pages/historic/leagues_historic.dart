import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/historic/historic_club_year.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/club_profile/all_infos_club_not_playable.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:fifa/widgets/league_selection_row.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/league_clubs.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/bottom_sheet/bottom_sheet_league_classification.dart';
import 'package:fifa/widgets/loader.dart';
import 'package:flutter/material.dart';

import '../../values/historic_champions/historic_champions.dart';

class HistoricLeague extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  final String chosenLeagueName;
  const HistoricLeague({Key? key, required this.chosenLeagueName}) : super(key: key);
  @override
  _HistoricLeagueState createState() => _HistoricLeagueState();
}

class _HistoricLeagueState extends State<HistoricLeague> {
  late Map<double,dynamic> results;
  late String chosenLeagueName;
  int nTeamsSelected = 0;
  bool isLoaded = false;
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState(){
    init();
    super.initState();
  }
  init() async{
    chosenLeagueName = widget.chosenLeagueName;
    results = await mapChampions(chosenLeagueName);
    isLoaded = true;
    setState((){});
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:  Container(
          decoration: Images().getWallpaperContainerDecoration(),
          child: isLoaded ? Column(
            children: [

              backButtonText(context, Translation(context).text.leagueHistoric, true),

              Container(
                color: appBarMyClubColor(),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    selectCategory('Resumo', 0),
                    selectCategory('G-1', 1),
                    selectCategory('G-2', 2),
                    selectCategory('G-4', 4),
                    selectCategory('G-10', 10),
                    selectCategory(Translation(context).text.all, 20),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              nTeamsSelected == 0 ? Container(
                color: AppColors().greyTransparent,
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Column(
                  children: [
                    for(int i = 1950; i<anoInicial;i+=10)
                      Row(
                        children: [
                          Text(i.toString(),style: EstiloTextoBranco.text14,),
                          rowChampions(i),
                          Text((i+9).toString(),style: EstiloTextoBranco.text14,),
                        ],
                      )
                  ],
                ),
              ) : Container(),

              nTeamsSelected == 0 
                  ? tableBestClubs()
                  : Container(),

              //TABELA
              nTeamsSelected>0 ? Expanded(
                child: nTeamsSelected>1 ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        for(int year=ano-1;year>=anoInicial;year--)
                          yearRow(year),

                        for(int year=ano-1;year> ano-(anoInicial-1950)-1;year--)
                          yearRowPast(year, results),
                      ],
                    ),
                  ),
                ) : SingleChildScrollView(
                  child: Column(
                    children: [

                      for(int year=ano-1;year>=anoInicial;year--)
                        yearRow(year),

                      for(int year=ano-1;year> ano-(anoInicial-1950)-1;year--)
                        yearRowPast(year, results),
                    ],
                  ),
                ),
              ) : Container(),

              ////////////////////////////////////
              //SELECT LEAGUE BOTTOM
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    LeagueSelectionRow(
                        chosenLeagueName: chosenLeagueName,
                        leaguesListRealIndex: leaguesListRealIndex,
                        onTap: (String leagueName) async{
                          chosenLeagueName = leagueName;
                          results = await mapChampions(chosenLeagueName);
                          setState(() {});
                        }
                    ),
                    for(String leagueName in LeagueOfficialNames().getAllLeagueNames())
                      countryFlagsSelectionBottomWidget2(
                          leagueName: leagueName,
                          chosenLeagueName: chosenLeagueName,
                          onTap: () async{
                                chosenLeagueName = leagueName;
                                results = await mapChampions(chosenLeagueName);
                                setState(() {});
                              }
                      ),

                  ],
                ),
              ),


            ],
          ) : loaderCircle(),
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget selectCategory(String title, int nteams){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      child: PressableButton(
        onTap: (){
          nTeamsSelected = nteams;
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: nTeamsSelected == nteams ? Colors.black : AppColors().greyTransparent,
            border: Border.all(
              color: nTeamsSelected == nteams ? AppColors().green : AppColors().greyTransparent,
              width: 1.0,
            ),
          ),
          child: Text(title, style: EstiloTextoBranco.text16),
        ),
      ),
    );
  }

  Widget yearRow(int year){
    int nRows = nTeamsSelected;

    if(!leaguesIndexFromName.containsKey(chosenLeagueName)){
      return Container();
    }

    League league = League(index: leaguesIndexFromName[chosenLeagueName]);
    if(league.nClubs < nTeamsSelected){
      nRows = league.nClubs;
    }

    return Column(
      children: [

        Text(year.toString(),style: EstiloTextoBranco.negrito16),
        const SizedBox(height: 8),
        for(int i=0;i<nRows;i++)
          validacaoSimulation(year,i),

      ],
    );
  }
  Widget validacaoSimulation(int year, int position){

  try{
    //Se a liga for simulavel
    List classification = HistoricFunctions().funcHistoricListAll(year, chosenLeagueName);
    int clubID = classification[position];

   Club club = Club(index: clubID);
    return classificationRow(position, club.name);
  }catch(e){
    //Se a liga não for atualizada(novos campeoes) pós simulações
    return Container();
  }

  }

  //////////////////////////////////////////
  //HISTORICOS PASSADOS
  Widget yearRowPast(int ano, Map resultsLeague){
    return Center(
      child: Column(
        children: [
          for(int position=0;position<nTeamsSelected;position++)
            validacao(position, ano, resultsLeague),
        ],
      ),
    );
  }
  Widget validacao(int position, int ano, Map resultsLeague){
    try {
      List yearData = results[ano.toDouble()];
      String clubName = yearData[position];
      if(position==0){
        return Column(
          children: [
            Text(ano.toString(),style: EstiloTextoBranco.negrito16),
            const SizedBox(height: 8),
            classificationRow(position,clubName),
            const SizedBox(height: 6),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                position+1 < 10
                    ? Text('  ${(position+1).toString()}º ',style: EstiloTextoBranco.text14)
                    : Text('${(position+1).toString()}º ',style: EstiloTextoBranco.text14),
                Images().getEscudoWidget(clubName,24,24),
              ],
            ),
            SizedBox(width:82,child: Center(child: Text(clubName,maxLines:1,overflow:TextOverflow.ellipsis,style: EstiloTextoBranco.text10))),
          ],
        ),
      );
  }

  ////////////////////////////////////////////////////////////////////////////
  Widget rowChampions(int year){
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
  Widget rowChampionsImage(int year){
    try{
      List yearData = [];
      late String clubName;
      if(year>=anoInicial){
        List classification = HistoricFunctions().funcHistoricListAll(year, chosenLeagueName);
        int clubID = classification[0];

        clubName = Club(index: clubID).name;
      }else{
        yearData = results[year.toDouble()];
        clubName = yearData[0];
      }
      return GestureDetector(
          onTap:() async{

            if(year>=anoInicial){
              List classificationNames = [];
              List classification = HistoricFunctions().funcHistoricListAll(year, chosenLeagueName);
              for (int clubID in classification) {
                String clubName = Club(index: clubID).name;
                classificationNames.add(clubName);
              }
              bottomSheetShowLeagueClassification(context, classificationNames, chosenLeagueName, year);
            }else{
              List classificationNames = results[year];
              bottomSheetShowLeagueClassification(context, classificationNames, chosenLeagueName, year);
            }
          },
          child: SizedBox(width:24, child: Images().getEscudoWidget(clubName,24,24)));
    }catch(e){
      return Container(width: 24);
    }
  }


  Widget leagueHistoric(String leagueName) {
    return GestureDetector(
      onTap: (){
        chosenLeagueName = leagueName;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 9),
        color: chosenLeagueName == leagueName ? AppColors().green : AppColors().greyTransparent,
        child: funcFlagsList(
                  getCountryFromLeague(leagueName), 35, 50
        ),
      ),
    );
  }

  rankBestClubs(){
    List<String> clubNames = [];
    //cast list<dynamic> to list<String>
    try{
      clubNames = List<String>.from(clubNameMap[chosenLeagueName].values.toList() as List);
    }catch(e){
      //O CLUBE NÃO É JOGÁVEL
    }
    Map mapClassification = results;
    mapClassification.forEach((key,value) {
      for(String name in value){
        if(!clubNames.contains(name)){
          clubNames.add(name);
        }
      }
    });
    return clubNames;
  }
  getClubPositions(String clubName) {
    Map positions = {};
    results.forEach((key,value) {
      List lista = value;
        if(value.contains(clubName)){
          if(positions[lista.indexOf(clubName)+1] == null){
            positions[lista.indexOf(clubName)+1] = 1;
          }else{
            positions[lista.indexOf(clubName)+1] += 1;
          }
        }
    });

    if(clubsAllNameList.contains(clubName)){
      int clubID = clubsAllNameList.indexOf(clubName);
      for(int year=anoInicial;year<ano;year++){
        try {
          List classification = HistoricFunctions().funcHistoricListAll(
              year, chosenLeagueName);
          if (positions[classification.indexOf(clubID) + 1] == null) {
            positions[classification.indexOf(clubID) + 1] = 1;
          } else {
            positions[classification.indexOf(clubID) + 1] += 1;
          }
        }catch(e){
          //O TIME É JOGAVEL, MAS A LIGA NAO
        }
      }
    }


    List positionsList = [];
    for(int i=1;i<=20;i++){
      if(positions[i] != null){
        positionsList.add(positions[i]);
      }else{
        positionsList.add(0);
      }
    }
    return positionsList;
  }
  List orderClubsRanking(){

    //MAP POINTS
    Map teamPoints = {};
    for (String name in rankBestClubs()){
      List positionsList = getClubPositions(name);
      double pontuacao = 0;
      for(int i=0; i<positionsList.length; i++){
        int positionTimes = positionsList[i];
        int position = i+1;
        pontuacao += ((1/position)*positionTimes);
        if(position == 1){pontuacao += 2*positionTimes;}
        else if(position == 2){pontuacao += 1*positionTimes;}
      }
      teamPoints[name] = pontuacao;
    }

    //SORT TEAMS IN ORDER
    List teams = teamPoints.keys.toList();
    List points = teamPoints.values.toList();

      for(int i=0;i<points.length-1;i++){
        for(int k=i;k<points.length;k++){
        if(points[k]>points[i]){
          var aux = points[i];points[i] = points[k];points[k] = aux;
          aux = teams[i];teams[i] = teams[k];teams[k] = aux;
        }
        }
      }
    return teams;
  }

  Widget tableBestClubs(){
    List<String> clubNames = rankBestClubs();
    List teams = orderClubsRanking();

    return Expanded(
      child: Container(
        color: AppColors().greyTransparent,
        margin: const EdgeInsets.only(top: 4, left: 4, right: 4),
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Best Clubs", style: EstiloTextoBranco.negrito16),
                const Spacer(),
                for (int i=1;i<=10;i++)
                  SizedBox(width:19.3,child: Text(i.toString()+"º",style: EstiloTextoBranco.negrito14)),
                const SizedBox(width: 8),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (String name in teams)
                        clubHistoric(name,clubNames.indexOf(name))
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
  Widget clubHistoric(String clubName, int index){
    List positions = getClubPositions(clubName);
    return GestureDetector(
      onTap: (){
        clickClub(clubName);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 2),
        color: ClubDetails().getColors(clubName).primaryColor.withOpacity(0.2),
        child: Row(
          children: [
            const SizedBox(width: 4),
            Images().getEscudoWidget(clubName,30,30),
            const SizedBox(width: 4),
            SizedBox(width:130,child: Text(clubName,style: EstiloTextoBranco.negrito14)),
            for (int i=0;i<10;i++)
              SizedBox(width:20,child: Text(" "+positions[i].toString(),style: EstiloTextoBranco.text14)),
          ],
        ),
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
