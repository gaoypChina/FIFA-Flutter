import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/tournament_mode/team_selection.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/button/back_button.dart';
import 'package:flutter/material.dart';

class Tournament extends StatefulWidget {
  const Tournament({Key? key}) : super(key: key);

  @override
  State<Tournament> createState() => _TournamentState();
}

class _TournamentState extends State<Tournament> {


  ////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    super.initState();
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
              backButtonText(context,'Tournament'),
              const Text('Choose a Style',style: EstiloTextoBranco.text20),
              const SizedBox(width: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  box("League"),
                  box("Knockout"),
                  box("Group-Stage"),

                ],
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
Widget box(String title){
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => const TeamSelection()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(title, style: EstiloTextoBranco.text16)
          ],
        ),
      ),
    );
}
}
