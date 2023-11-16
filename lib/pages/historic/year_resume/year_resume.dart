import 'package:fifa/classes/countries/countries_continents.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/historic/historic_champions_league.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/historic/year_resume/widgets/current_leagues_resume.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/historic_champions/historic_champions.dart';
import 'package:fifa/values/league_divisions.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/bottom_sheet/bottom_sheet_league_classification.dart';
import 'package:fifa/widgets/button/dropdown_button.dart';
import 'package:flutter/material.dart';

class YearResume extends StatefulWidget {
  const YearResume({Key? key}) : super(key: key);

  @override
  State<YearResume> createState() => _YearResumeState();
}

class _YearResumeState extends State<YearResume> {

  List<String> possibleYears = [];
  String selectedYear = anoInicial.toString();
  Map results = {};
  Map resultsCup = {};
  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    for(int i=1950;i<=ano;i++){
      possibleYears.add(i.toString());
    }
    super.initState();
  }
  Future getClassificationNames() async{
    for(String leagueName in LeagueOfficialNames().getAllLeagueNames()){
      customToast("Loading $leagueName");
      await hasHistoric(leagueName);
    }
    setState((){});
  }
  Future hasHistoric(String leagueName) async{
    List classificationNames = [];
    try {
      Map map = await mapChampions(leagueName);
      classificationNames = map[double.parse(selectedYear)];
      results[leagueName] = classificationNames;
    }catch(e){
      //print('LIGA $leagueName não tem histórico de classificação nesse ano);
    }

    //CUP WINNERS
    List<String> cupClassification = [];
    try {
      if(Divisions().is1stDivision(leagueName)) {
        String cupName = getCup(leagueName);
        Map map = await mapChampions(cupName);
        cupClassification = map[double.parse(selectedYear)];
        results[cupName] = cupClassification;
      }
    }catch(e){
      //print('COPA $leagueName não tem histórico de classificação nesse ano);
    }

  }
  Future<List> internChampions(String internationalLeagueName) async{
    late String team1;
    late String team2;
    late List clubsID;

    if(int.parse(selectedYear) > anoInicial) {
      clubsID = HistoricChampionsLeague().getFinalClubsIDOrdered(int.parse(selectedYear), internationalLeagueName);
      team1 = clubsAllNameList[clubsID[0]];
      team2 = clubsAllNameList[clubsID[1]];
    }else{
      try {
        Map allClassifications = await mapChampions(internationalLeagueName);
        clubsID = allClassifications[double.parse(selectedYear)];
        team1 = clubsID[0];
        team2 = clubsID[1];
      }catch(e){
        //
      }
    }
    return [team1, team2];
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    print(results);
    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Column(
            children: [

              appBar(),

              //int.parse(selectedYear) < anoInicial ?  SingleChildScrollView(
              //    scrollDirection: Axis.horizontal,
              //    child: internationalChampionsSelection(),
              //  ) : Container(),



              int.parse(selectedYear) >= anoInicial ? Expanded(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                      childAspectRatio: 5,
                    ),
                  itemCount: leaguesListRealIndex.length,
                  itemBuilder: (c,index)=> CurrentLeagueResume(
                                                selectedYear: selectedYear,
                                                leagueName: League(index: leaguesListRealIndex[index]).name
                                    )
              ),
              ) : Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for(String leagueName in results.keys)
                        leagueHistoric(leagueName, results[leagueName], results)
                    ],
                  ),
                ),
              ),




            ],
          ),


        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget appBar(){
    return Container(
      color: ClubDetails().getColors(My().clubName).primaryColor.withOpacity(0.3),
      child: Row(
        children: [
          backButtonText(context, 'Resumo do ano', false),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(top: 30.0),
            child: dropDownButton(
                selectedYearStr: selectedYear,
                possibleYears: possibleYears,
                setStateFunc: (value) async{
                  selectedYear = value.toString();
                  await getClassificationNames();
                  setState(() {});
                }),
          ),

        ],
      ),
    );
  }

  Widget leagueHistoric(String leagueName, List classificationNames, Map results) {
    String countryName = getCountryFromLeague(leagueName);
    List cupClassification = [];
    try {
      if(Divisions().is1stDivision(leagueName)){
        cupClassification = results[getCup(leagueName)];
      }
    }catch(e){
      cupClassification = [];
    }

    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: AppColors().greyTransparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
          children: [
            const SizedBox(width: 10),
            GestureDetector(
              onTap: (){
                bottomSheetShowLeagueClassification(context, classificationNames, leagueName);
              },
              child: Row(
                children: [

                  Images().getContinentLogo(Continents().funcCountryContinents(countryName), 20, 20),
                  const SizedBox(width: 8),
                  funcFlagsList(countryName, 18, 26),
                  const SizedBox(width: 8),
                  classificationNames.isNotEmpty ? Images().getEscudoWidget(classificationNames[0],45,45) : Container(),
                  const SizedBox(width: 8),
                  classificationNames.length>=2 ? Images().getEscudoWidget(classificationNames[1],30,30) : Container(),
                  classificationNames.length>=3 ? Images().getEscudoWidget(classificationNames[2],20,20) : Container(),
                  classificationNames.length>=4 ? Images().getEscudoWidget(classificationNames[3],20,20) : Container(),
                  const SizedBox(width: 12),
                  classificationNames.length>=5 ? Images().getEscudoWidget(classificationNames[4],20,20) : Container(),
                  classificationNames.length>=6 ? Images().getEscudoWidget(classificationNames[5],20,20) : Container(),
                  classificationNames.length>=7 ? Images().getEscudoWidget(classificationNames[6],20,20) : Container(),
                  classificationNames.length>=8 ? Images().getEscudoWidget(classificationNames[7],20,20) : Container(),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                cupClassification.isNotEmpty ? Images().getEscudoWidget(cupClassification[0],40,40) : Container(),
                cupClassification.length>=2 ? Images().getEscudoWidget(cupClassification[1],20,20) : Container(),
              ],
            ),
            const SizedBox(width: 8),
          ],
      ),
    );

  }


Widget internationalChampionsSelection(){

    LeagueOfficialNames leagueOfficialNames = LeagueOfficialNames();

  return Container(
    color: AppColors().greyTransparent,
    width: Sized(context).width,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [

                internationalChampionsWidgetDetail(leagueOfficialNames.mundial),
                const SizedBox(width: 16),
                internationalChampionsWidgetDetail(leagueOfficialNames.championsLeague),
                internationalChampionsWidgetDetail(leagueOfficialNames.libertadores),
                const SizedBox(width: 16),

                internationalChampionsWidgetDetail(leagueOfficialNames.europaLeagueOficial),
                internationalChampionsWidgetDetail(leagueOfficialNames.copaSulAmericana),

                internationalChampionsWidgetDetail(leagueOfficialNames.pequenaTaca),
                internationalChampionsWidgetDetail(leagueOfficialNames.concacaf),
                internationalChampionsWidgetDetail(leagueOfficialNames.asia),
                internationalChampionsWidgetDetail(leagueOfficialNames.africa),

                internationalChampionsWidgetDetail(leagueOfficialNames.cupwinners),
                internationalChampionsWidgetDetail(leagueOfficialNames.latina),
                internationalChampionsWidgetDetail(leagueOfficialNames.rioSP),
                internationalChampionsWidgetDetail(leagueOfficialNames.copaNordeste),
              ],
            ),

          ],
        ),
      ),
    ),
  );
}
Widget internationalChampionsWidgetDetail(String internationalLeagueName){

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
    child: GestureDetector(
      onTap: (){
        //bottomSheetShowLeagueClassification(context, clubsID, internationalLeagueName);
      },
      child: Column(
          children: [
            Images().getLeagueLogo(internationalLeagueName, 40, 40),
            const SizedBox(height: 8),
            //Images().getEscudoWidget(team1,40,40),
            const SizedBox(height: 4),
            //Images().getEscudoWidget(team2,20,20),
          ],
        ),
    ),
  );
}


}
