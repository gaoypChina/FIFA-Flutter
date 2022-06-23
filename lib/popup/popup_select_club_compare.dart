import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/values/images.dart';
import 'package:fifa/values/league_names.dart';
import 'package:flutter/material.dart';


class PopupSelectClub{
  int choosenLeagueIndex = 1;
  bool popupClosed = false;
  late Club newClub;
}

popUpSelectClub({required BuildContext originalContext,required PopupSelectClub popupConfig}){

  Widget leagueRow(Function setState,int league){
    int leagueIndex = leaguesListRealIndex[league];
    return GestureDetector(
      onTap: (){
        popupConfig.choosenLeagueIndex = leagueIndex;
        setState((){});
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        color: popupConfig.choosenLeagueIndex == leagueIndex ? Colors.redAccent: Colors.white54,
        child: Image.asset(FIFAImages().campeonatoLogo(leagueIndex),height: 50,width: 50,),
      ),
    );
  }

  Widget selectLeagueWidget(Function setState){
    return              Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      color: AppColors().greyTransparent,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for(int i=0;i<leaguesListRealIndex.length;i++)
              leagueRow(setState,i)
          ],
        ),
      ),
    );
  }

  Widget selectClubWidget(BuildContext context, Function setState){

    List clubsIDs = League(index: popupConfig.choosenLeagueIndex).getAllClubsIDList();
    return  Container(
      height: 310,
      width: 250,
      margin: const EdgeInsets.all(4),
      child: GridView.count(
        crossAxisCount: 4,
        children: List.generate(clubsIDs.length, (index) {
          Club gridClub = Club(index: clubsIDs[index]);

          return GestureDetector(
            onTap: (){
              popupConfig.newClub = Club(index: gridClub.index);
              popupConfig.popupClosed = true;
              Navigator.of(context).pop();
              setState((){});
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              color: Colors.transparent,
              child: Image.asset(Images().getEscudo(gridClub.name)),
            ),
          );
        }),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               DIALOG                                   //
////////////////////////////////////////////////////////////////////////////
  showDialog(
    context: originalContext,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return StatefulBuilder(
          builder: (context, Function setState) {
            return AlertDialog(
              title: Text(Translation(context).text.selectClub,style: EstiloTextoPreto.text16),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  selectLeagueWidget(setState),
                  selectClubWidget(context,setState),

                ],
              ),

              actions: <Widget>[
                TextButton(
                    child: const Text("OK",style: EstiloTextoPreto.text16,),
                    onPressed: (){
                      Navigator.of(context).pop();
                      popupConfig.popupClosed = true;
                    }
                ),
              ],

            );
          }
      );
    },
  );



}