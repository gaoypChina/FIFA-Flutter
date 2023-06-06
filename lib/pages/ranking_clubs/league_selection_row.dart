
import 'package:fifa/classes/league.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/values/images.dart';
import 'package:flutter/material.dart';

class LeagueSelectionRow extends StatelessWidget {
  final String choosenLeagueName;
  final List leaguesListRealIndex;
  final Function(String) onTap;
  const LeagueSelectionRow({Key? key,
    required this.choosenLeagueName, required this.leaguesListRealIndex, required this.onTap
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

    return GestureDetector(
      onTap: (){
        onTap(leagueName);
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        color: choosenLeagueName == leagueName ? AppColors().green : Colors.white54,
        child: Image.asset(FIFAImages().campeonatoLogo(leagueName), height: 50,width: 50,),
      ),
    );
  }
}
