import 'package:fifa/classes/image_class.dart';
import 'package:fifa/functions/change_club_control.dart';
import 'package:fifa/global_variables.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

import 'menu/c_menu.dart';

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

        resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
        body:  Stack(
            children: [

              Images().getWallpaper(),

              Column(
                children: [

                  backButtonText(context, Translation(context).text.changeClub),

                  Expanded(
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
                ],
              ),

            ]
        )
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget clubWidget(int clubID){

  ClubClassification clubClassification = ClubClassification(clubID: clubID);

    return GestureDetector(
      onTap: (){
        funcChangeClub(clubClassification.clubName, clubClassification.leagueID);
        alreadyChangedClubThisSeason = true;
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const Menu()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          height: 220,width: 170,
          color: Colors.black12,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              Images().getEscudoWidget(clubClassification.clubName,130,130),
              Text(clubClassification.clubName,textAlign:TextAlign.center,style: EstiloTextoBranco.negrito22),
              Text('${Translation(context).text.position}: '+clubClassification.posicaoTabela.toString()+'º',style: EstiloTextoBranco.text14)
            ],
          ),
        ),
      ),
    );
}
}