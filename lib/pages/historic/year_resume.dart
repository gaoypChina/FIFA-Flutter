import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/historic/historic_champions_league.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/functions/flags_list.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/club_profile/all_infos_club_not_playable.dart';
import 'package:fifa/pages/table/table_nacional.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/historic_champions/historic_champions.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_divisions.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class YearResume extends StatefulWidget {
  const YearResume({Key? key}) : super(key: key);

  @override
  State<YearResume> createState() => _YearResumeState();
}

class _YearResumeState extends State<YearResume> {

  List<String> possibleYears = [];
  String selectedYear = anoInicial.toString();
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
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Images().getWallpaper(),

          Column(
            children: [
              backButtonText(context,'Resumo do ano'),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dropDownButton(),
                    int.parse(selectedYear) < anoInicial ?  Expanded(child:
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: internationalChampionsSelection(),
                      ),
                    ) : Container(),
                  ],
                ),
              ),

              int.parse(selectedYear) >= anoInicial ? Expanded(
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                      childAspectRatio: 2.8,
                    ),
                  itemCount: leaguesListRealIndex.length,
                  itemBuilder: (c,index)=> resumeLeague(League(index: leaguesListRealIndex[index]).name)
              ),
              ) : Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for(String leagueName in LeagueOfficialNames().getAllLeagueNames())
                        leagueHistoric(leagueName)
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
  Widget leagueHistoric(String leagueName){
    List classificationNames = [];
    try {
      classificationNames = mapChampions(leagueName)[double.parse(selectedYear)];
      if(classificationNames.isEmpty){
        //SE naquele ano a liga nao tem times no historico
        return Container();
      }
    }catch(e){
      //print('LIGA $leagueName não tem histórico de classificação nesse ano);
      return Container();
    }

    //CUP WINNERS
    List<String> cupClassification = [];
    try {
      if(Divisions().is1stDivision(leagueName)){
        String cupName = getCup(leagueName);
        cupClassification = mapChampions(cupName)[double.parse(selectedYear)];
      }
    }catch(e){
      //print('COPA $leagueName não tem histórico de classificação nesse ano);
    }

    return Row(
        children: [
          const SizedBox(width: 10),
          GestureDetector(
            onTap: (){
              bottomSheetShowLeagueClassification(classificationNames);
            },
            child: Row(
              children: [
                funcFlagsList(getCountryFromLeague(leagueName), 20, 30),
                const SizedBox(width: 10),
                classificationNames.isNotEmpty ? Images().getEscudoWidget(classificationNames[0],45,45) : Container(),
                const SizedBox(width: 10),
                classificationNames.length>=2 ? Images().getEscudoWidget(classificationNames[1],30,30) : Container(),
                classificationNames.length>=3 ? Images().getEscudoWidget(classificationNames[2],20,20) : Container(),
                classificationNames.length>=4 ? Images().getEscudoWidget(classificationNames[3],20,20) : Container(),
                const SizedBox(width: 20),
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
          const SizedBox(width: 10),
        ],
    );

  }

  Widget dropDownButton(){
    return                   Container(
      decoration: BoxDecoration(
        color:Colors.white, //background color of dropdown button
        border: Border.all(color: Colors.black38, width:2), //border of dropdown button
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10.0,vertical: 4),
        child: DropdownButton<String>(
          value: selectedYear,
          style: const TextStyle(fontSize: 18, color: Colors.white),
          iconEnabledColor: Colors.black, //Icon color
          underline: Container(), //empty line
          dropdownColor: Colors.white,
          items: possibleYears.map((value) {
            return DropdownMenuItem(
              child: Text(value,style: EstiloTextoPreto.text16),
              value: value,
            );
          }).toList(),
          onChanged: (value) {
            setState(() {});
            selectedYear = value.toString();
          },
        ),
      ),
    );
  }


Widget internationalChampionsSelection(){
  LeagueOfficialNames leagueOfficialNames = LeagueOfficialNames();
  return Row(
    children: [
      internationalChampionsWidgetDetail(leagueOfficialNames.mundial),
      internationalChampionsWidgetDetail(leagueOfficialNames.championsLeague),
      internationalChampionsWidgetDetail(leagueOfficialNames.ligaEuropa),
      internationalChampionsWidgetDetail(leagueOfficialNames.libertadores),
      internationalChampionsWidgetDetail(leagueOfficialNames.sulamericano),
      internationalChampionsWidgetDetail(leagueOfficialNames.concacaf),
      internationalChampionsWidgetDetail(leagueOfficialNames.asia),
      internationalChampionsWidgetDetail(leagueOfficialNames.africa),

      internationalChampionsWidgetDetail(leagueOfficialNames.cupwinners),
      internationalChampionsWidgetDetail(leagueOfficialNames.latina),
      internationalChampionsWidgetDetail(leagueOfficialNames.rioSP),
    ],
  );
}
Widget internationalChampionsWidgetDetail(String internationalLeagueName){
    late String team1;
    late String team2;
    late List clubsID;

    if(int.parse(selectedYear) > anoInicial) {
       clubsID = HistoricChampionsLeague().getFinalClubsIDOrdered(int.parse(selectedYear), internationalLeagueName);
      team1 = clubsAllNameList[clubsID[0]];
      team2 = clubsAllNameList[clubsID[1]];
    }else{
      try {
        Map allClassifications = mapChampions(internationalLeagueName);
        clubsID = allClassifications[double.parse(selectedYear)];
        team1 = clubsID[0];
        team2 = clubsID[1];
      }catch(e){
        return Container();
      }
    }



  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6.0),
    child: GestureDetector(
      onTap: (){
        bottomSheetShowLeagueClassification(clubsID);
      },
      child: Row(
          children: [
            Image.asset(FIFAImages().campeonatoLogo(internationalLeagueName),height: 40,width: 40),
            Images().getEscudoWidget(team1,40,40),
            Images().getEscudoWidget(team2,20,20),
          ],
        ),
    ),
  );
}

Widget resumeLeague(String leagueName){
    List classification = [];
    if(int.parse(selectedYear) < ano ){
      classification = globalHistoricLeagueClassification[int.parse(selectedYear)][leagueName];
    }else{
      classification = Classification(leagueIndex: leaguesIndexFromName[leagueName]).classificationClubsIndexes;
    }


    List classificationNames = [];
    for (var clubID in classification) { classificationNames.add(clubsAllNameList[clubID]); }



    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1, //                   <--- border width here
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            if(int.parse(selectedYear) == ano){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TableNacional(choosenLeagueIndex: leaguesIndexFromName[leagueName])));
            }else{
                bottomSheetShowLeagueClassification(classificationNames);
            }
            },
          child: Stack(
            children: [

              SizedBox(
                width: Sized(context).width*0.45,
                child: Center(
                  child: SizedBox(
                    height: 70,width: 90,
                    child: Opacity(
                      opacity: 0.2,
                      child: AspectRatio(
                        aspectRatio: 350 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                alignment: FractionalOffset.center,
                                image: AssetImage(FIFAImages().campeonatoLogo(leagueName)),
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(width: 10),
                    classificationNames.isNotEmpty ? Images().getEscudoWidget(classificationNames[0],45,45) : Container(),
                    classificationNames.length>=2 ? Images().getEscudoWidget(classificationNames[1],30,30) : Container(),
                    classificationNames.length>=3 ? Images().getEscudoWidget(classificationNames[2],20,20) : Container(),
                    classificationNames.length>=4 ? Images().getEscudoWidget(classificationNames[3],20,20) : Container(),
                    classificationNames.length>=5 ? Images().getEscudoWidget(classificationNames[4],20,20) : Container(),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  clickClub(String clubName){
    //if(clubsAllNameList.contains(clubName)){
    //  int clubID = clubsAllNameList.indexOf(clubName);
    //  Navigator.push(context, MaterialPageRoute(builder: (context) => ClubProfile(clubID: clubID)));
    //}else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => ClubProfileNotPlayable(clubName: clubName)));
    //}
  }

  bottomSheetShowLeagueClassification(List classificationNames){
    return showModalBottomSheet(
        barrierColor: Colors.transparent,
        context: context, builder: (c){
      return SingleChildScrollView(
          child: Column(
            children: [

              for(int i=0; i<classificationNames.length;i++)
                GestureDetector(
                  onTap: (){
                    clickClub(classificationNames[i]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: [
                        SizedBox(width:35,child: Text((i+1).toString()+'º ',textAlign: TextAlign.right,style:EstiloTextoPreto.text16)),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Images().getEscudoWidget(classificationNames[i],30,30),
                        ),
                        Text(classificationNames[i],style:EstiloTextoPreto.text16),
                      ],
                    ),
                  ),
                ),
            ],
          ));
    });
  }

}
