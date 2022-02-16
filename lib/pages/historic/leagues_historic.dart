import 'package:fifa/classes/my.dart';
import 'package:fifa/global/global_variables.dart';
import 'package:fifa/global/images.dart';
import 'package:fifa/pages/historic/my_historic.dart';
import 'package:fifa/theme/button_style.dart';
import 'package:fifa/theme/textstyle.dart';

import 'package:flutter/material.dart';

class HistoricLeague extends StatefulWidget {
  //NECESSARY VARIABLES WHEN CALLING THIS CLASS
  const HistoricLeague({Key? key}) : super(key: key);
  @override
  _HistoricLeagueState createState() => _HistoricLeagueState();
}

class _HistoricLeagueState extends State<HistoricLeague> {

  int choosenLeagueIndex = My().campeonatoID;

////////////////////////////////////////////////////////////////////////////
//                               BUILD                                    //
////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    //_height = MediaQuery.of(context).size.height;
    // bottomSize = MediaQuery.of(context).viewInsets.bottom; //=0 SEM O TECLADO
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
                  children: [

                    const SizedBox(height: 40),
                    const Text('Histórico das ligas',style: EstiloTextoBranco.text22),
                    const SizedBox(height: 8),

                    const Spacer(),


                    ////////////////////////////////////
                    //SELECT LEAGUE
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for(int i=0;i<leaguesListRealIndex.length;i++)
                            leagueRow(i)
                        ],
                      ),
                    ),

                    //VOLTAR
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child:  customButtonContinue(
                          title: 'PRÓXIMO',
                          function: (){
                            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HistoricMy()));
                          }
                      ),
                    ),
                    //VOLTAR
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child:  customButtonContinue(
                          title: 'VOLTAR',
                          function: (){
                            Navigator.pop(context);
                          }
                      ),
                    ),


                  ],
                ),

              ]
          )
      ),
    );
  }
////////////////////////////////////////////////////////////////////////////
//                               WIDGETS                                  //
////////////////////////////////////////////////////////////////////////////
  Widget leagueRow(int league){
    int leagueIndex = leaguesListRealIndex[league];
    return GestureDetector(
      onTap: (){
        choosenLeagueIndex = leagueIndex;
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        color: choosenLeagueIndex == leagueIndex ? Colors.redAccent: Colors.white54,
        child: Image.asset('assets/icons/${FIFAImages().campeonatoLogo(leagueIndex)}.png',height: 50,width: 50,),
      ),
    );
  }
}