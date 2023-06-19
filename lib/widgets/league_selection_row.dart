
import 'package:fifa/classes/countries/flags_list.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:flutter/material.dart';

Widget countryFlagsSelectionBottomWidget({required String country, required String chosenCountryName,required Function() onTap}) {

  return PressableButton(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical:  chosenCountryName == country ? 7.5 : 12.5,
        horizontal: chosenCountryName == country ? 3.5 : 6,
      ),
      color: chosenCountryName == country ? AppColors().green : AppColors().greyTransparent,
      child: funcFlagsList(
          country,
          chosenCountryName == country ? 35 : 25,
          chosenCountryName == country ? 45 : 40),
    ),
  );
}

Widget countryFlagsSelectionBottomWidget2({required String leagueName, required String chosenLeagueName, required Function() onTap}) {
  return PressableButton(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical:  chosenLeagueName == leagueName ? 7.5 : 12.5,
        horizontal: chosenLeagueName == leagueName ? 3.5 : 6,
      ),
      color: chosenLeagueName == leagueName ? AppColors().green : AppColors().greyTransparent,
      child: funcFlagsList(
          getCountryFromLeague(leagueName),
          chosenLeagueName == leagueName ? 35 : 25,
          chosenLeagueName == leagueName ? 45 : 40),
    ),
  );
}

class LeagueSelectionRow extends StatelessWidget {
  final String chosenLeagueName;
  final List leaguesListRealIndex;
  final Function(String) onTap;
  const LeagueSelectionRow({Key? key,
    required this.chosenLeagueName, required this.leaguesListRealIndex, required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for(int i = 0; i < leaguesListRealIndex.length; i++)
              leagueSelectionRow(i, leaguesListRealIndex[i], onTap)
          ],
        ),
      );
  }

  Widget leagueSelectionRow(int i, int leagueID, Function(String) onTap){
    String leagueName = League(index: leagueID).getName();

    return PressableButton(
      onTap: (){
        onTap(leagueName);
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        color: chosenLeagueName == leagueName ? AppColors().green : AppColors().greyTransparent,
        child: Center(child:
          Image.asset(
            FIFAImages().campeonatoLogo(leagueName),
            height: chosenLeagueName == leagueName ? 48 : 36,
            width: chosenLeagueName == leagueName ? 48 : 40,
          )
        ),
      ),
    );
  }
}
