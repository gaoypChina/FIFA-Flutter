import 'dart:math';

import 'package:fifa/classes/classification.dart';
import 'package:fifa/classes/club.dart';
import 'package:fifa/global/global_variables.dart';
import 'package:fifa/global/globalfunctions.dart';
import 'package:fifa/global/images.dart';
import 'package:fifa/theme/button_style.dart';
import 'package:fifa/theme/textstyle.dart';

import 'package:flutter/material.dart';

import '../c_menu.dart';

class ChangeClub extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const ChangeClub({Key? key}) : super(key: key);
  @override
  _ChangeClubState createState() => _ChangeClubState();
}

class _ChangeClubState extends State<ChangeClub> {

  //late double _height, _width;

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    //_height = MediaQuery.of(context).size.height;


    int time1 = Random().nextInt(160);
    int time2 = Random().nextInt(160);
    int time3 = Random().nextInt(160);
    int time4 = Random().nextInt(160);
    int time5 = Random().nextInt(160);
    int time6 = Random().nextInt(160);

    return WillPopScope(//IF GO BACK TO PREVIOUS PAGE
      onWillPop: () async{
        return true;
      },
      child: Scaffold(

          resizeToAvoidBottomInset : false, //Evita um overlay quando o layout é maior que a tela
          body:  Stack(
              children: [

                Image.asset('assets/icons/wallpaper.png',height: double.infinity,width: double.infinity,fit: BoxFit.fill),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    const SizedBox(height: 40),
                    const Text('Mudar de time',style: EstiloTextoBranco.text30),


                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            clubWidget(time1),
                            clubWidget(time2),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            clubWidget(time3),
                            clubWidget(time4),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            clubWidget(time5),
                            clubWidget(time6),
                          ],
                        ),
                      ],
                    ),

                    //VOLTAR
                    customButtonContinue(
                        title: 'VOLTAR',
                        function: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Menu()));
                        }
                    ),

                  ],
                )

              ]
          )
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
Widget clubWidget(int clubIndex){
    int chaveClub = Club(index: clubIndex).getChaveLeague();
    int indexLeague = Club(index: clubIndex).getLeagueID();
    int posicaoTabela = Classification(leagueIndex: indexLeague).getClubPosition(clubIndex);
    return GestureDetector(
      onTap: (){
        int indexLeague = Club(index: clubIndex).getLeagueID();
        GlobalFunctions().changeTeam(Club(index: clubIndex).name,indexLeague,chaveClub);
        alreadyChangedClubThisSeason = true;
        Navigator.push(context,MaterialPageRoute(builder: (context) => const Menu()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Image.asset('assets/clubs/${FIFAImages().imageLogo(Club(index: clubIndex).name)}.png',height: 150,width: 150),
            Text(Club(index: clubIndex).name,style: EstiloTextoBranco.text20),
            Text('Posição: '+posicaoTabela.toString()+'º',style: EstiloTextoBranco.text14)
          ],
        ),
      ),
    );
}
}