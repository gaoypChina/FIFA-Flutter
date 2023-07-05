import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/click_navigator/click_club.dart';
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/pages/table/table_nacional.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/values/clubs_all_names_list.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/bottom_sheet/bottom_sheet_league_classification.dart';
import 'package:flutter/material.dart';

class CurrentLeagueResume extends StatelessWidget {
  final String selectedYear;
  final String leagueName;
  const CurrentLeagueResume({Key? key, required this.selectedYear, required this.leagueName}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
              navigatorPush(context, TableNacional(chosenLeagueIndex: leaguesIndexFromName[leagueName]));
            }else{
              bottomSheetShowLeagueClassification(context, classificationNames);
            }
          },
          child: Stack(
            children: [

              SizedBox(
                width: Sized(context).width*0.95,
                child: Center(
                  child: SizedBox(
                    height: 70,width: 90,
                    child: Opacity(
                      opacity: 0.2,
                      child: AspectRatio(
                        aspectRatio: 200 / 400,
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
                    const SizedBox(width: 12),
                    Images().getLeagueLogo(leagueName, 40,40),
                    const SizedBox(width: 12),
                    classificationNames.isNotEmpty
                        ? Container(
                            color: AppColors().greyTransparent,
                            padding: const EdgeInsets.all(4),
                            child: Stack(
                              children: [
                                Images().getEscudoWidget(classificationNames[0],50,50),
                                Positioned(
                                    right:0, bottom:0,
                                    child: funcFlagsList(ClubDetails().getCountry(classificationNames[0]), 12, 18)
                                ),
                              ],
                            ))
                        : Container(),
                    classificationNames.length>=2 ? Images().getEscudoWidget(classificationNames[1],35,35) : Container(),
                    classificationNames.length>=3 ? Images().getEscudoWidget(classificationNames[2],25,25) : Container(),
                    classificationNames.length>=4 ? Images().getEscudoWidget(classificationNames[3],25,25) : Container(),
                    classificationNames.length>=5 ? Images().getEscudoWidget(classificationNames[4],20,20) : Container(),
                    classificationNames.length>=6 ? Images().getEscudoWidget(classificationNames[5],20,20) : Container(),
                    classificationNames.length>=7 ? Images().getEscudoWidget(classificationNames[6],20,20) : Container(),
                    classificationNames.length>=8 ? Images().getEscudoWidget(classificationNames[7],20,20) : Container(),
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
}
