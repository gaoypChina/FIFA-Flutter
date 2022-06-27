import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/image_class.dart';
import 'package:fifa/pages/club_profile/club_profile.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/widgets/back_button.dart';
import 'package:flutter/material.dart';

class RankingBestClubsHistory extends StatefulWidget {
  const RankingBestClubsHistory({Key? key}) : super(key: key);

  @override
  State<RankingBestClubsHistory> createState() =>
      _RankingBestClubsHistoryState();
}

class _RankingBestClubsHistoryState extends State<RankingBestClubsHistory> {
////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    organizarRanking();
    super.initState();
  }
  organizarRanking(){
    setState(() {});
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
              backButtonText(context, 'Melhores clubes da história'),
              title(),
              Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                      itemCount: 200,
                      itemBuilder: (c, i) => row(i)
                  )
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
  Widget title(){
    return Container( 
      padding: const EdgeInsets.all(4),
      child:  Row(
      children: const [
        SizedBox(width: 35),
        Text('Club', style: EstiloTextoBranco.negrito16),
        Spacer(),
        Text('Pts', style: EstiloTextoBranco.negrito16),
        SizedBox(width: 8),
      ],
    )
    );
  }
  Widget row(int i) {
    Club club = Club(index: i);
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: club.index)));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(width:30,child: Text(i.toString() + 'º ', style: EstiloTextoBranco.text14)),
            Image.asset(Images().getEscudo(club.name), height: 30, width: 30),
            const SizedBox(width: 10),
            Text(club.name, style: EstiloTextoBranco.text16),
            const Spacer(),
            const Text('4324', style: EstiloTextoBranco.text14),
          ],
        ),
      ),
    );
  }
}
