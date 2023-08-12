import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/historic/leagues_historic.dart';
import 'package:fifa/pages/historic/real_classification/get_classification.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/decoration/my_team_gradient.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/historic_champions/historic_champions.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/arrow_table.dart';
import 'package:fifa/widgets/bottom_sheet/bottom_sheet_league_classification.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:fifa/widgets/league_selection_row.dart';
import 'package:fifa/widgets/number_circle.dart';
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
                bottomSheetShowLeagueClassification(context, classificationNames, chosenLeagueName, ano-1);
              },
              child: const Icon(Icons.table_chart_outlined,color:Colors.white,size: 32),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: IconButton(onPressed: (){
              navigatorPush(context, HistoricLeague(chosenLeagueName: chosenLeagueName));
            }, icon: const Icon(Icons.history_outlined,color: Colors.white,size: 32,)),
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
      hasClassification = true;
    }catch(e){
      hasClassification = false;
      customToast("No data available");
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
            const Spacer(),
            const Text("Pts",style: EstiloTextoBranco.negrito14),
            Container(width: Sized(context).width*0.02),
            const SizedBox(width: 18, child: Text("J", textAlign: TextAlign.center, style: EstiloTextoBranco.text12)),
            const SizedBox(width: 18, child: Text("V", textAlign: TextAlign.center, style: EstiloTextoBranco.text12)),
            const SizedBox(width: 18, child: Text("E", textAlign: TextAlign.center, style: EstiloTextoBranco.text12)),
            const SizedBox(width: 18, child: Text("D", textAlign: TextAlign.center, style: EstiloTextoBranco.text12)),
            const SizedBox(width: 4, child: Text("|", textAlign: TextAlign.center, style: EstiloTextoCinza.text16)),
            const SizedBox(width: 20, child: Text("GM", textAlign: TextAlign.center, style: EstiloTextoBranco.text12)),
            const SizedBox(width: 20, child: Text("GS", textAlign: TextAlign.center, style: EstiloTextoBranco.text12)),
            const SizedBox(width: 20, child: Text("SG", textAlign: TextAlign.center, style: EstiloTextoBranco.text12)),
            Container(width: 4),
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
    ClubColors clubColors = ClubDetails().getColors(clubName);

    return PressableButton(
      onTap: (){
        clickClub(context: context, clubName: clubName);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
            gradient: gradientTeam(clubColors.primaryColor)
        ),
        child: Row(
          children: [
            Stack(
              children: [

                Positioned.fill(
                  child: CustomPaint(
                    painter: ArrowSquarePainter(colorArrow: AppColors().greyTransparent),
                  ),
                ),

                Row(
                  children: [
                    Container(width: 4),
                    numberCircle(index + 1, 30),
                    Container(width: 4),
                    Images().getEscudoWidget(clubName, 32, 32),
                    Container(width: 4),
                  ],
                )
              ],
            ),
            Container(width: 4),
            Expanded(
              child: Text(clubName, style: EstiloTextoBranco.text14),
            ),
            SizedBox(
                width: 28,
                child: Center(child: Text(data['points'],style: EstiloTextoBranco.negrito14))),
            Container(width: 2),
            Row(
              children: [
                SizedBox(width:18, child: Text(data['matchs'], textAlign: TextAlign.center, style: EstiloTextoBranco.text12)),
                SizedBox(width:18, child: Text(data['win'], textAlign: TextAlign.center, style: EstiloTextoBranco.text12)),
                SizedBox(width:18, child: Text(data['draw'], textAlign: TextAlign.center, style: EstiloTextoBranco.text12)),
                SizedBox(width:18, child: Text(data['loss'], textAlign: TextAlign.center, style: EstiloTextoBranco.text12)),
                const SizedBox(width: 4, child: Text("|", textAlign: TextAlign.center, style: EstiloTextoCinza.text16)),
                SizedBox(width:20, child: Text(data['GM'], textAlign: TextAlign.center, style: EstiloTextoBranco.text12)),
                SizedBox(width:20, child: Text(data['GS'], textAlign: TextAlign.center, style: EstiloTextoBranco.text12)),
                SizedBox(width:20, child: Text(data['SG'], textAlign: TextAlign.center, style: EstiloTextoBranco.text12)),
                Container(width: 4),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

