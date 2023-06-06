import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/club_details.dart';
import 'package:flutter/material.dart';

Widget backButton(BuildContext context){
  return IconButton(
          onPressed: (){Navigator.pop(context);},
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white,size: 30));
}

Widget backButtonText(BuildContext context, String text, [bool hasColor=false]){
  return Container(
    margin: const EdgeInsets.only(top:30),
    color: hasColor
            ? appBarMyClubColor()
            : Colors.transparent,
    child: Row(
      children: [
        const SizedBox(width: 8),
        backButton(context),
        Text(text,style: EstiloTextoBranco.text22),
      ],
    ),
  );
}

Color appBarMyClubColor(){
  try {
    return ClubDetails()
        .getColors(My().clubName)
        .primaryColor
        .withOpacity(0.3);
  }catch(e){
    //Layouts do menu
    return AppColors().primary.withOpacity(0.3);
  }
}