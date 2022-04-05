import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/values/club_names.dart';
import 'package:fifa/functions/func_number_clubs_total.dart';
import 'package:fifa/theme/textstyle.dart';
import 'package:fifa/values/images.dart';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import '../values/images.dart';
import '../values/league_names.dart';
import 'club_profile.dart';

class RankingClubs extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const RankingClubs({Key? key}) : super(key: key);
  @override
  _RankingClubsState createState() => _RankingClubsState();
}

class _RankingClubsState extends State<RankingClubs> {

  int numberClubsTotal = funcNumberClubsTotal();


  My myClub = My();
  String myLeagueName = My().campeonatoName;

  List clubsOVR = []; //criado no init, e reutilizado depois no widget
  List copyClubsName = [];

  bool isLoaded = false;

  final ScrollController _scrollController = ScrollController();

////////////////////////////////////////////////////////////////////////////
//                               INIT                                     //
////////////////////////////////////////////////////////////////////////////
  @override
  void initState() {
    organizarRanking();
    super.initState();
  }
  organizarRanking(){
    //REORGANIZA ORDEM
    for (var leagueID in leaguesListRealIndex) {//element: 0-70
      List allClubsIDList = League(index: leagueID).getAllClubsIDList();
      for(int i=0; i<allClubsIDList.length; i++) {
        clubsOVR.add(Club(index: allClubsIDList[i]).getOverall());
        copyClubsName.add(Club(index: allClubsIDList[i]).name);
      }
    }

    for(int i=0; i<clubsOVR.length-1; i++) {
      for(int k=i+1; k<clubsOVR.length; k++) {
        if(clubsOVR[k] > clubsOVR[i]){
          late double auxiliarDouble;
          late String auxiliarString;
          auxiliarDouble = clubsOVR[i];clubsOVR[i] = clubsOVR[k]; clubsOVR[k] = auxiliarDouble;
          auxiliarString = copyClubsName[i];copyClubsName[i] = copyClubsName[k]; copyClubsName[k] = auxiliarString;
         }
      }
    }

    isLoaded=true;
    setState(() {});

  }
  @override
  void dispose() {
    //Cancelar o timer do envio de email
    _scrollController.dispose();
    super.dispose();
  }
////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    //_height = MediaQuery.of(context).size.height;
    return WillPopScope(//IF GO BACK TO PREVIOUS PAGE
      onWillPop: () async{
        return true;
      },
      child: Scaffold(

          resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
          body:  Stack(
              children: [

                Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

                isLoaded ? Column(
                  children: [

                    const SizedBox(height: 40),
                    const Text('Ranking de Clubes',style: EstiloTextoBranco.text20),
                    const SizedBox(height: 6),

                    Expanded(
                      child: DraggableScrollbar.semicircle(
                        alwaysVisibleScrollThumb: true,
                        controller: _scrollController,
                        child: ListView.builder(
                          controller: _scrollController,
                          itemCount: numberClubsTotal,
                            itemBuilder: (c,i) => rowClub(i, copyClubsName[i])
                        ),
                      ),
                    )


                  ],
                ) : const Center(child: CircularProgressIndicator())

              ]
          )
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////

Widget rowClub(int ranking, String clubName){

    int realClubIndex = clubsAllNameList.indexOf(clubName);
    double overall = clubsOVR[ranking];

    //Cor de Fundo
    Color colorBackground = Colors.transparent;
    List listClubsID = League(index: myClub.campeonatoID).getAllClubsIDList();

    if(listClubsID.contains(realClubIndex)){
      colorBackground = Colors.blue;
    }
    if(realClubIndex==myClub.clubID){
      colorBackground = Colors.redAccent;
    }

    return GestureDetector(
      onTap:(){
        Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: realClubIndex)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Container(
                width:35,
                padding: const EdgeInsets.only(left: 4.0),
                child: Text((ranking+1).toString()+'º',textAlign:TextAlign.end,style: EstiloTextoBranco.text14)
            ),
            Image.asset('assets/clubs/${FIFAImages().imageLogo(clubName)}.png',height: 30,width: 30),
            Expanded(
              child: Container(
                color: colorBackground,
                  padding: const EdgeInsets.all(4),
                  child: Text(clubName,style: EstiloTextoBranco.text20)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 6.0,right: 28),
              child: Text(overall.toStringAsFixed(2),style: EstiloTextoBranco.text16),
            ),
          ],
        ),
      ),
    );
}

}