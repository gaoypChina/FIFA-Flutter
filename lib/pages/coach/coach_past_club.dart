import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/theme/translation.dart';
import 'package:flutter/material.dart';

class CoachHistoricClub extends StatefulWidget {
  final int clubID;
  final int year;
  const CoachHistoricClub({Key? key,required this.clubID,required this.year}) : super(key: key);

  @override
  State<CoachHistoricClub> createState() => _CoachHistoricClubState();
}

class _CoachHistoricClubState extends State<CoachHistoricClub> {

  My my = My();

  @override
  Widget build(BuildContext context) {

    Club club = Club(index: widget.clubID);

    return Scaffold(
      body: Container(
        decoration: Images().getWallpaperContainerDecoration(),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(Images().getEscudo(club.name),height:40,width:40),
                Text(club.name,style: EstiloTextoBranco.negrito22),
                Text(widget.year.toString(),style: EstiloTextoBranco.text16),
              ],
            ),
            teamData(),
            transfers(),

          ],
        ),
      ),
    );
  }
Widget teamData(){
  return Column(
    children: [
      Text('${Translation(context).text.elenco}:',style: EstiloTextoBranco.text22),
    ],
  );
}
Widget transfers(){
  return Column(
    children: [
      Text(Translation(context).text.myTransfers,style: EstiloTextoBranco.text22),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(Translation(context).text.sold,style: EstiloTextoBranco.text22),
              SingleChildScrollView(
                child: Container(),
              ),
            ],
          ),
          Column(
            children: [
              Text(Translation(context).text.bought,style: EstiloTextoBranco.text22),
              SingleChildScrollView(
                child: Container(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

}