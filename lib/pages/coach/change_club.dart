import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/functions/change_club_control.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/button_border_green.dart';
import 'package:fifa/widgets/button/pressable_button.dart';
import 'package:flutter/material.dart';

import '../menu/c_menu.dart';

class ChangeClub extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const ChangeClub({Key? key}) : super(key: key);
  @override
  _ChangeClubState createState() => _ChangeClubState();
}

class _ChangeClubState extends State<ChangeClub> {


////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    OptionsClubs options = OptionsClubs();

    return Scaffold(

        body:  Stack(
            children: [

              Images().getWallpaper(),

              Column(
                children: [

                  backButtonText(context, Translation(context).text.changeClub, true),

                  Container(
                    color: AppColors().greyTransparent,
                    child: Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                clubWidget(options.teams[0]),
                                clubWidget(options.teams[1]),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                clubWidget(options.teams[2]),
                                clubWidget(options.teams[3]),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                clubWidget(options.teams[4]),
                                clubWidget(options.teams[5]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget clubWidget(Club club){

  ClubClassification clubClassification = ClubClassification(club: club);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: PressableButton(
        onTap: (){
                funcChangeClub(clubClassification.clubName, clubClassification.leagueID);
                alreadyChangedClubThisSeason = true;
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Menu()));
              },
          child: Container(
          height: 220,width: 170,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: decorationGreen(),
            child: Column(
              children: [
                Images().getEscudoWidget(clubClassification.clubName,130,130),
                Text(clubClassification.clubName,textAlign:TextAlign.center,style: EstiloTextoBranco.negrito22),
                Text('${Translation(context).text.position}: '+clubClassification.posicaoTabela.toString()+'º',style: EstiloTextoBranco.text14)
              ],
            ),
        ),
      )
    );
}
}