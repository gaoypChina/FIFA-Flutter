import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/theme/textstyle.dart';
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
      body: Stack(
        children: [

          Images().getWallpaper(),

          Column(
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
        ],
      ),
    );
  }
}
Widget teamData(){
  return Column(
    children: const [
      Text('Elenco:',style: EstiloTextoBranco.text22),
    ],
  );
}
Widget transfers(){
  return Column(
    children: [
      const Text('Minhas Transferências',style: EstiloTextoBranco.text22),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text('Vendas',style: EstiloTextoBranco.text22),
              SingleChildScrollView(
                child: Container(),
              ),
            ],
          ),
          Column(
            children: [
              const Text('Compras',style: EstiloTextoBranco.text22),
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