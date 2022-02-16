import 'package:fifa/classes/club.dart';
import 'package:fifa/classes/league.dart';
import 'package:fifa/classes/my.dart';
import 'package:fifa/global/global_variables.dart';
import 'package:fifa/global/globalfunctions.dart';
import 'package:fifa/theme/textstyle.dart';

import 'package:flutter/material.dart';

import '../global/images.dart';
import 'club_profile.dart';

class RankingClubs extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const RankingClubs({Key? key}) : super(key: key);
  @override
  _RankingClubsState createState() => _RankingClubsState();
}

class _RankingClubsState extends State<RankingClubs> {

  int numberClubsTotal = GlobalFunctions().numberClubsTotal();

  List clubsOVR = []; //criado no init, e reutilizado depois no widget

  My myClub = My();
  String myLeagueName = League(index: My().campeonatoID).name;
  //Copia as tabelas sem afetar a original
  List copyClubsName = List.from(clubsName);

  bool isLoaded = false;

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
    for(int i=0; i<numberClubsTotal; i++) {
      clubsOVR.add(Club(index: i).getOverall());
    }

    for(int i=0; i<numberClubsTotal-1; i++) {
      for(int k=i+1; k<numberClubsTotal; k++) {
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for(int i=0;i<numberClubsTotal;i++)
                              rowClub(i, copyClubsName[i])
                          ],
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

    int realClubIndex = clubsName.indexOf(clubName);
    double overall = clubsOVR[ranking];

    //Cor de Fundo
    Color corFundo = Colors.transparent;
    List listClubsID = League(index: myClub.campeonatoID).getAllClubsIDList();

    if(listClubsID.contains(realClubIndex)){
      corFundo = Colors.blue;
    }
    if(realClubIndex==myClub.clubID){
      corFundo = Colors.redAccent;
    }

    return GestureDetector(
      onTap:(){
        Navigator.push(context,MaterialPageRoute(builder: (context) => ClubProfile(clubID: realClubIndex)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            SizedBox(
                width:30,
                child: Text((ranking+1).toString()+'º',textAlign:TextAlign.end,style: EstiloTextoBranco.text14)
            ),
            Image.asset('assets/clubs/${FIFAImages().imageLogo(clubName)}.png',height: 30,width: 30),
            Expanded(
              child: Container(
                color: corFundo,
                  padding: const EdgeInsets.all(4),
                  child: Text(clubName,style: EstiloTextoBranco.text20)
              ),
            ),
            Text(overall.toStringAsFixed(2),style: EstiloTextoBranco.text16),
          ],
        ),
      ),
    );
}

}