import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/theme/colors.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:flutter/material.dart';

class ClubCalendar extends StatefulWidget {
  final Club club;
  const ClubCalendar({Key? key,required this.club}) : super(key: key);

  @override
  State<ClubCalendar> createState() => _ClubCalendarState();
}

class _ClubCalendarState extends State<ClubCalendar> {

  ///////////////////////////////////////////////////////////////////////////
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for(int i=0;i<20;i++)
                    calendarRow(i),

                ],
          ),
            ),
          ),
        ],
      ),
    );
  }


////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget calendarRow(int week){
    String clubName = 'Peñarol';
    String rodadaName = 'Semana ${week.toString()}';
    int gol1 = 2;
    int gol2 = 1;
    if(week%3==0){
      gol2 = 3;
    }
    if(week%3==1){
      gol2 = 2;
    }

    Color backgroundColor = AppColors().grey1;
    if(gol1>gol2){      backgroundColor =   const Color(0x3300FF0D);  }
    if(gol1==gol2){      backgroundColor =   const Color(0x33F1F800);  }
    if(gol1<gol2){      backgroundColor =   const Color(0x33FF0000);  }

    return Container(
      color: backgroundColor,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Image.asset(FIFAImages().campeonatoLogo(widget.club.leagueID),height:30,width: 30,),
          SizedBox(width: 8),
          Image.asset(Images().getEscudo(clubName),height:30,width: 30,),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                  Row(
                    children: [
                      Expanded(child: Text(rodadaName,style: EstiloTextoBranco.text12)),
                      const Text('Fora',style: EstiloTextoBranco.text12),
                      const SizedBox(width: 8),
                    ],
                  ),

                  Row(
                    children: [
                      Expanded(child: Text(clubName,style: EstiloTextoBranco.text16)),
                      Text('$gol1 x $gol2',style: EstiloTextoBranco.text16),
                      const SizedBox(width: 8),
                    ],
                  ),

              ],
            ),
          ),

        ],
      ),
    );
}

}
