import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/historic/leagues_historic.dart';
import 'package:fifa/pages/historic/real_classification/get_classification.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/historic_champions/historic_champions.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/bottom_sheet/bottom_sheet_league_classification.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/league_selection_row.dart';
import 'package:flutter/material.dart';

class RealClassificationPage extends StatefulWidget {
  final String chosenCountryName;
  const RealClassificationPage({Key? key, required this.chosenCountryName}) : super(key: key);

  @override
  State<RealClassificationPage> createState() => _RealClassificationPageState();
}

class _RealClassificationPageState extends State<RealClassificationPage> {

  String chosenLeagueName = "";

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
      super.initState();
      chosenLeagueName = RealClassification().getLeagueFromCountryName(widget.chosenCountryName);
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

              appBarWidgets(),

              Expanded(
                  child: RealTableWidget(chosenLeagueName: chosenLeagueName),
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for(String leagueName in LeagueOfficialNames().getAllLeagueNames())
                      countryFlagsSelectionBottomWidget2(
                          leagueName: leagueName,
                          chosenLeagueName: chosenLeagueName,
                          onTap: (){
                            chosenLeagueName = leagueName;
                            customToast("Loading League " + chosenLeagueName);
                            setState(() {});
                          })
                  ],
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
  Widget appBarWidgets(){
    return Container(
      color: appBarMyClubColor(),
      child: Row(
        children: [
          backButtonText(context,'Tabela de Classificação'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: GestureDetector(
              onTap:(){
                List classificationNames = mapChampions(chosenLeagueName)[ano-1];
                bottomSheetShowLeagueClassification(context, classificationNames);
              },
              child: const Icon(Icons.table_chart,color:Colors.white,size: 32),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: IconButton(onPressed: (){
              navigatorPush(context, HistoricLeague(chosenLeagueName: chosenLeagueName));
            }, icon: const Icon(Icons.open_in_browser,color: Colors.white,size: 32,)),
          ),

        ],
      ),
    );
  }
}




class RealTableWidget extends StatefulWidget {
  final String chosenLeagueName;
  const RealTableWidget({Key? key, required this.chosenLeagueName}) : super(key: key);

  @override
  State<RealTableWidget> createState() => _RealTableWidgetState();
}

class _RealTableWidgetState extends State<RealTableWidget> {

  RealClassification realClassification = RealClassification();

  bool hasClassification = true;

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
    updateWidget();
  }

  @override
  void didUpdateWidget(covariant RealTableWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    updateWidget();
  }

  updateWidget() async{

    realClassification.getUrls();

    try {
      await realClassification.getLeagueTable(widget.chosenLeagueName);
    }catch(e){
      hasClassification = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return hasClassification ? Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(width: Sized(context).width*0.18),
            Container(width: Sized(context).width*0.42),
            const Text("Pts",style: EstiloTextoBranco.negrito14),
            Container(width: Sized(context).width*0.02),
            const Text("J",style: EstiloTextoBranco.negrito14),
            Container(width: Sized(context).width*0.01),
            const Text("V",style: EstiloTextoBranco.negrito14),
            Container(width: Sized(context).width*0.01),
            const Text("E",style: EstiloTextoBranco.negrito14),
            Container(width: Sized(context).width*0.01),
            const Text("D",style: EstiloTextoBranco.negrito14),
            Container(width: Sized(context).width*0.01),
            const Text("GM",style: EstiloTextoBranco.text12),
            Container(width: Sized(context).width*0.005),
            const Text("GS",style: EstiloTextoBranco.text12),
            Container(width: Sized(context).width*0.005),
            const Text("SG",style: EstiloTextoBranco.text12),
          ],
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: realClassification.standings.length,
              itemBuilder: (context, index) {
                Map data = realClassification.standings[index];
                return rowTile(context, index, data);
              },
            ),
        ),
      ],
    ) : Container();
  }

  Widget rowTile(BuildContext context, int index, Map data){
    String clubName = data['team'];
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      color: ClubDetails().getColors(clubName).primaryColor.withOpacity(0.5),
      child: GestureDetector(
        onTap: (){
          clickClub(context: context, clubName: clubName);
        },
        child: Row(
          children: [
            Container(width: 4),
            SizedBox(
                width: 30,
                child: Text((index + 1).toString(),style: EstiloTextoBranco.negrito18)),
            Images().getEscudoWidget(clubName, 36, 36),
            Container(width: 4),
            SizedBox(
              width: Sized(context).width*0.41,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(clubName, style: EstiloTextoBranco.text14),
                  Text('OVR: ${ClubDetails().getOverall(clubName).toStringAsFixed(1)}',style: EstiloTextoBranco.negrito14),
                ],
              ),
            ),
            SizedBox(
                width: 28,
                child: Center(child: Text(data['points'],style: EstiloTextoBranco.negrito14))),
            Container(width: 2),
            Text('${data['matchs']} ${data['win']} ${data['draw']} ${data['loss']}    ${data['GM']}  ${data['GS']}  ${data['SG']}',style: EstiloTextoBranco.text10),

          ],
        ),
      ),
    );
  }
}

