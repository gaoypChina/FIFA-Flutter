import 'dart:async';

import 'package:fifa/classes/functions/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/theme/custom_toast.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:fifa/widgets/button/button_continue.dart';
import 'package:fifa/widgets/popup/popup_select_club_compare.dart';
import 'package:fifa/widgets/stars.dart';
import 'package:flutter/material.dart';

class TeamSelection extends StatefulWidget {
  final List<String> clubs;
  const TeamSelection({Key? key, required this.clubs}) : super(key: key);

  @override
  State<TeamSelection> createState() => _TeamSelectionState();
}

class _TeamSelectionState extends State<TeamSelection> {

  List<String> clubs = [];

  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    clubs = widget.clubs;
    super.initState();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {

    ClubDetails clubDetails = ClubDetails();

    return Scaffold(
      body: Stack(
        children: [

          Images().getWallpaper(),

          Column(
            children: [
              backButtonText(context,'Team Selection'),

              SizedBox(
                height: Sized(context).height-172,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Number of columns in the grid
                    crossAxisSpacing: 1, // Spacing between columns
                    mainAxisSpacing: 32,
                  ),
                  itemCount: clubs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return box(context, index, clubDetails);
                  },
                ),

          ),

              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: customButtonContinue(
                    title: "Start",
                    function: (){

                    }
                ),),

        ],
      ),
      ],
    )
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget box(BuildContext originalContext, index, ClubDetails clubdetails){

    String clubName = clubs[index];

    return InkWell(
      onTap: () async{
        PopupSelectClub popupConfig = PopupSelectClub();
        popUpSelectClub(originalContext: originalContext, popupConfig: popupConfig);
        Timer.periodic(const Duration(milliseconds: 100), (timer) {
          if (popupConfig.popupClosed) {
            setState((){});
            if(!clubs.contains(popupConfig.newClub.name)){
              clubs[index] = popupConfig.newClub.name;
            }else{
              customToast("Clube já selecionado");
            }
            timer.cancel();
          }
        });
      },
      child: Column(
        children: [
          Images().getEscudoWidget(clubName),
          SizedBox(
              height: 32,
              child: Center(child: Text(clubName, maxLines:2, textAlign: TextAlign.center, style: EstiloTextoBranco.text12))),
          Row(
            children: [
              const SizedBox(width: 6),
              starsWidgetFromOverall(clubdetails.getOverall(clubName),14),
            ],
          ),
        ],
      ),
    );
  }

}
