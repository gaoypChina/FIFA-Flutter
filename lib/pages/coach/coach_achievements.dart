import 'package:fifa/classes/geral/size.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/page_controller/coach/coach_achievements_controller.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class CoachAchievements extends StatefulWidget {
  const CoachAchievements({Key? key}) : super(key: key);

  @override
  State<CoachAchievements> createState() => _CoachAchievementsState();
}

class _CoachAchievementsState extends State<CoachAchievements> {
  late CoachAchievementsController controller;

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    controller = CoachAchievementsController(context);

    return Scaffold(
      body: Container(
        width: Sized(context).width,
        decoration: Images().getWallpaperContainerDecoration(),
        child: Column(
          children: [
            backButtonText(context, Translation(context).text.coachAchievements),
            const SizedBox(height: 8),
            for(String word in controller.achievements)
              row(controller, word)
          ],
        ),
      )
    );
  }

////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget row(CoachAchievementsController controller, String name){
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8),
    margin: const EdgeInsets.only(left: 12,right: 8),
    child: Row(
      children: [
        Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(Icons.star,color: controller.achievementsCheck[name]! ? Colors.yellow :Colors.white,size:25),
        ),
        Text(name,style: EstiloTextoBranco.text16),
      ],
    ),
  );
}

}
